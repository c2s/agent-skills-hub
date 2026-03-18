import asyncio
import httpx
import json
from src.registry.db import DBManager
from src.core.schema import SkillMetadata, SkillSource, SourceType, ExecutionMode, SkillMetrics
from src.adapters.github_adapter import GitHubAdapter
from src.adapters.skills_sh_adapter import SkillsShAdapter
from src.adapters.mcp_market_adapter import MCPMarketAdapter
from src.adapters.skillsmp_adapter import SkillsMPAdapter

class SyncManager:
    def __init__(self):
        self.db = DBManager()
        self.github_adapter = GitHubAdapter()
        self.skills_sh_adapter = SkillsShAdapter()
        self.mcp_market_adapter = MCPMarketAdapter()
        self.skillsmp_adapter = SkillsMPAdapter()

    async def sync_clawhub(self):
        print("🚀 Syncing from ClawHub (via Convex API)...")
        url = "https://wry-manatee-359.convex.cloud/api/query"
        cursor = None
        total_synced = 0
        
        async with httpx.AsyncClient() as client:
            while True:
                payload = {
                    "path": "skills:listPublicPageV2",
                    "format": "convex_encoded_json",
                    "args": [{"paginationOpts": {"cursor": cursor, "numItems": 100}, "sort": "downloads"}]
                }
                try:
                    resp = await client.post(url, json=payload)
                    resp.raise_for_status()
                    data = resp.json()
                    
                    value = data.get("value", {})
                    page_data = value.get("page", [])
                    
                    for i, item in enumerate(page_data):
                        skill_obj = item.get("skill", {})
                        owner_obj = item.get("owner", {})
                        stats_obj = skill_obj.get("stats", {})
                        
                        slug = skill_obj.get("slug")
                        if not slug:
                            slug = skill_obj.get("_id", owner_obj.get("_id"))
                        
                        # 调试：打印前几个 ID
                        if i < 3 and total_synced < 10:
                            print(f"DEBUG ID: {slug} | Title: {skill_obj.get('displayName')}")
                            
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
                        self.db.save_skill(skill)
                        total_synced += 1
                    
                    cursor = value.get("continueCursor")
                    print(f"  - Synced {total_synced} ClawHub skills so far...")
                    if value.get("isDone") or not page_data:
                        break
                    
                    # 避免请求过快
                    await asyncio.sleep(0.5)
                except Exception as e:
                    print(f"❌ ClawHub Sync Error: {e}")
                    break
        print(f"✅ ClawHub sync complete. Total: {total_synced}")

    async def sync_github_and_others(self):
        """同步 GitHub 标记的技能和 Skills.sh 的热点技能"""
        print("🚀 Syncing from GitHub & Skills.sh...")
        # 直接使用之前的适配器逻辑
        # 因为这两个源规模目前较小，直接遍历并保存
        async for skill in self.github_adapter.fetch_skills():
            self.db.save_skill(skill)
            
        async for skill in self.skills_sh_adapter.fetch_skills():
            self.db.save_skill(skill)

        print("🚀 Syncing from MCP Market...")
        async for skill in self.mcp_market_adapter.fetch_skills():
            self.db.save_skill(skill)
            
        print("🚀 Syncing from SkillsMP...")
        async for skill in self.skillsmp_adapter.fetch_skills():
            self.db.save_skill(skill)
            
        print("✅ Meta-sources sync complete.")

    async def full_sync(self):
        # 建议先同步量大的 ClawHub
        await self.sync_clawhub()
        await self.sync_github_and_others()

if __name__ == "__main__":
    man = SyncManager()
    asyncio.run(man.full_sync())
