import time
from fastapi import FastAPI, HTTPException, Depends
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from typing import List, Dict, Any, Optional, Tuple
from src.core.schema import SkillMetadata
from src.registry.engine import RetrievalEngine

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

@app.get("/api/v1/skills/search", response_model=SkillSearchResponse)
async def search_skills(query: str = "", limit: int = 20, offset: int = 0, category: str = "all"):
    """
    Agent 或 Web 发起搜索，支持分页和分类过滤（缓存 5 分钟）
    """
    cache_key = f"search:{query}:{category}:{limit}:{offset}"
    cached = _cache_get(cache_key)
    if cached is not None:
        return cached
    source_type = category if category != "all" else None
    results, total = await engine.search(query, limit=limit, offset=offset, source_type=source_type)
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


@app.get("/api/v1/skills/categories")
async def get_categories():
    """分类及技能数量（缓存 5 分钟）"""
    cache_key = "categories"
    cached = _cache_get(cache_key)
    if cached is not None:
        return cached
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
