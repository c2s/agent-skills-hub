import asyncio
import re
from typing import AsyncGenerator, List, Optional
import httpx
from src.core.schema import SkillMetadata, SourceType, ExecutionMode, SkillSource, SkillMetrics
from src.adapters.base import BaseAdapter

class MCPMarketAdapter(BaseAdapter):
    """
    负责从 https://mcpmarket.com 同步技能。
    注意：该网站有严格的反爬措施，当前实现尝试通过模拟 headers 获取内容。
    """
    
    def __init__(self):
        self.base_url = "https://mcpmarket.com"
        self.search_url = "https://mcpmarket.com/zh/search?type=skills"
        self.headers = {
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
            "Accept-Language": "zh-CN,zh;q=0.9,en;q=0.8",
            "Referer": "https://mcpmarket.com/",
            "Cache-Control": "no-cache",
        }
            
    @property
    def source_type(self) -> str:
        # 定义新的 SourceType 需要在 schema.py 中同步增加，暂时映射为 MARKET
        return "mcp-market"

    async def fetch_skills(self) -> AsyncGenerator[SkillMetadata, None]:
        """
        解析 MCP Market 的技能列表。
        """
        async with httpx.AsyncClient(headers=self.headers, timeout=30.0, follow_redirects=True) as client:
            # 尝试分页抓取
            for page in range(1, 10): # 暂时预设 10 页
                try:
                    url = f"{self.search_url}&page={page}"
                    print(f"DEBUG: MCPMarket Fetching {url}...")
                    response = await client.get(url)
                    
                    if response.status_code == 429 or "Security Checkpoint" in response.text:
                        print(f"DEBUG: MCPMarket Blocked by Vercel Security at page {page}")
                        break
                        
                    if response.status_code != 200:
                        break
                    
                    content = response.text
                    # 基于对 search 页面的分析（假设其结构类似常见的列表卡片）
                    # 下面是通用的基于 <a> 标签和描述类的正则，后续可能需要根据浏览器调试结果修正
                    # 匹配模式：<a href="/zh/skills/xxx">...</a> ... <p>Description</p>
                    pattern = re.compile(r'<a[^>]*href=["\'](/zh/skills/([^"\'>]+))["\'][^>]*>(.*?)</a>', re.IGNORECASE | re.DOTALL)
                    matches = pattern.findall(content)
                    
                    if not matches:
                        print(f"DEBUG: No skills found on page {page}")
                        break
                        
                    for path, slug, raw_name in matches:
                        name = re.sub(r'<[^>]+>', '', raw_name).strip()
                        if not name or len(name) < 2: continue
                        
                        # 尝试提取描述（通常在 a 标签附近的 p 或 span 中）
                        # 这是一个简化的提取逻辑
                        desc_match = re.search(fr'{re.escape(path)}.*?<p[^>]*>(.*?)</p>', content, re.DOTALL | re.IGNORECASE)
                        description = desc_match.group(1).strip() if desc_match else "No description available"
                        description = re.sub(r'<[^>]+>', '', description).strip()
                        
                        yield SkillMetadata(
                            skill_id=f"mcp-market:skill:{slug}",
                            name=name,
                            author="mcp-market",
                            description=description,
                            tags=["mcp-market"],
                            source=SkillSource(
                                type=SourceType.MCP_MARKET,
                                url=f"{self.base_url}{path}"
                            ),
                            metrics=SkillMetrics(),
                            install_uri=f"skill://mcpmarket/{slug}",
                            execution_mode=ExecutionMode.REST_API,
                            required_envs=[],
                            agent_tools_schema=[] 
                        )
                    
                    # 模拟人类阅读延迟
                    await asyncio.sleep(1.0)
                    
                except Exception as e:
                    print(f"Error fetching MCPMarket page {page}: {e}")
                    break

    async def get_skill_detail(self, identifier: str) -> Optional[SkillMetadata]:
        return None
