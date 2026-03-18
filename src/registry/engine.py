import asyncio
from typing import List, Optional
from src.core.schema import SkillMetadata
from src.registry.db import DBManager
from src.registry.sync_manager import SyncManager

class RetrievalEngine:
    """
    检索与打分引擎：优先从本地 MySQL (Fulltext) 检索全量数据。
    """
    def __init__(self):
        self.db = DBManager()
        self.sync_manager = SyncManager()
        
    async def search(self, query: str, limit: int = 20, offset: int = 0, source_type: Optional[str] = None) -> tuple[List[SkillMetadata], int]:
        """
        从本地全量索引中检索，支持分页和分类过滤。
        """
        return self.db.search_skills(query, limit=limit, offset=offset, source_type=source_type)

    async def get_top_100(self) -> tuple[List[SkillMetadata], int]:
        """获取全平台 Star 排行前 100 的技能"""
        return self.db.get_top_skills(limit=100)
    
    async def get_category_counts(self) -> dict[str, int]:
        """获取各分类下的技能数量"""
        return self.db.get_category_counts()

    def get_categories(self) -> List[str]:
        return self.db.get_all_categories()

    async def index_skill(self, skill: SkillMetadata):
        """将技能手动存入本地索引"""
        self.db.save_skill(skill)
        
    async def trigger_sync(self):
        """手动触发同步全量数据"""
        await self.sync_manager.full_sync()
