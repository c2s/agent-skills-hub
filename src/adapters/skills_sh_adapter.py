import httpx
import asyncio
from typing import AsyncGenerator, Optional
from src.core.schema import SkillMetadata, SourceType, ExecutionMode, SkillSource, SkillMetrics
from src.adapters.base import BaseAdapter


class SkillsShAdapter(BaseAdapter):
    """
    负责从 skills.sh 抓取 Agent Skills
    假设 skills.sh 提供了类似 RESTful API 或可以解析其站内索引。
    """
    
    def __init__(self):
        self.api_base_url = "https://skills.sh/api"
        self.headers = {
            "Accept": "application/json",
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        }
            
    @property
    def source_type(self) -> str:
        return SourceType.SKILLS_SH.value

    async def fetch_skills(self) -> AsyncGenerator[SkillMetadata, None]:
        """
        利用 Skills.sh 的 'All Time' 分页接口进行全量数据抓取。
        接口路径: https://skills.sh/api/skills/all-time/{page}
        每页约 100 条。
        """
        page = 1
        async with httpx.AsyncClient(headers=self.headers, timeout=30.0) as client:
            while True:
                try:
                    url = f"{self.api_base_url}/skills/all-time/{page}"
                    print(f"DEBUG: Internal Fetching {url}...")
                    response = await client.get(url)
                    print(f"DEBUG: Response Status: {response.status_code}")
                    
                    if response.status_code != 200:
                        print(f"DEBUG: Non-200 status, breaking loop.")
                        break
                        
                    data = response.json()
                    skills_list = data.get("skills", [])
                    print(f"DEBUG: Found {len(skills_list)} skills in data.")
                    
                    if not skills_list:
                        print(f"DEBUG: No more skills on page {page}, finished.")
                        break
                    
                    for item in skills_list:
                        # 核心修复：API 使用 'skillId' 和 'source' 来标识，而非 'id'
                        # source 格式通常为 "owner/repo"
                        source_slug = item.get("source")
                        skill_id_raw = item.get("skillId")
                        
                        if not source_slug or not skill_id_raw:
                            # 尝试兼容性检查，如果 API 结构极其特殊
                            full_id = item.get("id") or f"{source_slug}/{skill_id_raw}"
                        else:
                            full_id = f"{source_slug}/{skill_id_raw}"
                            
                        # 为了保持向前兼容性和 URL 构建一致性
                        name = item.get("name") or skill_id_raw or "unknown"
                        author = source_slug.split("/")[0] if source_slug and "/" in source_slug else (source_slug or "community")
                        
                        yield SkillMetadata(
                            skill_id=f"skills_sh:{full_id}",
                            name=name,
                            author=author,
                            description=f"Automated skill from Skills.sh: {name}",
                            tags=[],
                            source=SkillSource(
                                type=SourceType.SKILLS_SH,
                                url=f"https://skills.sh/{full_id}"
                            ),
                            metrics=SkillMetrics(
                                stars=0, 
                                downloads=int(item.get("installs", 0))
                            ),
                            install_uri=f"skill://skills_sh/{full_id}@latest",
                            execution_mode=ExecutionMode.REST_API,
                            required_envs=[],
                            agent_tools_schema=[] 
                        )
                    
                    # 翻页
                    page += 1
                    # 适当延迟以示友好
                    await asyncio.sleep(0.5) 
                    
                except Exception as e:
                    print(f"Error fetching Skills.sh page {page}: {e}")
                    break

    async def get_skill_detail(self, identifier: str) -> Optional[SkillMetadata]:
        # 实现查询单个 Detail 的逻辑
        pass
