import sys
import os
import asyncio
import uvicorn
from contextlib import asynccontextmanager
from fastapi import FastAPI

# 确保 src 目录在 Python 路径中
sys.path.append(os.path.join(os.path.dirname(__file__), "src"))

from src.api.main import app
from src.registry.sync_service import SyncManager

# 初始化同步管理器
sync_manager = SyncManager()

@asynccontextmanager
async def lifespan(app: FastAPI):
    # 启动时：开启调度器并运行初始同步
    print("🚀 [System] Starting integrated services...")
    sync_manager.start_scheduler()
    
    # 可以在这里选择是否立即执行一次同步
    # asyncio.create_task(sync_manager.run_sync_task())
    
    yield
    
    # 关闭时：可以在这里执行清理工作
    print("🛑 [System] Shutting down integrated services...")

# 将 lifespan 挂载到现有的 app
original_lifespan = app.router.lifespan_context

@asynccontextmanager
async def combined_lifespan(app: FastAPI):
    async with lifespan(app):
        # 如果原始 app 也有 lifespan，则嵌套调用
        # 目前 src/api/main.py 中没有定义 lifespan，所以直接 yield 即可
        yield

app.router.lifespan_context = combined_lifespan

if __name__ == "__main__":
    print("✨ Skill Meta-Registry Unified Launcher")
    port = int(os.environ.get("PORT", 8000))
    reload = os.environ.get("RAILWAY_ENVIRONMENT") is None  # 本地开发启用 reload，Railway 上禁用
    uvicorn.run("run:app", host="0.0.0.0", port=port, reload=reload)
