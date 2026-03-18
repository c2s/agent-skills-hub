
import httpx
import asyncio
from typing import AsyncGenerator, Optional
from src.core.schema import SkillMetadata, SourceType, ExecutionMode, SkillSource, SkillMetrics
from src.adapters.base import BaseAdapter

class SmitheryAdapter(BaseAdapter):
    """
    负责从 Smithery.ai 抓取 Agent 技能 (Servers).
    接口文档暗示: https://api.smithery.ai/servers
    """
    
    def __init__(self):
        self.api_url = "https://api.smithery.ai/skills"
        self.headers = {
            "Accept": "application/json",
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        }
            
    @property
    def source_type(self) -> str:
        return SourceType.SMITHERY.value

    async def fetch_skills(self) -> AsyncGenerator[SkillMetadata, None]:
        """
        从 Smithery.ai 全量同步 Skills (12w+ 规模).
        由于数据量极大，建议增量或分步同步。
        """
        page = 1
        page_size = 100 
        async with httpx.AsyncClient(headers=self.headers, timeout=60.0) as client:
            while True:
                try:
                    url = f"{self.api_url}?page={page}&pageSize={page_size}"
                    print(f"DEBUG: Smithery Skills Fetching {url}...")
                    response = await client.get(url)
                    if response.status_code != 200:
                        print(f"DEBUG: Smithery API error: {response.status_code}")
                        break
                    
                    data = response.json()
                    skills_list = data.get("skills", [])
                    pagination = data.get("pagination", {})
                    total_pages = pagination.get("totalPages", 1)
                    
                    print(f"DEBUG: Found {len(skills_list)} skills on page {page}/{total_pages}.")
                    
                    if not skills_list:
                        break
                    
                    for item in skills_list:
                        # 唯一标识使用 namespace/slug
                        slug = item.get("slug")
                        namespace = item.get("namespace")
                        if not slug or not namespace:
                            continue
                            
                        full_slug = f"{namespace}/{slug}"
                        name = item.get("displayName") or slug
                        description = item.get("description") or ""
                        
                        yield SkillMetadata(
                            skill_id=f"smithery:{full_slug}",
                            name=name,
                            author=namespace,
                            description=description,
                            tags=item.get("categories", []),
                            source=SkillSource(
                                type=SourceType.SMITHERY,
                                url=f"https://smithery.ai/skills/{full_slug}"
                            ),
                            metrics=SkillMetrics(
                                stars=int(item.get("upvotes") or 0),
                                downloads=int(item.get("totalActivations") or 0)
                            ),
                            install_uri=f"skill://smithery/{full_slug}@latest",
                            execution_mode=ExecutionMode.REST_API,
                            required_envs=[],
                            agent_tools_schema=[] 
                        )
                    
                    if page >= total_pages:
                        break
                    page += 1
                    # 对于 12w 数据，不加 sleep 可能会被封 IP
                    await asyncio.sleep(0.1)
                except Exception as e:
                    print(f"Error fetching Smithery API: {e}")
                    break

    async def get_skill_detail(self, identifier: str) -> Optional[SkillMetadata]:
        """按标识符获取详情 (暂未实现)"""
        return None
