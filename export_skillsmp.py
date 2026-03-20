import sys
import os
import json
import asyncio
import argparse

# Add current dir to sys.path
sys.path.insert(0, os.path.abspath(os.path.dirname(__file__)))

# Load .env for SKILLSMP_API_KEY
try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass

from src.adapters.skillsmp_adapter import SkillsMPAdapter

def escape_string(val):
    if val is None:
        return 'NULL'
    if isinstance(val, int):
        return str(val)
    try:
        import pymysql
        return "'" + pymysql.converters.escape_string(str(val)) + "'"
    except ImportError:
        s = str(val).replace("\\", "\\\\").replace("'", "''").replace("\n", "\\n").replace("\r", "\\r")
        return "'" + s + "'"

def parse_category_from_url(url: str) -> str | None:
    """从 https://skillsmp.com/categories/finance-investment 提取 finance-investment"""
    if "/categories/" in url:
        return url.rstrip("/").split("/categories/")[-1].split("/")[0] or None
    return url.strip() or None

async def main():
    parser = argparse.ArgumentParser(description="Export SkillsMP skills to SQL file (GET /api/v1/skills/search)")
    parser.add_argument("-q", "--query", help="Search query for API, e.g. finance (GET /api/v1/skills/search?q=finance)")
    parser.add_argument("-c", "--category", help="Category slug or URL")
    parser.add_argument("-o", "--output", default="skillsmp_skills.sql", help="Output SQL file path")
    args = parser.parse_args()

    category = parse_category_from_url(args.category) if args.category else None
    query = (args.query or "").strip() or None

    if query:
        print(f"🔍 [SkillsMP] Search query: q={query}")
    elif category:
        print(f"📂 [SkillsMP] Category: {category}")

    adapter = SkillsMPAdapter(category=category, query=query)
    sql_file = args.output
    if sql_file == "skillsmp_skills.sql" and (query or category):
        sql_file = f"skillsmp_{query or category}.sql"
    
    with open(sql_file, "w", encoding="utf-8") as f:
        f.write("SET NAMES utf8mb4;\n")
        f.write("BEGIN;\n\n")
        
        count = 0
        async for skill in adapter.fetch_skills():
            count += 1
            skill_id = skill.skill_id
            name = skill.name
            author = skill.author
            description = skill.description
            source_type = skill.source.type.value
            source_url = skill.source.url
            install_uri = skill.install_uri
            execution_mode = skill.execution_mode.value
            stars = skill.metrics.stars
            downloads = skill.metrics.downloads
            required_envs = json.dumps(skill.required_envs)
            agent_tools_schema = json.dumps([t.model_dump() for t in skill.agent_tools_schema])
            remote_updated_at = getattr(skill, 'remote_updated_at', 0)
            
            values = f"({escape_string(skill_id)}, {escape_string(name)}, {escape_string(author)}, {escape_string(description)}, {escape_string(source_type)}, {escape_string(source_url)}, {escape_string(install_uri)}, {escape_string(execution_mode)}, {escape_string(stars)}, {escape_string(downloads)}, {escape_string(required_envs)}, {escape_string(agent_tools_schema)}, {escape_string(remote_updated_at)})"
            
            sql = f"""INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    {values}
ON DUPLICATE KEY UPDATE
    name = VALUES(name),
    author = VALUES(author),
    description = VALUES(description),
    source_type = VALUES(source_type),
    source_url = VALUES(source_url),
    install_uri = VALUES(install_uri),
    execution_mode = VALUES(execution_mode),
    stars = VALUES(stars),
    downloads = VALUES(downloads),
    required_envs = VALUES(required_envs),
    agent_tools_schema = VALUES(agent_tools_schema),
    remote_updated_at = VALUES(remote_updated_at),
    last_updated = CURRENT_TIMESTAMP;\n"""
            f.write(sql)
            print(f"Exported {skill_id}: {name}")
            
        f.write("\nCOMMIT;\n")
        suffix = f" (q={query})" if query else (f" (category: {category})" if category else "")
        print(f"✅ Successfully exported {count} skills to {sql_file}{suffix}")

if __name__ == "__main__":
    # Workaround for playwright not liking standard asyncio loops sometimes on Mac
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        pass
