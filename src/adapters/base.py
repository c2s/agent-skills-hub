import abc
from typing import AsyncGenerator, Optional
from src.core.schema import SkillMetadata


class BaseAdapter(abc.ABC):
    """
    数据源适配器基类，任何新增的市场源都需要实现此接口
    以转换为统一的 SkillMetadata
    """
    
    @property
    @abc.abstractmethod
    def source_type(self) -> str:
        """返回适配器对应的数据源类型 (如 github)"""
        pass
    
    @abc.abstractmethod
    async def fetch_skills(self) -> AsyncGenerator[SkillMetadata, None]:
        """
        获取当前平台支持的所有技能或热点技能列表。
        可通过分页 Yield 出 `SkillMetadata`。
        """
        pass
        
    @abc.abstractmethod
    async def get_skill_detail(self, identifier: str) -> Optional[SkillMetadata]:
        """
        根据平台的标识符获取特定 Skill 的详情
        """
        pass
