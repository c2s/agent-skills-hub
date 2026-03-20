import os
import asyncio
from typing import Any, AsyncGenerator, Optional
from src.core.schema import SkillMetadata, SourceType, ExecutionMode, SkillSource, SkillMetrics
from src.adapters.base import BaseAdapter
from playwright.async_api import async_playwright
from playwright_stealth import Stealth

class SkillsMPAdapter(BaseAdapter):
    """
    负责从 skillsmp.com 抓取 Agent Skills
    - 若设置 SKILLSMP_API_KEY：使用官方 REST API 直接请求（推荐，无需 Playwright）
    - 否则：使用 Playwright 页面上下文 fetch 同源 API
    """
    
    def __init__(self, api_key: Optional[str] = None, category: Optional[str] = None, query: Optional[str] = None):
        self.base_url = "https://skillsmp.com"
        self.api_key = api_key or os.environ.get("SKILLSMP_API_KEY")
        self.category = category  # 如 finance-investment
        self.query = query  # GET /api/v1/skills/search 的 q 参数，如 finance
            
    @property
    def source_type(self) -> str:
        return SourceType.SKILLSMP.value

    def _extract_skills_list(self, payload: Any) -> list[dict]:
        if not isinstance(payload, dict):
            return []
        data_obj = payload.get("data", payload)
        for k in ("skills", "items", "results", "data"):
            v = data_obj.get(k) if isinstance(data_obj, dict) else None
            if isinstance(v, list):
                return [x for x in v if isinstance(x, dict)]
        return []

    def _pick_skill_id(self, item: dict) -> Optional[str]:
        for k in ("id", "_id", "skillId", "slug"):
            v = item.get(k)
            if isinstance(v, str) and v.strip():
                return v.strip()
        if isinstance(item.get("id"), (int, float)):
            return str(int(item["id"]))
        v = item.get("identifier")
        if isinstance(v, str) and v.strip():
            return v.strip()
        return None

    def _as_int(self, v: Any, default: int = 0) -> int:
        try:
            return int(v)
        except Exception:
            return default

    def _item_to_skill(self, item: dict) -> Optional[SkillMetadata]:
        skill_id = self._pick_skill_id(item)
        if not skill_id:
            return None
        name = item.get("name") or item.get("title") or skill_id
        author = item.get("author") or item.get("owner") or "community"
        description = item.get("description") or item.get("summary") or f"Automatically synced skill from SkillsMP: {name}"
        repo_url = item.get("repoUrl") or item.get("repoURL") or item.get("repository") or f"{self.base_url}/skills/{skill_id}"
        if "/skill/" in (repo_url or "") and "/skills/" not in (repo_url or ""):
            repo_url = (repo_url or "").replace("/skill/", "/skills/", 1)
        return SkillMetadata(
            skill_id=f"skillsmp:{skill_id}",
            name=name,
            author=author,
            description=description,
            tags=[],
            source=SkillSource(type=SourceType.SKILLSMP, url=repo_url),
            metrics=SkillMetrics(
                stars=self._as_int(item.get("stars", 0)),
                downloads=self._as_int(item.get("downloads", item.get("installs", 0))),
            ),
            install_uri=f"skill://skillsmp/{skill_id}@latest",
            execution_mode=ExecutionMode.REST_API,
            required_envs=[],
            agent_tools_schema=[],
        )

    async def _fetch_via_api_key(self) -> AsyncGenerator[SkillMetadata, None]:
        """使用官方 API Key 直接请求"""
        import httpx
        headers = {
            "Accept": "application/json",
            "Authorization": f"Bearer {self.api_key}",
        }
        seen_ids: set[str] = set()
        limit = 100

        if self.query:
            # 直接使用 GET /api/v1/skills/search?q=xxx
            search_terms = [self.query]
            skip_category_api = True
        elif self.category:
            search_terms = [self.category.replace("-", " ")]
            skip_category_api = False
        else:
            search_terms = ["skill", "tool", "api", "agent", "ai", "data", "code"]
            skip_category_api = True

        async with httpx.AsyncClient(timeout=30.0) as client:
            if self.category and not skip_category_api:
                cat_url = f"{self.base_url}/api/v1/categories/{self.category}/skills"
                try:
                    page_num = 1
                    while True:
                        resp = await client.get(cat_url, headers=headers, params={"page": page_num, "limit": limit, "sortBy": "stars"})
                        if resp.is_success:
                            data = resp.json()
                            skills_list = self._extract_skills_list(data)
                            if not skills_list:
                                break
                            print(f"📄 [SkillsMP] category={self.category} page={page_num}: {len(skills_list)} skills")
                            for item in skills_list:
                                skill = self._item_to_skill(item)
                                if skill and skill.skill_id not in seen_ids:
                                    seen_ids.add(skill.skill_id)
                                    yield skill
                            page_num += 1
                            await asyncio.sleep(0.3)
                        else:
                            print(f"  Category API not available, fallback to search")
                            break
                except Exception as e:
                    print(f"  Category API error: {e}, fallback to search")

            for q in search_terms:
                page_num = 1
                while True:
                    url = f"{self.base_url}/api/v1/skills/search"
                    params = {"q": q, "page": page_num, "limit": limit, "sortBy": "stars"}
                    try:
                        resp = await client.get(url, headers=headers, params=params)
                        if not resp.is_success:
                            err = resp.json() if resp.headers.get("content-type", "").startswith("application/json") else {}
                            msg = err.get("error", {}).get("message", resp.text) if isinstance(err, dict) else resp.text
                            print(f"⚠️ [SkillsMP] API error ({resp.status_code}): {msg}")
                            break
                        data = resp.json()
                    except Exception as e:
                        print(f"⚠️ [SkillsMP] Request error: {e}")
                        break

                    skills_list = self._extract_skills_list(data)
                    if not skills_list:
                        break

                    print(f"📄 [SkillsMP] q={q} page={page_num}: {len(skills_list)} skills")
                    new_count = 0
                    for item in skills_list:
                        skill = self._item_to_skill(item)
                        if skill and skill.skill_id not in seen_ids:
                            seen_ids.add(skill.skill_id)
                            new_count += 1
                            yield skill

                    if new_count == 0 and page_num > 1:
                        break
                    page_num += 1
                    await asyncio.sleep(0.3)

    async def _fetch_via_page(self, page: Any, api_path: str) -> Any:
        """在页面上下文中用相对 URL fetch"""
        return await page.evaluate(
            """async (apiPath) => {
                try {
                    const response = await fetch(apiPath, {
                        method: 'GET',
                        credentials: 'include',
                        headers: { 'Accept': 'application/json, text/plain, */*' }
                    });
                    if (!response.ok) return { error: `Status ${response.status}` };
                    return await response.json();
                } catch (e) {
                    return { error: e.toString() };
                }
            }""",
            api_path,
        )

    async def _fetch_via_playwright(self) -> AsyncGenerator[SkillMetadata, None]:
        """使用 Playwright 页面上下文抓取（无 API Key 时）"""
        page_num = 1
        limit = 50
        api_paths_to_try = [
            f"/api/skills?page={{page}}&limit={limit}&sortBy=stars",
            f"/api/v1/skills/search?q=skill&page={{page}}&limit={limit}&sortBy=stars",
        ]
        working_path: Optional[str] = None

        async with Stealth().use_async(async_playwright()) as p:
            browser = await p.chromium.launch(
                args=["--disable-blink-features=AutomationControlled"],
                headless=True,
            )
            context = await browser.new_context(
                user_agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36",
                viewport={"width": 1920, "height": 1080},
            )
            page = await context.new_page()

            try:
                print("🚀 [SkillsMP] Navigating to bypass CF...")
                await page.goto(f"{self.base_url}/search", wait_until="load", timeout=30_000)
                await page.wait_for_timeout(4000)

                if "Attention Required! | Cloudflare" in await page.content():
                    print("❌ [SkillsMP] Failed to bypass Cloudflare.")
                    return

                for template in api_paths_to_try:
                    path = template.replace("{page}", "1")
                    data = await self._fetch_via_page(page, path)
                    if data and isinstance(data, dict) and "error" not in data:
                        skills_list = self._extract_skills_list(data)
                        if skills_list:
                            working_path = template
                            print(f"✅ [SkillsMP] API OK: {path.split('?')[0]}")
                            break

                if not working_path:
                    print("❌ [SkillsMP] No working API path.")
                    return

                while True:
                    path = working_path.replace("{page}", str(page_num))
                    data = await self._fetch_via_page(page, path)
                    if not data or (isinstance(data, dict) and data.get("error")):
                        break
                    skills_list = self._extract_skills_list(data)
                    if not skills_list:
                        break
                    print(f"📄 [SkillsMP] Page {page_num}: {len(skills_list)} skills")
                    for item in skills_list:
                        skill = self._item_to_skill(item)
                        if skill:
                            yield skill
                    page_num += 1
                    await page.wait_for_timeout(800)
            except Exception as e:
                print(f"❌ [SkillsMP] Error: {e}")
            finally:
                await browser.close()

    async def fetch_skills(self) -> AsyncGenerator[SkillMetadata, None]:
        if self.api_key:
            print("🔑 [SkillsMP] Using API Key (official REST API)")
            async for s in self._fetch_via_api_key():
                yield s
        else:
            print("🌐 [SkillsMP] No API Key, using Playwright")
            async for s in self._fetch_via_playwright():
                yield s

    async def get_skill_detail(self, identifier: str) -> Optional[SkillMetadata]:
        pass
