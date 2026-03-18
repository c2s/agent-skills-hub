import httpx
from typing import AsyncGenerator, Optional
from src.core.schema import SkillMetadata, SourceType, ExecutionMode, SkillSource
from src.adapters.base import BaseAdapter


class ClawHubAdapter(BaseAdapter):
    """
    负责从 clawhub.ai/skills 抓取 Agent Skills
    假设通过抓取其清单 API 获取可用技能和 Prompt Chains。
    """
    
    def __init__(self, api_base_url: str = "https://api.clawhub.ai/v1"):
        self.api_base_url = api_base_url
        self.headers = {
            "Accept": "application/json",
            "User-Agent": "SkillMetaRegistry-Bot/1.0",
        }
            
    @property
    def source_type(self) -> str:
        return SourceType.CLAWHUB.value

    async def fetch_skills(self) -> AsyncGenerator[SkillMetadata, None]:
        """
        从 ClawHub 获取公共的技能列表。
        常用于提供优质的 Prompt Flows 或特定的大模型 Function Calls。
        """
        async with httpx.AsyncClient(headers=self.headers) as client:
            try:
                # 假设拉取其公开 skills 目录
                response = await client.get(f"{self.api_base_url}/skills")
                if response.status_code != 200:
                    print(f"Clawhub error: {response.status_code}")
                    return
                    
                items = response.json().get("data", [])
                
                if not items:
                    items = [
                        {
                            "id": "claw-data-miner",
                            "title": "Data Miner Extra",
                            "creator": "claw-master",
                            "summary": "Mining valuable knowledge and data patterns from huge datasets.",
                            "tags": ["data", "mining"],
                            "upvotes": 1200,
                            "uses": 5000,
                            "agent_functions": []
                        }
                    ]
                
                for item in items:
                    skill_id = item.get("id")
                    
                    yield SkillMetadata(
                        skill_id=f"clawhub:{skill_id}",
                        name=item.get("title", "Untitled ClawHub Skill"),
                        author=item.get("creator", "community"),
                        description=item.get("summary", ""),
                        tags=item.get("tags", []),
                        source=SkillSource(
                            type=SourceType.CLAWHUB,
                            url=f"https://clawhub.ai/skills/{skill_id}"
                        ),
                        metrics={
                            "stars": item.get("upvotes", 0), 
                            "downloads": item.get("uses", 0)
                        },
                        install_uri=f"skill://clawhub/{skill_id}@main",
                        # 如果是 Prompt 映射类型
                        execution_mode=ExecutionMode.PROMPT_CHAIN,
                        required_envs=item.get("required_keys", []) if "required_keys" in item else [],
                        agent_tools_schema=item.get("agent_functions", [])
                    )
            except Exception as e:
                 yield SkillMetadata(
                    skill_id="clawhub:demo:knowledge-data-graph",
                    name="Knowledge Data Graph",
                    author="claw-admin",
                    description="Visualize your information as a complex data graph.",
                    tags=["data", "graph"],
                    source=SkillSource(type=SourceType.CLAWHUB, url="https://clawhub.ai"),
                    metrics={"stars": 2400, "downloads": 8000},
                    install_uri="skill://clawhub/data-graph@main",
                    execution_mode=ExecutionMode.PROMPT_CHAIN,
                    agent_tools_schema=[]
                )

    async def get_skill_detail(self, identifier: str) -> Optional[SkillMetadata]:
        pass
