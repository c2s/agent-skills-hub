import httpx
from typing import List, Dict, Any

# ==========================================
# 这两个函数需要注册到任意的底层 Agent 框架
# 比如 LangChain BaseTool 或者 OpenAI Function Schema
# ==========================================

REGISTRY_URL = "http://localhost:8000"

async def find_skills_in_registry(query: str, limit: int = 5) -> List[Dict]:
    """
    系统函数: 当 Agent 发现内部能力不够时，调用此函数向异构市场寻找工具。
    """
    async with httpx.AsyncClient() as client:
        resp = await client.get(f"{REGISTRY_URL}/api/v1/skills/search", params={"query": query, "limit": limit})
        if resp.status_code == 200:
            return resp.json()
        return [{"error": "无法连接到 Skill Meta-Registry"}]

async def install_and_mount_skill(install_uri: str, config: Dict[str, str]) -> Dict[str, Any]:
    """
    系统函数: Agent 根据 find_skills_in_registry 推荐的 install_uri，决定安装配置。
    config 字典应包含该技能需要的 `required_envs` (如 API Keys)。
    """
    async with httpx.AsyncClient() as client:
        resp = await client.post(
            f"{REGISTRY_URL}/api/v1/skills/mount",
            params={"install_uri": install_uri},
            json=config
        )
        if resp.status_code == 200:
            return resp.json()
        return {"error": resp.text}
