import time
from fastapi import FastAPI, HTTPException, Depends, Query
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from typing import List, Dict, Any, Optional, Tuple, Annotated
from src.core.schema import SkillMetadata
from src.registry.engine import RetrievalEngine
from src.registry.agent_list_loader import load_agents

from pydantic import BaseModel

# 列表接口缓存，5 分钟过期
CACHE_TTL = 300  # seconds
_cache: Dict[str, Tuple[Any, float]] = {}


def _cache_get(key: str) -> Optional[Any]:
    if key in _cache:
        data, expire_at = _cache[key]
        if time.time() < expire_at:
            return data
        del _cache[key]
    return None


def _cache_set(key: str, data: Any) -> None:
    _cache[key] = (data, time.time() + CACHE_TTL)


class SkillSearchResponse(BaseModel):
    total: int
    results: List[SkillMetadata]


def _flatten_query_params(query: Optional[List[str]]) -> List[str]:
    if not query:
        return []
    out: List[str] = []
    for q in query:
        if q is None:
            continue
        for part in str(q).split(","):
            p = part.strip()
            if p:
                out.append(p)
    return out


class AgentRegistryRecord(BaseModel):
    """Curated agent row from resources/agent-list.xlsx (+ optional links)."""

    id: int
    name: str
    organization: str = ""
    agent_type: str = ""
    category_tier: str = ""
    open_source: str = ""
    scenarios: str = ""
    positioning: str = ""
    focus_areas: str = ""
    technical_strengths: str = ""
    limitations: str = ""
    recommendation_level: str = ""
    notes: str = ""
    website: Optional[str] = None
    documentation: Optional[str] = None

app = FastAPI(
    title="Skill Meta-Registry",
    description="为 Agent 提供统一的技能发现与按需挂载协议",
    version="0.1.0"
)

# 全局单例引擎
engine = RetrievalEngine()

# 挂载静态文件
app.mount("/static", StaticFiles(directory="static"), name="static")

@app.get("/", include_in_schema=False)
async def root():
    return FileResponse("static/index.html")


@app.get("/documentation", include_in_schema=False)
async def documentation():
    return FileResponse("static/docs.html")


@app.get("/agents", include_in_schema=False)
async def agents_page():
    return FileResponse("static/agents.html")


@app.get("/agent", include_in_schema=False)
async def agent_detail_page():
    return FileResponse("static/agent-detail.html")

@app.get("/api/v1/skills/search", response_model=SkillSearchResponse)
async def search_skills(
    query: Annotated[
        Optional[List[str]],
        Query(
            description="搜索词；可重复 query=a&query=b 或 query=a,b,c。缺省或全空则不做关键词筛选（全库按下载量分页）",
        ),
    ] = None,
    limit: int = 20,
    offset: int = 0,
    category: str = "all",
):
    """
    Agent 或 Web 发起搜索，支持多关键词、分页和分类过滤（缓存 5 分钟）。
    未传 query 或均为空时返回全库排序结果（不按关键词过滤）。
    """
    flat = _flatten_query_params(query)
    cache_key = f"search:{','.join(flat)}:{category}:{limit}:{offset}"
    cached = _cache_get(cache_key)
    if cached is not None:
        return cached
    source_type = category if category != "all" else None
    results, total = await engine.search(flat, limit=limit, offset=offset, source_type=source_type)
    resp = {"results": results, "total": total}
    _cache_set(cache_key, resp)
    return resp


@app.get("/api/v1/skills/top100", response_model=List[SkillMetadata])
async def get_top_100():
    """Top 100 热度排行（缓存 5 分钟）"""
    cache_key = "top100"
    cached = _cache_get(cache_key)
    if cached is not None:
        return cached
    results, _ = await engine.get_top_100()
    _cache_set(cache_key, results)
    return results


def _agent_locale(lang: str) -> str:
    return "en" if (lang or "").strip().lower().startswith("en") else "zh"


@app.get("/api/v1/agents", response_model=List[AgentRegistryRecord])
async def list_agent_registry(lang: str = Query("zh", description="zh | en")):
    """Curated Agent 列表（xlsx + agent-locale.en.json，缓存 5 分钟）"""
    loc = _agent_locale(lang)
    cache_key = f"agent_registry:list:{loc}"
    cached = _cache_get(cache_key)
    if cached is not None:
        return cached
    rows = load_agents(loc)
    _cache_set(cache_key, rows)
    return rows


@app.get("/api/v1/agents/{agent_id}", response_model=AgentRegistryRecord)
async def get_agent_registry(agent_id: int, lang: str = Query("zh", description="zh | en")):
    """单个 Agent 详情（与列表同源缓存，语言与列表一致）"""
    loc = _agent_locale(lang)
    cache_key = f"agent_registry:list:{loc}"
    rows = _cache_get(cache_key)
    if rows is None:
        rows = load_agents(loc)
        _cache_set(cache_key, rows)
    for r in rows:
        if r.get("id") == agent_id:
            return r
    raise HTTPException(status_code=404, detail="Agent not found")


@app.get("/api/v1/skills/categories")
async def get_categories(
    query: Annotated[
        Optional[List[str]],
        Query(
            description="可选，与 /skills/search 相同；传入时返回该关键词筛选下各分类条数，不传则为全库统计",
        ),
    ] = None,
):
    """分类及技能数量（缓存 5 分钟）；带 query 时与搜索筛选一致"""
    flat = _flatten_query_params(query)
    cache_key = f"categories:{','.join(flat)}"
    cached = _cache_get(cache_key)
    if cached is not None:
        return cached
    if flat:
        counts = await engine.get_category_counts_for_terms(flat)
    else:
        counts = await engine.get_category_counts()
    result = [{"name": "all", "count": counts.get("all", 0)}]
    others = [(cat, counts[cat]) for cat in counts if cat != "all"]
    others.sort(key=lambda x: x[1], reverse=True)
    result.extend([{"name": cat, "count": cnt} for cat, cnt in others])
    _cache_set(cache_key, result)
    return result


@app.post("/api/v1/skills/mount")
async def mount_skill(install_uri: str, envs: Dict[str, str]):
    """
    接收 Agent 请求，执行下载/连接协议并暴露函数。
    """
    # 模拟检查与挂载逻辑
    # 实际会解析 install_uri，比如 `skill://github/langchain-ai/finance-tools@main`
    if not install_uri.startswith("skill://"):
        raise HTTPException(status_code=400, detail="Invalid URI scheme protocol")
        
    print(f"Mounting {install_uri} with envs {envs.keys()}")
    
    return {
        "status": "success",
        "message": f"Skill {install_uri} mounted successfully",
        "mounted_functions": [
            # 应该返回给大模型的那些函数签名
        ]
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
