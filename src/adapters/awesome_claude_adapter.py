
import httpx
import re
from typing import AsyncGenerator, Optional
from src.core.schema import SkillMetadata, SourceType, ExecutionMode, SkillSource, SkillMetrics
from src.adapters.base import BaseAdapter

class GitHubAwesomeAdapter(BaseAdapter):
    """
    负责从多个 GitHub Awesome 仓库同步技能。
    解析 README.md 中的工具列表。
    """
    
    def __init__(self):
        self.sources = [
            "https://raw.githubusercontent.com/hesreallyhim/awesome-claude-code/main/README.md",
            "https://raw.githubusercontent.com/modelcontextprotocol/servers/main/README.md",
            "https://raw.githubusercontent.com/punkpeye/awesome-mcp-servers/main/README.md",
            "https://raw.githubusercontent.com/MobinX/awesome-mcp-list/main/README.md",
            "https://raw.githubusercontent.com/heilcheng/awesome-agent-skills/main/README.md"
        ]
        self.headers = {
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        }
            
    @property
    def source_type(self) -> str:
        return SourceType.GITHUB.value

    async def fetch_skills(self) -> AsyncGenerator[SkillMetadata, None]:
        """
        遍历所有配置的 Awesome 仓库解析技能列表。
        """
        async with httpx.AsyncClient(headers=self.headers, timeout=30.0) as client:
            for url in self.sources:
                try:
                    print(f"DEBUG: GitHubAwesome Fetching {url}...")
                    response = await client.get(url)
                    if response.status_code != 200:
                        print(f"DEBUG: GitHubAwesome Fetch error: {response.status_code}")
                        continue
                    
                    content = response.text
                    # 匹配多种常见 Markdown 列表格式: 
                    # - [Name](Link) Description
                    # - **[Name](Link)** - Description
                    # - [Name](Link) 🎖️ - Description
                    pattern = re.compile(r'^- \s*(\*\*)?\[(.*?)\]\((.*?)\)(\*\*)?\s*.*?[-:]?\s*(.*)$', re.MULTILINE)
                    matches = pattern.findall(content)
                    
                    print(f"DEBUG: Found {len(matches)} potential tools in {url}.")
                    
                    for _, name, link, _, desc in matches:
                        # 过滤掉非链接或非 GitHub 链接的无效行
                        if not link.startswith("http"):
                            continue
                        
                        # 唯一标识使用作者+名称，避免跨源重复
                        author = "community"
                        if "github.com/" in link:
                            parts = link.split("github.com/")[1].split("/")
                            if len(parts) >= 2:
                                author = parts[0]
                                repo_name = parts[1]
                            elif len(parts) == 1:
                                author = parts[0]
                                repo_name = name.lower()
                        else:
                            repo_name = name.lower()

                        repo_name = repo_name.replace(' ', '-').strip()
                        
                        # 清理描述中的额外 Markdown
                        desc = re.sub(r'\[(.*?)\]\(.*?\)', r'\1', desc).strip()
                        desc = re.sub(r'[*_`]', '', desc) # 去除加粗斜体等
                        
                        yield SkillMetadata(
                            skill_id=f"github:awesome:{author}:{repo_name}",
                            name=name.strip(),
                            author=author,
                            description=desc,
                            tags=["awesome-list"],
                            source=SkillSource(
                                type=SourceType.GITHUB,
                                url=link
                            ),
                            metrics=SkillMetrics(),
                            install_uri=f"skill://github/{author}/{repo_name}",
                            execution_mode=ExecutionMode.REST_API,
                            required_envs=[],
                            agent_tools_schema=[] 
                        )
                except Exception as e:
                    print(f"Error fetching source {url}: {e}")

    async def get_skill_detail(self, identifier: str) -> Optional[SkillMetadata]:
        return None
