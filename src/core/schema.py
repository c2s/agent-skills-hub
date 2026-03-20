import re
from datetime import datetime
from enum import Enum
from typing import Any, Dict, List, Optional
from urllib.parse import quote

from pydantic import BaseModel, Field, computed_field, ConfigDict


class SourceType(str, Enum):
    GITHUB = "github"
    NPM = "npm"
    PYPI = "pypi"
    LANGCHAIN = "langchain"
    DIFY = "dify"
    SKILLS_SH = "skills.sh"
    CLAWHUB = "clawhub"
    SMITHERY = "smithery"
    MCP_MARKET = "mcp-market"
    SKILLSMP = "skillsmp"
    CUSTOM = "custom"


class ExecutionMode(str, Enum):
    PYTHON_MODULE = "python-module"
    REST_API = "rest-api"
    PROMPT_CHAIN = "prompt-chain"


class SkillSource(BaseModel):
    type: SourceType
    url: str  # 比如 GitHub 仓库地址，npm 包地址
    revision: Optional[str] = "main"


class FunctionParameter(BaseModel):
    type: str
    description: Optional[str] = None
    properties: Optional[Dict[str, Any]] = None
    required: Optional[List[str]] = None


class AgentFunctionDefinition(BaseModel):
    name: str = Field(..., description="给 agent 识别的函数名称")
    description: str = Field(..., description="函数用途介绍，用于大模型判断是否调用")
    parameters: Optional[FunctionParameter] = None


class AgentFunctionSchema(BaseModel):
    type: str = "function"
    function: AgentFunctionDefinition


class SkillMetrics(BaseModel):
    stars: int = 0
    downloads: int = 0
    last_updated: datetime = Field(default_factory=datetime.utcnow)


def _skills_sh_github_repo_url(skill_id: str, install_uri: str) -> Optional[str]:
    """skills.sh pages are owner/repo/skillId; assets live on GitHub at owner/repo."""
    path: Optional[str] = None
    m_id = re.match(r"skills_sh:(.+)", skill_id)
    if m_id:
        path = m_id.group(1)
    else:
        m_uri = re.search(r"skill://skills_sh/([^@]+)", install_uri)
        if m_uri:
            path = m_uri.group(1)
    if not path:
        return None
    parts = [p for p in path.split("/") if p]
    if len(parts) >= 2:
        return f"https://github.com/{parts[0]}/{parts[1]}"
    return None


def resolve_skill_source_url(
    source_type: SourceType,
    source_url: str,
    skill_id: str,
) -> str:
    """Normalize source page URL (align with static/index.html getSourceUrl)."""
    st = source_type.value if isinstance(source_type, SourceType) else str(source_type)
    if st == SourceType.SKILLS_SH.value and skill_id.startswith("skills_sh:"):
        sh_part = skill_id[len("skills_sh:") :]
        if "/" in sh_part:
            return f"https://skills.sh/{sh_part}"
    return source_url or ""


def compute_skill_download_url(
    *,
    source_type: SourceType,
    source_url: str,
    install_uri: str,
    skill_id: str,
) -> str:
    """
    Direct HTTP URL for fetching skill assets (zip, API, or canonical source page).
    Matches static/index.html getDownloadUrl behavior.
    """
    resolved = resolve_skill_source_url(source_type, source_url, skill_id)
    st = source_type.value if isinstance(source_type, SourceType) else str(source_type)

    if st == SourceType.GITHUB.value and resolved:
        m = re.search(r"@([^/@]+)$", install_uri)
        branch = m.group(1) if m else "main"
        return f"{resolved.rstrip('/')}/archive/refs/heads/{branch}.zip"

    if st == SourceType.CLAWHUB.value:
        m = re.search(r"skill://clawhub/([^/@]+)", install_uri)
        if m:
            slug = m.group(1)
            return (
                "https://wry-manatee-359.convex.site/api/v1/download?slug="
                f"{quote(slug, safe='')}"
            )

    if st == SourceType.SKILLS_SH.value:
        gh = _skills_sh_github_repo_url(skill_id, install_uri)
        if gh:
            return gh

    return resolved


class SkillMetadata(BaseModel):
    """Unified Schema for any Skill"""
    skill_id: str = Field(..., description="全局唯一技能ID，如 github:langchain-ai:finance-tools")
    name: str
    author: str
    description: str
    tags: List[str] = []
    source: SkillSource
    
    metrics: SkillMetrics = Field(default_factory=SkillMetrics)
    
    install_uri: str = Field(..., description="统一的 skill:// 安装链接")
    execution_mode: ExecutionMode
    required_envs: List[str] = []
    remote_updated_at: Optional[int] = Field(0, description="源端的远程更新时间戳")

    agent_tools_schema: List[AgentFunctionSchema] = Field(
        ..., description="大语言模型可理解的函数签名定义"
    )

    model_config = ConfigDict(populate_by_name=True)

    @computed_field
    @property
    def download_url(self) -> str:
        return compute_skill_download_url(
            source_type=self.source.type,
            source_url=self.source.url,
            install_uri=self.install_uri,
            skill_id=self.skill_id,
        )
