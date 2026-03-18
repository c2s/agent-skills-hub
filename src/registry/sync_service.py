import asyncio
import httpx
import json
import time
from apscheduler.schedulers.asyncio import AsyncIOScheduler
from src.registry.db import DBManager
from src.core.schema import SkillMetadata, SkillSource, SourceType, ExecutionMode, SkillMetrics
from src.adapters.github_adapter import GitHubAdapter
from src.adapters.skills_sh_adapter import SkillsShAdapter
from src.adapters.smithery_adapter import SmitheryAdapter
from src.adapters.awesome_claude_adapter import GitHubAwesomeAdapter
from src.adapters.mcp_market_adapter import MCPMarketAdapter
from src.adapters.skillsmp_adapter import SkillsMPAdapter

class SyncManager:
    def __init__(self):
        self.db = DBManager()
        self.github_adapter = GitHubAdapter()
        self.skills_sh_adapter = SkillsShAdapter()
        self.smithery_adapter = SmitheryAdapter()
        self.github_awesome_adapter = GitHubAwesomeAdapter()
        self.mcp_market_adapter = MCPMarketAdapter()
        self.skillsmp_adapter = SkillsMPAdapter()
        self.scheduler = AsyncIOScheduler()

    async def sync_clawhub(self, incremental: bool = True):
        """
        同步从 ClawHub 抓取数据。
        如果 incremental=True，则在发现已有且未更新的数据时停止翻页。
        """
        source_type = SourceType.CLAWHUB.value
        last_remote_ts = self.db.get_last_remote_updated(source_type)
        print(f"🚀 Syncing from ClawHub (Incremental: {incremental}, Last TS: {last_remote_ts})...")
        
        url = "https://wry-manatee-359.convex.cloud/api/query"
        cursor = None
        total_synced = 0
        new_items_count = 0
        
        async with httpx.AsyncClient(timeout=30.0) as client:
            while True:
                payload = {
                    "path": "skills:listPublicPageV2",
                    "format": "convex_encoded_json",
                    "args": [{"paginationOpts": {"cursor": cursor, "numItems": 50}, "sort": "downloads"}]
                }
                try:
                    resp = await client.post(url, json=payload)
                    resp.raise_for_status()
                    data = resp.json()
                    
                    value = data.get("value", {})
                    page_data = value.get("page", [])
                    
                    if not page_data:
                        break

                    page_has_new = False
                    for item in page_data:
                        skill_obj = item.get("skill", {})
                        owner_obj = item.get("owner", {})
                        stats_obj = skill_obj.get("stats", {})
                        
                        updated_at = int(skill_obj.get("updatedAt", 0))
                        slug = skill_obj.get("slug")
                        if not slug:
                            slug = skill_obj.get("_id")

                        # 映射为我们统一定义的模型
                        skill = SkillMetadata(
                            skill_id=f"clawhub:{slug}",
                            name=skill_obj.get("displayName", "Untitled"),
                            author=owner_obj.get("handle", "community"),
                            description=skill_obj.get("summary", ""),
                            source=SkillSource(type=SourceType.CLAWHUB, url=f"https://clawhub.ai/skills/{slug}"),
                            install_uri=f"skill://clawhub/{slug}@main",
                            execution_mode=ExecutionMode.PROMPT_CHAIN,
                            metrics=SkillMetrics(
                                stars=int(stats_obj.get("stars", 0)), 
                                downloads=int(stats_obj.get("downloads", 0))
                            ),
                            agent_tools_schema=[]
                        )
                        # 注入时间戳用于增量判断
                        setattr(skill, 'remote_updated_at', updated_at)
                        
                        # 判断是否为增量更新
                        if updated_at > last_remote_ts:
                            self.db.save_skill(skill)
                            new_items_count += 1
                            page_has_new = True
                        
                        total_synced += 1

                    # 如果是增量模式且本页没有一个是新的（且我们已经同步过不少数据了），则说明已经追上进度
                    # 注意：由于 ClawHub API 目前只能通过 downloads 排序，这里需要全量对比或者扫描足够深度
                    # 为了演示增量，我们假设扫描前 5 页 (250条) 如果都没新的就开始停止。
                    if incremental and not page_has_new and total_synced > 250:
                        print("  - [Incremental] No new updates found in recent pages. Stopping.")
                        break

                    cursor = value.get("continueCursor")
                    print(f"  - Processed {total_synced} items, {new_items_count} were new/updated.")
                    
                    if value.get("isDone"):
                        break
                    
                    await asyncio.sleep(0.3)
                except Exception as e:
                    print(f"❌ ClawHub Sync Error: {e}")
                    break
        print(f"✅ ClawHub sync complete. Processed: {total_synced}, New/Updated: {new_items_count}")

    async def sync_others(self):
        """同步 GitHub & Skills.sh & Smithery & Awesome Claude"""
        print("🚀 Syncing from Others (GitHub, Skills.sh, Smithery, Awesome Claude)...")
        async for skill in self.github_adapter.fetch_skills():
            self.db.save_skill(skill)
        async for skill in self.skills_sh_adapter.fetch_skills():
            self.db.save_skill(skill)
        async for skill in self.smithery_adapter.fetch_skills():
            self.db.save_skill(skill)
        async for skill in self.github_awesome_adapter.fetch_skills():
            self.db.save_skill(skill)
        async for skill in self.mcp_market_adapter.fetch_skills():
            self.db.save_skill(skill)
        async for skill in self.skillsmp_adapter.fetch_skills():
            self.db.save_skill(skill)
        print("✅ Others sync complete.")

    async def run_sync_task(self):
        print(f"\n⏰ [{time.strftime('%Y-%m-%d %H:%M:%S')}] Starting Scheduled Sync...")
        await self.sync_clawhub(incremental=True)
        await self.sync_others()
        print(f"🏁 [{time.strftime('%Y-%m-%d %H:%M:%S')}] Scheduled Sync Finished.\n")

    def start_scheduler(self):
        # 每一小时同步一次
        self.scheduler.add_job(self.run_sync_task, 'interval', hours=1, next_run_time=time.strftime('%Y-%m-%d %H:%M:%S'))
        self.scheduler.start()
        print("🕒 Scheduler started: Will sync every 1 hour.")

if __name__ == "__main__":
    man = SyncManager()
    # 手动测试运行一次并开启调度器保持进程运行
    async def main():
        # 这里为了演示，先执行一次，然后保持循环
        await man.run_sync_task()
        man.start_scheduler()
        while True:
            await asyncio.sleep(60)
            
    try:
        asyncio.run(main())
    except (KeyboardInterrupt, SystemExit):
        pass
