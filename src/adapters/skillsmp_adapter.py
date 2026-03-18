import asyncio
from typing import Any, AsyncGenerator, Optional
from src.core.schema import SkillMetadata, SourceType, ExecutionMode, SkillSource, SkillMetrics
from src.adapters.base import BaseAdapter
from playwright.async_api import async_playwright
from playwright_stealth import Stealth

class SkillsMPAdapter(BaseAdapter):
    """
    负责从 skillsmp.com 抓取 Agent Skills
    使用 Playwright 和 Stealth 绕过 Cloudflare 防护，然后通过页面上下文获取内部 API 数据。
    """
    
    def __init__(self):
        self.base_url = "https://skillsmp.com"
        self.api_base_path = "/api/skills"
            
    @property
    def source_type(self) -> str:
        return SourceType.SKILLSMP.value

    def _extract_skills_list(self, payload: Any) -> list[dict]:
        if not isinstance(payload, dict):
            return []
        for k in ("skills", "items", "results", "data"):
            v = payload.get(k)
            if isinstance(v, list):
                return [x for x in v if isinstance(x, dict)]
        return []

    def _pick_skill_id(self, item: dict) -> Optional[str]:
        for k in ("id", "_id", "skillId", "slug"):
            v = item.get(k)
            if isinstance(v, str) and v.strip():
                return v.strip()
        v = item.get("identifier")
        if isinstance(v, str) and v.strip():
            return v.strip()
        return None

    def _as_int(self, v: Any, default: int = 0) -> int:
        try:
            return int(v)
        except Exception:
            return default

    async def fetch_skills(self) -> AsyncGenerator[SkillMetadata, None]:
        """
        利用 skillsmp.com 的内部 API 抓取数据
        """
        page_num = 1
        limit = 50
        api_url_template: Optional[str] = None
        
        async with Stealth().use_async(async_playwright()) as p:
            browser = await p.chromium.launch(
                args=["--disable-blink-features=AutomationControlled"],
                headless=True
            )
            context = await browser.new_context(
                user_agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
                viewport={"width": 1920, "height": 1080}
            )
            page = await context.new_page()
            
            try:
                print("🚀 [SkillsMP] Navigating to target site to bypass CF...")
                loop = asyncio.get_running_loop()
                api_probe_future: asyncio.Future[str] = loop.create_future()

                def _on_response(resp):
                    try:
                        u = resp.url or ""
                        if "/api/skills" in u and not api_probe_future.done():
                            api_probe_future.set_result(u)
                    except Exception:
                        return

                page.on("response", _on_response)

                await page.goto(f"{self.base_url}/search", wait_until="networkidle")
                
                # 等待一会儿确保 CF 验证通过
                await page.wait_for_timeout(3000)
                
                content = await page.content()
                if "Attention Required! | Cloudflare" in content:
                    print("❌ [SkillsMP] Failed to bypass Cloudflare protection.")
                    return

                # 尝试从真实网络响应中捕获内部 API 的完整 URL（Next.js 站点通常会在首屏请求一次）
                try:
                    captured_url = await asyncio.wait_for(api_probe_future, timeout=8)
                    # 统一成模板，后续只替换 query 参数
                    api_url_template = captured_url.split("?")[0]
                    print(f"DEBUG: [SkillsMP] Captured API endpoint: {api_url_template}")
                except Exception:
                    api_url_template = f"{self.base_url}{self.api_base_path}"
                    print(f"DEBUG: [SkillsMP] Cannot capture API endpoint, fallback to: {api_url_template}")
                
                while True:
                    print(f"DEBUG: [SkillsMP] Fetching page {page_num}...")

                    url = f"{api_url_template}?page={page_num}&limit={limit}&sortBy=stars"
                    data: Any = None
                    # 优先复用浏览器上下文的 cookies/headers，通过 request 发起（更稳定、更快）
                    try:
                        resp = await context.request.get(
                            url,
                            timeout=30_000,
                            headers={
                                "Accept": "application/json, text/plain, */*",
                                "Referer": f"{self.base_url}/search",
                                "Origin": self.base_url,
                            },
                        )
                        if resp.ok:
                            data = await resp.json()
                        else:
                            data = {"error": f"Status {resp.status}"}
                    except Exception as e:
                        data = {"error": str(e)}

                    # 兜底：用页面上下文 fetch（很多 Next.js/CF 站点要求“真实页面上下文”才能过）
                    if not data or (isinstance(data, dict) and data.get("error")):
                        data = await page.evaluate(
                            """async ({ url, referer, origin }) => {
                                try {
                                    const response = await fetch(url, {
                                        method: 'GET',
                                        credentials: 'include',
                                        headers: {
                                            'Accept': 'application/json, text/plain, */*',
                                            'Referer': referer,
                                            'Origin': origin
                                        }
                                    });
                                    if (!response.ok) return { error: `Status ${response.status}` };
                                    return await response.json();
                                } catch (e) {
                                    return { error: e.toString() };
                                }
                            }""",
                            {"url": url, "referer": f"{self.base_url}/search", "origin": self.base_url},
                        )
                    
                    if not data or 'error' in data:
                        err = None
                        if isinstance(data, dict):
                            err = data.get("error")
                        print(f"DEBUG: [SkillsMP] Cannot fetch or parse data: {err or 'Unknown Error'}, breaking loop.")
                        break
                        
                    skills_list = self._extract_skills_list(data)
                    print(f"DEBUG: [SkillsMP] Found {len(skills_list)} skills on page {page_num}.")
                    
                    if not skills_list:
                        break
                    
                    for item in skills_list:
                        skill_id = self._pick_skill_id(item)
                        if not skill_id:
                            continue
                            
                        name = item.get("name") or item.get("title") or skill_id
                        author = item.get("author") or item.get("owner") or "community"
                        description = item.get("description") or item.get("summary") or f"Automatically synced skill from SkillsMP: {name}"
                        repo_url = item.get("repoUrl") or item.get("repoURL") or item.get("repository") or f"{self.base_url}/skill/{skill_id}"
                        
                        yield SkillMetadata(
                            skill_id=f"skillsmp:{skill_id}",
                            name=name,
                            author=author,
                            description=description,
                            tags=[], 
                            source=SkillSource(
                                type=SourceType.SKILLSMP,
                                url=repo_url
                            ),
                            metrics=SkillMetrics(
                                stars=self._as_int(item.get("stars", 0)), 
                                downloads=self._as_int(item.get("downloads", item.get("installs", 0)))
                            ),
                            install_uri=f"skill://skillsmp/{skill_id}@latest",
                            execution_mode=ExecutionMode.REST_API, 
                            required_envs=[],
                            agent_tools_schema=[] 
                        )
                    
                    # 翻页
                    page_num += 1
                    await page.wait_for_timeout(1000)
                    
            except Exception as e:
                print(f"❌ [SkillsMP] Error fetching page {page_num}: {e}")
            finally:
                await browser.close()

    async def get_skill_detail(self, identifier: str) -> Optional[SkillMetadata]:
        # 可以日后实现获取单一详细信息的逻辑
        pass
