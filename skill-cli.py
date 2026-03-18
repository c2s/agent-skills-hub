#!/usr/bin/env python3
import asyncio
import argparse
import json
import sys
from src.registry.engine import RetrievalEngine
from src.core.schema import SkillMetadata, SkillSource, SourceType, ExecutionMode
from src.adapters.github_adapter import GitHubAdapter

async def mock_seed_db(engine: RetrievalEngine):
    """
    为了 CLI 演示能够运行，我们给 Engine 灌入几条 Mock 数据，
    这通常是后台 Cron 定期抓取入库的。
    """
    mock_skills = [
        SkillMetadata(
            skill_id="github:langchain-ai:finance-tools",
            name="Finance Analyzer",
            author="langchain-ai",
            description="提供金融研报、股票历史价格等综合查询能力，适合各种金融、股票相关的查询任务",
            tags=[],
            source=SkillSource(type=SourceType.GITHUB, url="https://github.com/langchain-ai/finance-tools"),
            metrics={"stars": 4500, "downloads": 12000},
            install_uri="skill://github/langchain-ai/finance-tools@main",
            execution_mode=ExecutionMode.PYTHON_MODULE,
            required_envs=["ALPHAVANTAGE_API_KEY"],
            agent_tools_schema=[]
        ),
        SkillMetadata(
            skill_id="skills_sh:community:stock-charts",
            name="Stock Charts Maker",
            author="community",
            description="能够基于金融数据返回漂亮的股票 K 线图组件",
            tags=[],
            source=SkillSource(type=SourceType.SKILLS_SH, url="https://skills.sh/plugins/stock-charts"),
            metrics={"stars": 500, "downloads": 3000},
            install_uri="skill://skills_sh/stock-charts@latest",
            execution_mode=ExecutionMode.REST_API,
            required_envs=[],
            agent_tools_schema=[]
        ),
    ]
    for s in mock_skills:
        await engine.index_skill(s)


async def main():
    parser = argparse.ArgumentParser(description="Skill Meta-Registry Terminal CLI")
    subparsers = parser.add_subparsers(dest="command", help="Available commands")

    # [Search Command]
    search_parser = subparsers.add_parser("search", help="Search for agent skills using natural language")
    search_parser.add_argument("query", type=str, help="Search query (e.g., '金融', '股票')")
    search_parser.add_argument("--limit", type=int, default=5, help="Max results to return")

    # [Install Command]
    install_parser = subparsers.add_parser("install", help="Mount a skill by URI")
    install_parser.add_argument("uri", type=str, help="Skill URI (e.g., skill://github/langchain-ai/finance-tools@main)")

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        sys.exit(1)

    # Initialize Engine Context for CLI
    engine = RetrievalEngine()
    await mock_seed_db(engine)

    if args.command == "search":
        print(f"🔍 Searching Meta-Registry for: '{args.query}'...\n")
        results, total = await engine.search(args.query, limit=args.limit)
        
        if not results:
            print("No skills found matching your query.")
            sys.exit(0)
            
        print(f"Total results: {total}\n")
        for idx, skill in enumerate(results, start=1):
            print(f"[{idx}] {skill.name}  (⭐ {skill.metrics.stars})")
            print(f"    📝 {skill.description}")
            print(f"    🔗 URI: {skill.install_uri}")
            if skill.required_envs:
                print(f"    🔑 Required Envs: {', '.join(skill.required_envs)}")
            print("-" * 60)
            
    elif args.command == "install":
        print(f"📦 Preparing to mount skill: {args.uri}...\n")
        import urllib.parse
        parsed = urllib.parse.urlparse(args.uri)
        if parsed.scheme != "skill":
            print("❌ Invalid URI protocol. Must start with 'skill://'")
            sys.exit(1)
            
        print(f"✅ Protocol accepted: {parsed.netloc}{parsed.path}")
        print("⚙️  Checking required environments...")
        # (Mock implementation of environment check and actual sandboxed install)
        print("🚀 Successfully mounted functions to current Agent context!")

if __name__ == "__main__":
    asyncio.run(main())
