from datetime import datetime
from enum import Enum
from typing import Any, Dict, List, Optional
from pydantic import BaseModel, HttpUrl, Field


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

    class Config:
        populate_by_name = True
