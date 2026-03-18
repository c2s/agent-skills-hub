import asyncio
from playwright.async_api import async_playwright
from playwright_stealth import Stealth
import json

async def main():
    async with Stealth().use_async(async_playwright()) as p:
        browser = await p.chromium.launch(args=["--disable-blink-features=AutomationControlled"], headless=True)
        context = await browser.new_context(
            user_agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
            viewport={"width": 1920, "height": 1080}
        )
        page = await context.new_page()
        
        print("Navigating to https://skillsmp.com/search...")
        await page.goto("https://skillsmp.com/search", wait_until="networkidle")
        
        # Wait a bit just in case
        await page.wait_for_timeout(3000)
        
        content = await page.content()
        if "Attention Required! | Cloudflare" in content:
            print("Failed to bypass Cloudflare.")
        else:
            print("Successfully loaded the page. Now fetching data via evaluate...")
            
            # Fetch data using the page's context to inherit cookies and CF clearance
            data = await page.evaluate('''async () => {
                const response = await fetch('/api/skills?page=1&limit=50&sortBy=stars');
                return await response.json();
            }''')
            
            print("Fetched data keys:", data.keys())
            if 'skills' in data:
                print(f"Number of skills: {len(data['skills'])}")
                print(f"Total skills available: {data.get('total')}")
                if data['skills']:
                     print("First skill sample:", {k: data['skills'][0][k] for k in ["id", "name", "author", "repoUrl"] if k in data['skills'][0]})
            else:
                print("No skills found in data:", data)
            
        await browser.close()

if __name__ == "__main__":
    asyncio.run(main())
