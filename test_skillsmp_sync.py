import asyncio
import os
import sys

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from src.adapters.skillsmp_adapter import SkillsMPAdapter
from src.registry.db import DBManager

async def main():
    print("Testing SkillsMP Adapter solely...")
    db = DBManager()
    adapter = SkillsMPAdapter()
    
    count = 0
    try:
        async for skill in adapter.fetch_skills():
            print(f"Found: {skill.name} by {skill.author}")
            db.save_skill(skill)
            count += 1
            if count >= 3: # Just test a few to avoid long waits
                print("Successfully synced 3 items. Test passed.")
                break
    except Exception as e:
        print(f"Exception during sync: {e}")

if __name__ == "__main__":
    asyncio.run(main())
