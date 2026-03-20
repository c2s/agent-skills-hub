import httpx
import yaml
from typing import AsyncGenerator, Optional
from src.core.schema import SkillMetadata, SourceType, ExecutionMode, SkillSource
from src.adapters.base import BaseAdapter


class GitHubAdapter(BaseAdapter):
    """
    负责从 GitHub 搜索和抓取 Agent Skills
    由于实现 MVP，这里演示基于特定 GitHub Topic (`agent-skill`) 进行检索
    或特定的预定义索引仓库拉取。
    """
    
    def __init__(self, github_token: Optional[str] = None):
        self.github_token = github_token
        self.headers = {
            "Accept": "application/vnd.github.v3+json",
        }
        if self.github_token:
            self.headers["Authorization"] = f"token {self.github_token}"
            
    @property
    def source_type(self) -> str:
        return SourceType.GITHUB.value

    async def fetch_skills(self) -> AsyncGenerator[SkillMetadata, None]:
        """
        基于 GitHub Rest API 搜索包含 `agent-skill` 标签的仓库
        并解析其下的 `skill.yaml`。
        """
        # 代理/慢网络下默认 5s 连接超时易触发 ConnectTimeout；单条失败不应中断整次同步
        timeout = httpx.Timeout(60.0, connect=30.0)
        async with httpx.AsyncClient(headers=self.headers, timeout=timeout) as client:
            # MVP: 搜索携带 agent-skill 的仓库
            query = "topic:agent-skill"
            url = f"https://api.github.com/search/repositories?q={query}&sort=stars&order=desc"
            try:
                response = await client.get(url)
            except httpx.RequestError as e:
                print(f"Error fetching GitHub search API: {e}")
                return
            if response.status_code != 200:
                print(f"Error fetching from GitHub: {response.text}")
                return

            data = response.json()
            items = data.get("items", [])

            for item in items:
                # 对于查到的仓库，尝试去抓取其默认分支下的 skill.yaml
                full_name = item.get("full_name")
                stars = item.get("stargazers_count", 0)
                default_branch = item.get("default_branch", "main")

                raw_url = f"https://raw.githubusercontent.com/{full_name}/{default_branch}/skill.yaml"
                try:
                    yaml_resp = await client.get(raw_url)
                except httpx.RequestError as e:
                    print(f"⚠️ Skip {full_name} (fetch skill.yaml): {e}")
                    continue

                if yaml_resp.status_code == 200:
                    try:
                        content = yaml.safe_load(yaml_resp.text)

                        # 构建统一下发的模型
                        yield SkillMetadata(
                            skill_id=f"github:{full_name}",
                            name=content.get("name", item.get("name")),
                            author=item.get("owner", {}).get("login", "unknown"),
                            description=content.get("description", item.get("description", "")),
                            tags=content.get("tags", []),
                            source=SkillSource(
                                type=SourceType.GITHUB,
                                url=item.get("html_url"),
                                revision=default_branch
                            ),
                            metrics={"stars": stars, "downloads": 0},
                            install_uri=f"skill://github/{full_name}@{default_branch}",
                            execution_mode=ExecutionMode(content.get("execution_mode", ExecutionMode.PYTHON_MODULE)),
                            required_envs=content.get("required_envs", []),
                            agent_tools_schema=content.get("agent_tools_schema", [])
                        )
                    except Exception as e:
                        print(f"Failed to parse skill.yaml for {full_name}: {e}")

    async def get_skill_detail(self, identifier: str) -> Optional[SkillMetadata]:
        """对于特定标识符(e.g., langchain-ai/finance-tools)抓取详细信息"""
        # (类似上述单个仓库查询流程的简化)
        pass
