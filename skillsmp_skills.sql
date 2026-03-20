SET NAMES utf8mb4;
BEGIN;

INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:openclaw-openclaw-skills-skill-creator-skill-md', 'skill-creator', 'openclaw', 'Create, edit, improve, or audit AgentSkills. Use when creating a new skill from scratch or when asked to improve, review, audit, tidy up, or clean up an existing skill or SKILL.md file. Also use when editing or restructuring a skill directory (moving files to references/ or scripts/, removing stale content, validating against the AgentSkills spec). Triggers on phrases like \"create a skill\", \"author a skill\", \"tidy up a skill\", \"improve this skill\", \"review the skill\", \"clean up the skill\", \"audit the skill\".', 'skillsmp', 'https://skillsmp.com/skill/openclaw-openclaw-skills-skill-creator-skill-md', 'skill://skillsmp/openclaw-openclaw-skills-skill-creator-skill-md@latest', 'rest-api', 318425, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:openclaw-openclaw-skills-clawhub-skill-md', 'clawhub', 'openclaw', 'Use the ClawHub CLI to search, install, update, and publish agent skills from clawhub.com. Use when you need to fetch new skills on the fly, sync installed skills to latest or a specific version, or publish new/updated skill folders with the npm-installed clawhub CLI.', 'skillsmp', 'https://skillsmp.com/skill/openclaw-openclaw-skills-clawhub-skill-md', 'skill://skillsmp/openclaw-openclaw-skills-clawhub-skill-md@latest', 'rest-api', 318425, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:openclaw-openclaw-skills-xurl-skill-md', 'xurl', 'openclaw', 'A CLI tool for making authenticated requests to the X (Twitter) API. Use this skill when you need to post tweets, reply, quote, search, read posts, manage followers, send DMs, upload media, or interact with any X API v2 endpoint.', 'skillsmp', 'https://skillsmp.com/skill/openclaw-openclaw-skills-xurl-skill-md', 'skill://skillsmp/openclaw-openclaw-skills-xurl-skill-md@latest', 'rest-api', 318425, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:openclaw-openclaw-extensions-open-prose-skills-prose-skill-md', 'prose', 'openclaw', 'OpenProse VM skill pack. Activate on any `prose` command, .prose files, or OpenProse mentions; orchestrates multi-agent workflows.', 'skillsmp', 'https://skillsmp.com/skill/openclaw-openclaw-extensions-open-prose-skills-prose-skill-md', 'skill://skillsmp/openclaw-openclaw-extensions-open-prose-skills-prose-skill-md@latest', 'rest-api', 318425, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:openclaw-openclaw-extensions-acpx-skills-acp-router-skill-md', 'acp-router', 'openclaw', 'Route plain-language requests for Pi, Claude Code, Codex, OpenCode, Gemini CLI, or ACP harness work into either OpenClaw ACP runtime sessions or direct acpx-driven sessions (\"telephone game\" flow). For coding-agent thread requests, read this skill first, then use only `sessions_spawn` for thread creation.', 'skillsmp', 'https://skillsmp.com/skill/openclaw-openclaw-extensions-acpx-skills-acp-router-skill-md', 'skill://skillsmp/openclaw-openclaw-extensions-acpx-skills-acp-router-skill-md@latest', 'rest-api', 318425, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:microsoft-vscode-src-vs-sessions-skills-update-skills-skill-md', 'update-skills', 'microsoft', 'Create or update repository skills and instructions when major learnings are discovered during a session. Use when the user says \"learn!\", when a significant pattern or pitfall is identified, or when reusable domain knowledge should be captured for future sessions.', 'skillsmp', 'https://skillsmp.com/skill/microsoft-vscode-src-vs-sessions-skills-update-skills-skill-md', 'skill://skillsmp/microsoft-vscode-src-vs-sessions-skills-update-skills-skill-md@latest', 'rest-api', 182754, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:microsoft-vscode-github-skills-update-screenshots-skill-md', 'update-screenshots', 'microsoft', 'Download screenshot baselines from the latest CI run and commit them. Use when asked to update, accept, or refresh component screenshot baselines from CI, or after the screenshot-test GitHub Action reports differences. This skill should be run as a subagent.', 'skillsmp', 'https://skillsmp.com/skill/microsoft-vscode-github-skills-update-screenshots-skill-md', 'skill://skillsmp/microsoft-vscode-github-skills-update-screenshots-skill-md@latest', 'rest-api', 182754, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:microsoft-vscode-github-skills-author-contributions-skill-md', 'author-contributions', 'microsoft', 'Identify all files a specific author contributed to on a branch vs its upstream, tracing code through renames. Use when asked who edited what, what code an author contributed, or to audit authorship before a merge. This skill should be run as a subagent — it performs many git operations and returns a concise table.', 'skillsmp', 'https://skillsmp.com/skill/microsoft-vscode-github-skills-author-contributions-skill-md', 'skill://skillsmp/microsoft-vscode-github-skills-author-contributions-skill-md@latest', 'rest-api', 182754, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:microsoft-vscode-github-skills-accessibility-skill-md', 'accessibility', 'microsoft', 'Primary accessibility skill for VS Code. REQUIRED for new feature and contribution work, and also applies to updates of existing UI. Covers accessibility help dialogs, accessible views, verbosity settings, signals, ARIA announcements, keyboard navigation, and ARIA labels/roles.', 'skillsmp', 'https://skillsmp.com/skill/microsoft-vscode-github-skills-accessibility-skill-md', 'skill://skillsmp/microsoft-vscode-github-skills-accessibility-skill-md@latest', 'rest-api', 182754, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:f-prompts-chat-plugins-claude-prompts-chat-skills-skill-lookup-skill-md', 'skill-lookup', 'f', 'Search, retrieve, and install Agent Skills from the prompts.chat registry using MCP tools. Use when the user asks to find skills, browse skill catalogs, install a skill for Claude, or extend Claude\'s capabilities with reusable AI agent components.', 'skillsmp', 'https://skillsmp.com/skill/f-prompts-chat-plugins-claude-prompts-chat-skills-skill-lookup-skill-md', 'skill://skillsmp/f-prompts-chat-plugins-claude-prompts-chat-skills-skill-lookup-skill-md@latest', 'rest-api', 152980, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:vercel-next-js-agents-skills-authoring-skills-skill-md', 'authoring-skills', 'vercel', 'How to create and maintain agent skills in .agents/skills/. Use when creating a new SKILL.md, writing skill descriptions, choosing frontmatter fields, or deciding what content belongs in a skill vs AGENTS.md. Covers the supported spec fields, description writing, naming conventions, and the relationship between always-loaded AGENTS.md and on-demand skills.', 'skillsmp', 'https://skillsmp.com/skill/vercel-next-js-agents-skills-authoring-skills-skill-md', 'skill://skillsmp/vercel-next-js-agents-skills-authoring-skills-skill-md@latest', 'rest-api', 138363, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:vercel-next-js-agents-skills-write-guide-skill-md', 'write-guide', 'vercel', 'Generates technical guides that teach real-world use cases through progressive examples.\n\n**Auto-activation:** User asks to write, create, or draft a guide or tutorial. Also use when converting feature documentation, API references, or skill knowledge into step-by-step learning content.\n\n**Input sources:** Feature skills, API documentation, existing code examples, or user-provided specifications.\n\n**Output type:** A markdown guide with YAML frontmatter, introduction, 2-4 progressive steps, and next steps section.', 'skillsmp', 'https://skillsmp.com/skill/vercel-next-js-agents-skills-write-guide-skill-md', 'skill://skillsmp/vercel-next-js-agents-skills-write-guide-skill-md@latest', 'rest-api', 138363, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:vercel-next-js-claude-plugin-plugins-cache-components-skills-cache-components-skill-md', 'cache-components', 'vercel', 'Expert guidance for Next.js Cache Components and Partial Prerendering (PPR).\n\n**PROACTIVE ACTIVATION**: Use this skill automatically when working in Next.js projects that have `cacheComponents: true` in their next.config.ts/next.config.js. When this config is detected, proactively apply Cache Components patterns and best practices to all React Server Component implementations.\n\n**DETECTION**: At the start of a session in a Next.js project, check for `cacheComponents: true` in next.config. If enabled, this skill\'s patterns should guide all component authoring, data fetching, and caching decisions.\n\n**USE CASES**: Implementing \'use cache\' directive, configuring cache lifetimes with cacheLife(), tagging cached data with cacheTag(), invalidating caches with updateTag()/revalidateTag(), optimizing static vs dynamic content boundaries, debugging cache issues, and reviewing Cache Component implementations.', 'skillsmp', 'https://skillsmp.com/skill/vercel-next-js-claude-plugin-plugins-cache-components-skills-cache-components-skill-md', 'skill://skillsmp/vercel-next-js-claude-plugin-plugins-cache-components-skills-cache-components-skill-md@latest', 'rest-api', 138363, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anomalyco-opencode-packages-opencode-test-fixture-skills-cloudflare-skill-md', 'cloudflare', 'anomalyco', 'Comprehensive Cloudflare platform skill covering Workers, Pages, storage (KV, D1, R2), AI (Workers AI, Vectorize, Agents SDK), networking (Tunnel, Spectrum), security (WAF, DDoS), and infrastructure-as-code (Terraform, Pulumi). Use for any Cloudflare development task.', 'skillsmp', 'https://skillsmp.com/skill/anomalyco-opencode-packages-opencode-test-fixture-skills-cloudflare-skill-md', 'skill://skillsmp/anomalyco-opencode-packages-opencode-test-fixture-skills-cloudflare-skill-md@latest', 'rest-api', 123660, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:angular-angular-skills-dev-skills-angular-new-app-skill-md', 'angular-new-app', 'angular', 'Creates a new Angular app using the Angular CLI. This skill should be used whenver a user wants to create a new Angular application and contains important guidelines for how to effectively create a modern Angular application.', 'skillsmp', 'https://skillsmp.com/skill/angular-angular-skills-dev-skills-angular-new-app-skill-md', 'skill://skillsmp/angular-angular-skills-dev-skills-angular-new-app-skill-md@latest', 'rest-api', 100116, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:pytorch-pytorch-claude-skills-skill-writer-skill-md', 'skill-writer', 'pytorch', 'Guide users through creating Agent Skills for Claude Code. Use when the user wants to create, write, author, or design a new Skill, or needs help with SKILL.md files, frontmatter, or skill structure.', 'skillsmp', 'https://skillsmp.com/skill/pytorch-pytorch-claude-skills-skill-writer-skill-md', 'skill://skillsmp/pytorch-pytorch-claude-skills-skill-writer-skill-md@latest', 'rest-api', 98336, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:google-gemini-gemini-cli-packages-core-src-skills-builtin-skill-creator-skill-md', 'skill-creator', 'google-gemini', 'Guide for creating effective skills. This skill should be used when users want to create a new skill (or update an existing skill) that extends Gemini CLI\'s capabilities with specialized knowledge, workflows, or tool integrations.', 'skillsmp', 'https://skillsmp.com/skill/google-gemini-gemini-cli-packages-core-src-skills-builtin-skill-creator-skill-md', 'skill://skillsmp/google-gemini-gemini-cli-packages-core-src-skills-builtin-skill-creator-skill-md@latest', 'rest-api', 98026, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:google-gemini-gemini-cli-gemini-skills-github-issue-creator-skill-md', 'github-issue-creator', 'google-gemini', 'Use this skill when asked to create a GitHub issue. It handles different issue types (bug, feature, etc.) using repository templates and ensures proper labeling.', 'skillsmp', 'https://skillsmp.com/skill/google-gemini-gemini-cli-gemini-skills-github-issue-creator-skill-md', 'skill://skillsmp/google-gemini-gemini-cli-gemini-skills-github-issue-creator-skill-md@latest', 'rest-api', 98026, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:google-gemini-gemini-cli-gemini-skills-async-pr-review-skill-md', 'async-pr-review', 'google-gemini', 'Trigger this skill when the user wants to start an asynchronous PR review, run background checks on a PR, or check the status of a previously started async PR review.', 'skillsmp', 'https://skillsmp.com/skill/google-gemini-gemini-cli-gemini-skills-async-pr-review-skill-md', 'skill://skillsmp/google-gemini-gemini-cli-gemini-skills-async-pr-review-skill-md@latest', 'rest-api', 98026, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:google-gemini-gemini-cli-gemini-skills-code-reviewer-skill-md', 'code-reviewer', 'google-gemini', 'Use this skill to review code. It supports both local changes (staged or working tree) and remote Pull Requests (by ID or URL). It focuses on correctness, maintainability, and adherence to project standards.', 'skillsmp', 'https://skillsmp.com/skill/google-gemini-gemini-cli-gemini-skills-code-reviewer-skill-md', 'skill://skillsmp/google-gemini-gemini-cli-gemini-skills-code-reviewer-skill-md@latest', 'rest-api', 98026, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:google-gemini-gemini-cli-gemini-skills-docs-writer-skill-md', 'docs-writer', 'google-gemini', 'Always use this skill when the task involves writing, reviewing, or editing files in the `/docs` directory or any `.md` files in the repository.', 'skillsmp', 'https://skillsmp.com/skill/google-gemini-gemini-cli-gemini-skills-docs-writer-skill-md', 'skill://skillsmp/google-gemini-gemini-cli-gemini-skills-docs-writer-skill-md@latest', 'rest-api', 98026, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:google-gemini-gemini-cli-gemini-skills-pr-address-comments-skill-md', 'pr-address-comments', 'google-gemini', 'Use this skill if the user asks you to help them address GitHub PR comments for their current branch of the Gemini CLI. Requires `gh` CLI tool.', 'skillsmp', 'https://skillsmp.com/skill/google-gemini-gemini-cli-gemini-skills-pr-address-comments-skill-md', 'skill://skillsmp/google-gemini-gemini-cli-gemini-skills-pr-address-comments-skill-md@latest', 'rest-api', 98026, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:google-gemini-gemini-cli-gemini-skills-pr-creator-skill-md', 'pr-creator', 'google-gemini', 'Use this skill when asked to create a pull request (PR). It ensures all PRs follow the repository\'s established templates and standards.', 'skillsmp', 'https://skillsmp.com/skill/google-gemini-gemini-cli-gemini-skills-pr-creator-skill-md', 'skill://skillsmp/google-gemini-gemini-cli-gemini-skills-pr-creator-skill-md@latest', 'rest-api', 98026, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:google-gemini-gemini-cli-gemini-skills-string-reviewer-skill-md', 'string-reviewer', 'google-gemini', 'Use this skill when asked to review text and user-facing strings within the codebase. It ensures that these strings follow rules on clarity, usefulness, brevity and style.', 'skillsmp', 'https://skillsmp.com/skill/google-gemini-gemini-cli-gemini-skills-string-reviewer-skill-md', 'skill://skillsmp/google-gemini-gemini-cli-gemini-skills-string-reviewer-skill-md@latest', 'rest-api', 98026, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:google-gemini-gemini-cli-packages-cli-src-commands-extensions-examples-skills-skills-greeter-skill-md', 'greeter', 'google-gemini', 'A friendly greeter skill', 'skillsmp', 'https://skillsmp.com/skill/google-gemini-gemini-cli-packages-cli-src-commands-extensions-examples-skills-skills-greeter-skill-md', 'skill://skillsmp/google-gemini-gemini-cli-packages-cli-src-commands-extensions-examples-skills-skills-greeter-skill-md@latest', 'rest-api', 98026, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:ant-design-ant-design-claude-skills-issue-reply-skill-md', 'antd-issue-reply', 'ant-design', 'Help maintainers reply to Ant Design GitHub issues following official guidelines. Use this skill when the user asks to handle issues, reply to issues, process issues, check issues, or manage issues for ant-design/ant-design repository. Also use when the user mentions \"issue\" in the context of antd, Ant Design, or GitHub issue management. This skill provides guidelines for classifying issues (Bug vs Feature Request), handling dosubot replies, using proper labels, writing polite responses, and knowing when to close issues.', 'skillsmp', 'https://skillsmp.com/skill/ant-design-ant-design-claude-skills-issue-reply-skill-md', 'skill://skillsmp/ant-design-ant-design-claude-skills-issue-reply-skill-md@latest', 'rest-api', 97748, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:ant-design-ant-design-claude-skills-create-pr-skill-md', 'antd-create-pr', 'ant-design', 'Create pull requests for ant-design using the repository\'s official PR templates. Use when the user asks to create a PR, open a pull request, write PR title/body, summarize branch changes for a PR, or prepare an ant-design PR in Chinese or English. The skill must choose `.github/PULL_REQUEST_TEMPLATE_CN.md` or `.github/PULL_REQUEST_TEMPLATE.md` based on the user\'s language habit and keep the content aligned with ant-design\'s PR sections.', 'skillsmp', 'https://skillsmp.com/skill/ant-design-ant-design-claude-skills-create-pr-skill-md', 'skill://skillsmp/ant-design-ant-design-claude-skills-create-pr-skill-md@latest', 'rest-api', 97748, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-skills-skills-skill-creator-skill-md', 'skill-creator', 'anthropics', 'Create new skills, modify and improve existing skills, and measure skill performance. Use when users want to create a skill from scratch, edit, or optimize an existing skill, run evals to test a skill, benchmark skill performance with variance analysis, or optimize a skill\'s description for better triggering accuracy.', 'skillsmp', 'https://skillsmp.com/skill/anthropics-skills-skills-skill-creator-skill-md', 'skill://skillsmp/anthropics-skills-skills-skill-creator-skill-md@latest', 'rest-api', 95361, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-skills-skills-docx-skill-md', 'docx', 'anthropics', 'Use this skill whenever the user wants to create, read, edit, or manipulate Word documents (.docx files). Triggers include: any mention of \'Word doc\', \'word document\', \'.docx\', or requests to produce professional documents with formatting like tables of contents, headings, page numbers, or letterheads. Also use when extracting or reorganizing content from .docx files, inserting or replacing images in documents, performing find-and-replace in Word files, working with tracked changes or comments, or converting content into a polished Word document. If the user asks for a \'report\', \'memo\', \'letter\', \'template\', or similar deliverable as a Word or .docx file, use this skill. Do NOT use for PDFs, spreadsheets, Google Docs, or general coding tasks unrelated to document generation.', 'skillsmp', 'https://skillsmp.com/skill/anthropics-skills-skills-docx-skill-md', 'skill://skillsmp/anthropics-skills-skills-docx-skill-md@latest', 'rest-api', 95361, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:obra-superpowers-skills-writing-skills-skill-md', 'writing-skills', 'obra', 'Use when creating new skills, editing existing skills, or verifying skills work before deployment', 'skillsmp', 'https://skillsmp.com/skill/obra-superpowers-skills-writing-skills-skill-md', 'skill://skillsmp/obra-superpowers-skills-writing-skills-skill-md@latest', 'rest-api', 89686, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:obra-superpowers-skills-using-superpowers-skill-md', 'using-superpowers', 'obra', 'Use when starting any conversation - establishes how to find and use skills, requiring Skill tool invocation before ANY response including clarifying questions', 'skillsmp', 'https://skillsmp.com/skill/obra-superpowers-skills-using-superpowers-skill-md', 'skill://skillsmp/obra-superpowers-skills-using-superpowers-skill-md@latest', 'rest-api', 89686, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:affaan-m-everything-claude-code-skills-project-guidelines-example-skill-md', 'project-guidelines-example', 'affaan-m', 'Example project-specific skill template based on a real production application.', 'skillsmp', 'https://skillsmp.com/skill/affaan-m-everything-claude-code-skills-project-guidelines-example-skill-md', 'skill://skillsmp/affaan-m-everything-claude-code-skills-project-guidelines-example-skill-md@latest', 'rest-api', 81219, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:affaan-m-everything-claude-code-skills-security-review-skill-md', 'security-review', 'affaan-m', 'Use this skill when adding authentication, handling user input, working with secrets, creating API endpoints, or implementing payment/sensitive features. Provides comprehensive security checklist and patterns.', 'skillsmp', 'https://skillsmp.com/skill/affaan-m-everything-claude-code-skills-security-review-skill-md', 'skill://skillsmp/affaan-m-everything-claude-code-skills-security-review-skill-md@latest', 'rest-api', 81219, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:affaan-m-everything-claude-code-skills-tdd-workflow-skill-md', 'tdd-workflow', 'affaan-m', 'Use this skill when writing new features, fixing bugs, or refactoring code. Enforces test-driven development with 80%+ coverage including unit, integration, and E2E tests.', 'skillsmp', 'https://skillsmp.com/skill/affaan-m-everything-claude-code-skills-tdd-workflow-skill-md', 'skill://skillsmp/affaan-m-everything-claude-code-skills-tdd-workflow-skill-md@latest', 'rest-api', 81219, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:affaan-m-everything-claude-code-agents-skills-security-review-skill-md', 'security-review', 'affaan-m', 'Use this skill when adding authentication, handling user input, working with secrets, creating API endpoints, or implementing payment/sensitive features. Provides comprehensive security checklist and patterns.', 'skillsmp', 'https://skillsmp.com/skill/affaan-m-everything-claude-code-agents-skills-security-review-skill-md', 'skill://skillsmp/affaan-m-everything-claude-code-agents-skills-security-review-skill-md@latest', 'rest-api', 81219, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:affaan-m-everything-claude-code-agents-skills-tdd-workflow-skill-md', 'tdd-workflow', 'affaan-m', 'Use this skill when writing new features, fixing bugs, or refactoring code. Enforces test-driven development with 80%+ coverage including unit, integration, and E2E tests.', 'skillsmp', 'https://skillsmp.com/skill/affaan-m-everything-claude-code-agents-skills-tdd-workflow-skill-md', 'skill://skillsmp/affaan-m-everything-claude-code-agents-skills-tdd-workflow-skill-md@latest', 'rest-api', 81219, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:affaan-m-everything-claude-code-docs-zh-tw-skills-continuous-learning-skill-md', 'continuous-learning', 'affaan-m', 'Automatically extract reusable patterns from Claude Code sessions and save them as learned skills for future use.', 'skillsmp', 'https://skillsmp.com/skill/affaan-m-everything-claude-code-docs-zh-tw-skills-continuous-learning-skill-md', 'skill://skillsmp/affaan-m-everything-claude-code-docs-zh-tw-skills-continuous-learning-skill-md@latest', 'rest-api', 81219, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:affaan-m-everything-claude-code-skills-configure-ecc-skill-md', 'configure-ecc', 'affaan-m', 'Interactive installer for Everything Claude Code — guides users through selecting and installing skills and rules to user-level or project-level directories, verifies paths, and optionally optimizes installed files.', 'skillsmp', 'https://skillsmp.com/skill/affaan-m-everything-claude-code-skills-configure-ecc-skill-md', 'skill://skillsmp/affaan-m-everything-claude-code-skills-configure-ecc-skill-md@latest', 'rest-api', 81219, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:affaan-m-everything-claude-code-skills-continuous-learning-skill-md', 'continuous-learning', 'affaan-m', 'Automatically extract reusable patterns from Claude Code sessions and save them as learned skills for future use.', 'skillsmp', 'https://skillsmp.com/skill/affaan-m-everything-claude-code-skills-continuous-learning-skill-md', 'skill://skillsmp/affaan-m-everything-claude-code-skills-continuous-learning-skill-md@latest', 'rest-api', 81219, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-code-plugins-plugin-dev-skills-skill-development-skill-md', 'skill-development', 'anthropics', 'This skill should be used when the user wants to \"create a skill\", \"add a skill to plugin\", \"write a new skill\", \"improve skill description\", \"organize skill content\", or needs guidance on skill structure, progressive disclosure, or skill development best practices for Claude Code plugins.', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-code-plugins-plugin-dev-skills-skill-development-skill-md', 'skill://skillsmp/anthropics-claude-code-plugins-plugin-dev-skills-skill-development-skill-md@latest', 'rest-api', 78881, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-code-plugins-hookify-skills-writing-rules-skill-md', 'rule-identifier', 'anthropics', 'This skill should be used when the user asks to \"create a hookify rule\", \"write a hook rule\", \"configure hookify\", \"add a hookify rule\", or needs guidance on hookify rule syntax and patterns.', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-code-plugins-hookify-skills-writing-rules-skill-md', 'skill://skillsmp/anthropics-claude-code-plugins-hookify-skills-writing-rules-skill-md@latest', 'rest-api', 78881, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-code-plugins-plugin-dev-skills-agent-development-skill-md', 'agent-identifier', 'anthropics', 'This skill should be used when the user asks to \"create an agent\", \"add an agent\", \"write a subagent\", \"agent frontmatter\", \"when to use description\", \"agent examples\", \"agent tools\", \"agent colors\", \"autonomous agent\", or needs guidance on agent structure, system prompts, triggering conditions, or agent development best practices for Claude Code plugins.', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-code-plugins-plugin-dev-skills-agent-development-skill-md', 'skill://skillsmp/anthropics-claude-code-plugins-plugin-dev-skills-agent-development-skill-md@latest', 'rest-api', 78881, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-code-plugins-plugin-dev-skills-command-development-skill-md', 'command-development', 'anthropics', 'This skill should be used when the user asks to \"create a slash command\", \"add a command\", \"write a custom command\", \"define command arguments\", \"use command frontmatter\", \"organize commands\", \"create command with file references\", \"interactive command\", \"use AskUserQuestion in command\", or needs guidance on slash command structure, YAML frontmatter fields, dynamic arguments, bash execution in commands, user interaction patterns, or command development best practices for Claude Code.', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-code-plugins-plugin-dev-skills-command-development-skill-md', 'skill://skillsmp/anthropics-claude-code-plugins-plugin-dev-skills-command-development-skill-md@latest', 'rest-api', 78881, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-code-plugins-plugin-dev-skills-hook-development-skill-md', 'hook-development', 'anthropics', 'This skill should be used when the user asks to \"create a hook\", \"add a PreToolUse/PostToolUse/Stop hook\", \"validate tool use\", \"implement prompt-based hooks\", \"use ${CLAUDE_PLUGIN_ROOT}\", \"set up event-driven automation\", \"block dangerous commands\", or mentions hook events (PreToolUse, PostToolUse, Stop, SubagentStop, SessionStart, SessionEnd, UserPromptSubmit, PreCompact, Notification). Provides comprehensive guidance for creating and implementing Claude Code plugin hooks with focus on advanced prompt-based hooks API.', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-code-plugins-plugin-dev-skills-hook-development-skill-md', 'skill://skillsmp/anthropics-claude-code-plugins-plugin-dev-skills-hook-development-skill-md@latest', 'rest-api', 78881, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-code-plugins-plugin-dev-skills-mcp-integration-skill-md', 'mcp-integration', 'anthropics', 'This skill should be used when the user asks to \"add MCP server\", \"integrate MCP\", \"configure MCP in plugin\", \"use .mcp.json\", \"set up Model Context Protocol\", \"connect external service\", mentions \"${CLAUDE_PLUGIN_ROOT} with MCP\", or discusses MCP server types (SSE, stdio, HTTP, WebSocket). Provides comprehensive guidance for integrating Model Context Protocol servers into Claude Code plugins for external tool and service integration.', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-code-plugins-plugin-dev-skills-mcp-integration-skill-md', 'skill://skillsmp/anthropics-claude-code-plugins-plugin-dev-skills-mcp-integration-skill-md@latest', 'rest-api', 78881, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-code-plugins-plugin-dev-skills-plugin-settings-skill-md', 'configured-agent', 'anthropics', 'This skill should be used when the user asks about \"plugin settings\", \"store plugin configuration\", \"user-configurable plugin\", \".local.md files\", \"plugin state files\", \"read YAML frontmatter\", \"per-project plugin settings\", or wants to make plugin behavior configurable. Documents the .claude/plugin-name.local.md pattern for storing plugin-specific configuration with YAML frontmatter and markdown content.', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-code-plugins-plugin-dev-skills-plugin-settings-skill-md', 'skill://skillsmp/anthropics-claude-code-plugins-plugin-dev-skills-plugin-settings-skill-md@latest', 'rest-api', 78881, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-code-plugins-plugin-dev-skills-plugin-structure-skill-md', 'command-name', 'anthropics', 'This skill should be used when the user asks to \"create a plugin\", \"scaffold a plugin\", \"understand plugin structure\", \"organize plugin components\", \"set up plugin.json\", \"use ${CLAUDE_PLUGIN_ROOT}\", \"add commands/agents/skills/hooks\", \"configure auto-discovery\", or needs guidance on plugin directory layout, manifest configuration, component organization, file naming conventions, or Claude Code plugin architecture best practices.', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-code-plugins-plugin-dev-skills-plugin-structure-skill-md', 'skill://skillsmp/anthropics-claude-code-plugins-plugin-dev-skills-plugin-structure-skill-md@latest', 'rest-api', 78881, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-code-plugins-frontend-design-skills-frontend-design-skill-md', 'frontend-design', 'anthropics', 'Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, or applications. Generates creative, polished code that avoids generic AI aesthetics.', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-code-plugins-frontend-design-skills-frontend-design-skill-md', 'skill://skillsmp/anthropics-claude-code-plugins-frontend-design-skills-frontend-design-skill-md@latest', 'rest-api', 78881, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:openhands-openhands-agents-skills-update-sdk-skill-md', 'update-sdk', 'OpenHands', 'This skill should be used when the user asks to \"update SDK\", \"bump SDK version\", \"pin SDK to a commit\", \"test unreleased SDK\", \"update agent-server image\", \"bump the version\", \"prepare a release\", \"what files change for a release\", or needs to know how SDK packages are managed in the OpenHands repository. For detailed reference material, see references/docker-image-locations.md and references/sdk-pinning-examples.md in this skill directory.', 'skillsmp', 'https://skillsmp.com/skill/openhands-openhands-agents-skills-update-sdk-skill-md', 'skill://skillsmp/openhands-openhands-agents-skills-update-sdk-skill-md@latest', 'rest-api', 69255, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:openhands-openhands-agents-skills-upcoming-release-skill-md', 'upcoming-release', 'OpenHands', 'This skill should be used when the user asks to \"generate release notes\", \"list upcoming release PRs\", \"summarize upcoming release\", \"/upcoming-release\", or needs to know what changes are part of an upcoming release.', 'skillsmp', 'https://skillsmp.com/skill/openhands-openhands-agents-skills-upcoming-release-skill-md', 'skill://skillsmp/openhands-openhands-agents-skills-upcoming-release-skill-md@latest', 'rest-api', 69255, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:leonardomso-33-js-concepts-claude-skills-concept-workflow-skill-md', 'concept-workflow', 'leonardomso', 'End-to-end workflow for creating complete JavaScript concept documentation, orchestrating all skills from research to final review', 'skillsmp', 'https://skillsmp.com/skill/leonardomso-33-js-concepts-claude-skills-concept-workflow-skill-md', 'skill://skillsmp/leonardomso-33-js-concepts-claude-skills-concept-workflow-skill-md@latest', 'rest-api', 66287, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:openai-codex-codex-rs-skills-src-assets-samples-skill-creator-skill-md', 'skill-creator', 'openai', 'Guide for creating effective skills. This skill should be used when users want to create a new skill (or update an existing skill) that extends Codex\'s capabilities with specialized knowledge, workflows, or tool integrations.', 'skillsmp', 'https://skillsmp.com/skill/openai-codex-codex-rs-skills-src-assets-samples-skill-creator-skill-md', 'skill://skillsmp/openai-codex-codex-rs-skills-src-assets-samples-skill-creator-skill-md@latest', 'rest-api', 65750, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:mem0ai-mem0-skills-mem0-skill-md', 'mem0', 'mem0ai', 'Integrate Mem0 Platform into AI applications for persistent memory, personalization, and semantic search. Use this skill when the user mentions \"mem0\", \"memory layer\", \"remember user preferences\", \"persistent context\", \"personalization\", or needs to add long-term memory to chatbots, agents, or AI apps. Covers Python and TypeScript SDKs, framework integrations (LangChain, CrewAI, Vercel AI SDK, OpenAI Agents SDK, Pipecat), and the full Platform API. Use even when the user doesn\'t explicitly say \"mem0\" but describes needing conversation memory, user context retention, or knowledge retrieval across sessions.', 'skillsmp', 'https://skillsmp.com/skill/mem0ai-mem0-skills-mem0-skill-md', 'skill://skillsmp/mem0ai-mem0-skills-mem0-skill-md@latest', 'rest-api', 50112, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:upstash-context7-skills-find-docs-skill-md', 'find-docs', 'upstash', 'Retrieves authoritative, up-to-date technical documentation, API references, configuration details, and code examples for any developer technology.\nUse this skill whenever answering technical questions or writing code that interacts with external technologies. This includes libraries, frameworks, programming languages, SDKs, APIs, CLI tools, cloud services, infrastructure tools, and developer platforms.\nCommon scenarios: - looking up API endpoints, classes, functions, or method parameters - checking configuration options or CLI commands - answering \"how do I\" technical questions - generating code that uses a specific library or service - debugging issues related to frameworks, SDKs, or APIs - retrieving setup instructions, examples, or migration guides - verifying version-specific behavior or breaking changes\nPrefer this skill whenever documentation accuracy matters or when model knowledge may be outdated.', 'skillsmp', 'https://skillsmp.com/skill/upstash-context7-skills-find-docs-skill-md', 'skill://skillsmp/upstash-context7-skills-find-docs-skill-md@latest', 'rest-api', 49353, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:upstash-context7-skills-context7-cli-skill-md', 'context7-cli', 'upstash', 'Use the ctx7 CLI to fetch library documentation, manage AI coding skills, and configure Context7 MCP. Activate when the user mentions \"ctx7\" or \"context7\", needs current docs for any library, wants to install/search/generate skills, or needs to set up Context7 for their AI coding agent.', 'skillsmp', 'https://skillsmp.com/skill/upstash-context7-skills-context7-cli-skill-md', 'skill://skillsmp/upstash-context7-skills-context7-cli-skill-md@latest', 'rest-api', 49353, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:upstash-context7-plugins-claude-context7-skills-context7-mcp-skill-md', 'context7-mcp', 'upstash', 'This skill should be used when the user asks about libraries, frameworks, API references, or needs code examples. Activates for setup questions, code generation involving libraries, or mentions of specific frameworks like React, Vue, Next.js, Prisma, Supabase, etc.', 'skillsmp', 'https://skillsmp.com/skill/upstash-context7-plugins-claude-context7-skills-context7-mcp-skill-md', 'skill://skillsmp/upstash-context7-plugins-claude-context7-skills-context7-mcp-skill-md@latest', 'rest-api', 49353, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:karpathy-nanochat-claude-skills-read-arxiv-paper-skill-md', 'read-arxiv-paper', 'karpathy', 'Use this skill when when asked to read an arxiv paper given an arxiv URL', 'skillsmp', 'https://skillsmp.com/skill/karpathy-nanochat-claude-skills-read-arxiv-paper-skill-md', 'skill://skillsmp/karpathy-nanochat-claude-skills-read-arxiv-paper-skill-md@latest', 'rest-api', 49098, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:tldraw-tldraw-claude-skills-skill-creator-skill-md', 'skill-creator', 'tldraw', 'Guide for creating effective skills. This skill should be used when users want to create a new skill (or update an existing skill) that extends Claude\'s capabilities with specialized knowledge, workflows, or tool integrations.', 'skillsmp', 'https://skillsmp.com/skill/tldraw-tldraw-claude-skills-skill-creator-skill-md', 'skill://skillsmp/tldraw-tldraw-claude-skills-skill-creator-skill-md@latest', 'rest-api', 45872, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:tldraw-tldraw-apps-mcp-app-claude-skills-add-app-to-server-skill-md', 'add-app-to-server', 'tldraw', 'This skill should be used when the user asks to \"add an app to my MCP server\", \"add UI to my MCP server\", \"add a view to my MCP tool\", \"enrich MCP tools with UI\", \"add interactive UI to existing server\", \"add MCP Apps to my server\", or needs to add interactive UI capabilities to an existing MCP server that already has tools. Provides guidance for analyzing existing tools and adding MCP Apps UI resources.', 'skillsmp', 'https://skillsmp.com/skill/tldraw-tldraw-apps-mcp-app-claude-skills-add-app-to-server-skill-md', 'skill://skillsmp/tldraw-tldraw-apps-mcp-app-claude-skills-add-app-to-server-skill-md@latest', 'rest-api', 45872, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:tldraw-tldraw-apps-mcp-app-claude-skills-convert-web-app-skill-md', 'convert-web-app', 'tldraw', 'This skill should be used when the user asks to \"add MCP App support to my web app\", \"turn my web app into a hybrid MCP App\", \"make my web page work as an MCP App too\", \"wrap my existing UI as an MCP App\", \"convert iframe embed to MCP App\", \"turn my SPA into an MCP App\", or needs to add MCP App support to an existing web application while keeping it working standalone. Provides guidance for analyzing existing web apps and creating a hybrid web + MCP App with server-side tool and resource registration.', 'skillsmp', 'https://skillsmp.com/skill/tldraw-tldraw-apps-mcp-app-claude-skills-convert-web-app-skill-md', 'skill://skillsmp/tldraw-tldraw-apps-mcp-app-claude-skills-convert-web-app-skill-md@latest', 'rest-api', 45872, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:tldraw-tldraw-apps-mcp-app-claude-skills-create-mcp-app-skill-md', 'create-mcp-app', 'tldraw', 'This skill should be used when the user asks to \"create an MCP App\", \"add a UI to an MCP tool\", \"build an interactive MCP View\", \"scaffold an MCP App\", or needs guidance on MCP Apps SDK patterns, UI-resource registration, MCP App lifecycle, or host integration. Provides comprehensive guidance for building MCP Apps with interactive UIs.', 'skillsmp', 'https://skillsmp.com/skill/tldraw-tldraw-apps-mcp-app-claude-skills-create-mcp-app-skill-md', 'skill://skillsmp/tldraw-tldraw-apps-mcp-app-claude-skills-create-mcp-app-skill-md@latest', 'rest-api', 45872, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:tldraw-tldraw-apps-mcp-app-claude-skills-migrate-oai-app-skill-md', 'migrate-oai-app', 'tldraw', 'This skill should be used when the user asks to \"migrate from OpenAI Apps SDK\", \"convert OpenAI App to MCP\", \"port from window.openai\", \"migrate from skybridge\", \"convert openai/outputTemplate\", or needs guidance on converting OpenAI Apps SDK applications to MCP Apps SDK. Provides step-by-step migration guidance with API mapping tables.', 'skillsmp', 'https://skillsmp.com/skill/tldraw-tldraw-apps-mcp-app-claude-skills-migrate-oai-app-skill-md', 'skill://skillsmp/tldraw-tldraw-apps-mcp-app-claude-skills-migrate-oai-app-skill-md@latest', 'rest-api', 45872, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:composiohq-awesome-claude-skills-skill-share-skill-md', 'skill-share', 'ComposioHQ', 'A skill that creates new Claude skills and automatically shares them on Slack using Rube for seamless team collaboration and skill discovery.', 'skillsmp', 'https://skillsmp.com/skill/composiohq-awesome-claude-skills-skill-share-skill-md', 'skill://skillsmp/composiohq-awesome-claude-skills-skill-share-skill-md@latest', 'rest-api', 44880, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:composiohq-awesome-claude-skills-meeting-insights-analyzer-skill-md', 'meeting-insights-analyzer', 'ComposioHQ', 'Analyzes meeting transcripts and recordings to uncover behavioral patterns, communication insights, and actionable feedback. Identifies when you avoid conflict, use filler words, dominate conversations, or miss opportunities to listen. Perfect for professionals seeking to improve their communication and leadership skills.', 'skillsmp', 'https://skillsmp.com/skill/composiohq-awesome-claude-skills-meeting-insights-analyzer-skill-md', 'skill://skillsmp/composiohq-awesome-claude-skills-meeting-insights-analyzer-skill-md@latest', 'rest-api', 44880, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:composiohq-awesome-claude-skills-connect-apps-skill-md', 'connect-apps', 'ComposioHQ', 'Connect Claude to external apps like Gmail, Slack, GitHub. Use this skill when the user wants to send emails, create issues, post messages, or take actions in external services.', 'skillsmp', 'https://skillsmp.com/skill/composiohq-awesome-claude-skills-connect-apps-skill-md', 'skill://skillsmp/composiohq-awesome-claude-skills-connect-apps-skill-md@latest', 'rest-api', 44880, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:composiohq-awesome-claude-skills-tailored-resume-generator-skill-md', 'tailored-resume-generator', 'ComposioHQ', 'Analyzes job descriptions and generates tailored resumes that highlight relevant experience, skills, and achievements to maximize interview chances', 'skillsmp', 'https://skillsmp.com/skill/composiohq-awesome-claude-skills-tailored-resume-generator-skill-md', 'skill://skillsmp/composiohq-awesome-claude-skills-tailored-resume-generator-skill-md@latest', 'rest-api', 44880, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:composiohq-awesome-claude-skills-video-downloader-skill-md', 'youtube-downloader', 'ComposioHQ', 'Download YouTube videos with customizable quality and format options. Use this skill when the user asks to download, save, or grab YouTube videos. Supports various quality settings (best, 1080p, 720p, 480p, 360p), multiple formats (mp4, webm, mkv), and audio-only downloads as MP3.', 'skillsmp', 'https://skillsmp.com/skill/composiohq-awesome-claude-skills-video-downloader-skill-md', 'skill://skillsmp/composiohq-awesome-claude-skills-video-downloader-skill-md@latest', 'rest-api', 44880, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:meteor-meteor-github-skills-ai-context-skill-md', 'ai-context', 'meteor', 'Use when creating, updating, or maintaining AI documentation files (AGENTS.md, CLAUDE.md, skills). Covers file structure, conventions, and guidelines for evolving AI context.', 'skillsmp', 'https://skillsmp.com/skill/meteor-meteor-github-skills-ai-context-skill-md', 'skill://skillsmp/meteor-meteor-github-skills-ai-context-skill-md@latest', 'rest-api', 44779, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:zhayujie-chatgpt-on-wechat-skills-skill-creator-skill-md', 'skill-creator', 'zhayujie', 'Create, install, or update skills in the workspace. Use when (1) installing a skill from a URL or remote source, (2) creating a new skill from scratch, (3) updating or restructuring existing skills. Always use this skill for any skill installation or creation task.', 'skillsmp', 'https://skillsmp.com/skill/zhayujie-chatgpt-on-wechat-skills-skill-creator-skill-md', 'skill://skillsmp/zhayujie-chatgpt-on-wechat-skills-skill-creator-skill-md@latest', 'rest-api', 42248, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:nextlevelbuilder-ui-ux-pro-max-skill-claude-skills-banner-design-skill-md', 'ckmbanner-design', 'nextlevelbuilder', 'Design banners for social media, ads, website heroes, creative assets, and print. Multiple art direction options with AI-generated visuals. Actions: design, create, generate banner. Platforms: Facebook, Twitter/X, LinkedIn, YouTube, Instagram, Google Display, website hero, print. Styles: minimalist, gradient, bold typography, photo-based, illustrated, geometric, retro, glassmorphism, 3D, neon, duotone, editorial, collage. Uses ui-ux-pro-max, frontend-design, ai-artist, ai-multimodal skills.', 'skillsmp', 'https://skillsmp.com/skill/nextlevelbuilder-ui-ux-pro-max-skill-claude-skills-banner-design-skill-md', 'skill://skillsmp/nextlevelbuilder-ui-ux-pro-max-skill-claude-skills-banner-design-skill-md@latest', 'rest-api', 42033, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:nextlevelbuilder-ui-ux-pro-max-skill-claude-skills-design-skill-md', 'ckmdesign', 'nextlevelbuilder', 'Comprehensive design skill: brand identity, design tokens, UI styling, logo generation (55 styles, Gemini AI), corporate identity program (50 deliverables, CIP mockups), HTML presentations (Chart.js), banner design (22 styles, social/ads/web/print), icon design (15 styles, SVG, Gemini 3.1 Pro), social photos (HTML→screenshot, multi-platform). Actions: design logo, create CIP, generate mockups, build slides, design banner, generate icon, create social photos, social media images, brand identity, design system. Platforms: Facebook, Twitter, LinkedIn, YouTube, Instagram, Pinterest, TikTok, Threads, Google Ads.', 'skillsmp', 'https://skillsmp.com/skill/nextlevelbuilder-ui-ux-pro-max-skill-claude-skills-design-skill-md', 'skill://skillsmp/nextlevelbuilder-ui-ux-pro-max-skill-claude-skills-design-skill-md@latest', 'rest-api', 42033, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:cherryhq-cherry-studio-agents-skills-create-skill-skill-md', 'create-skill', 'CherryHQ', 'Create a new skill in the current repository. Use when the user wants to create/add a new skill, or mentions creating a skill from scratch. This skill follows the workflow defined in .agents/skills/README.md and helps scaffold, validate, and sync new skills.', 'skillsmp', 'https://skillsmp.com/skill/cherryhq-cherry-studio-agents-skills-create-skill-skill-md', 'skill://skillsmp/cherryhq-cherry-studio-agents-skills-create-skill-skill-md@latest', 'rest-api', 41624, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bmad-code-org-bmad-method-src-core-skills-bmad-init-skill-md', 'bmad-init', 'bmad-code-org', 'Initialize BMad project configuration and load config variables. Use when any skill needs module-specific configuration values, or when setting up a new BMad project.', 'skillsmp', 'https://skillsmp.com/skill/bmad-code-org-bmad-method-src-core-skills-bmad-init-skill-md', 'skill://skillsmp/bmad-code-org-bmad-method-src-core-skills-bmad-init-skill-md@latest', 'rest-api', 40972, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:code-yeongyu-oh-my-openagent-src-features-builtin-skills-git-master-skill-md', 'git-master', 'code-yeongyu', 'MUST USE for ANY git operations. Atomic commits, rebase/squash, history search (blame, bisect, log -S). STRONGLY RECOMMENDED: Use with task(category=\'quick\', load_skills=[\'git-master\'], ...) to save context. Triggers: \'commit\', \'rebase\', \'squash\', \'who wrote\', \'when was X added\', \'find the commit that\'.', 'skillsmp', 'https://skillsmp.com/skill/code-yeongyu-oh-my-openagent-src-features-builtin-skills-git-master-skill-md', 'skill://skillsmp/code-yeongyu-oh-my-openagent-src-features-builtin-skills-git-master-skill-md@latest', 'rest-api', 40636, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:calcom-cal-com-agents-skills-vercel-react-best-practices-skill-md', 'vercel-react-best-practices', 'calcom', 'React and Next.js performance optimization guidelines from Vercel Engineering. This skill should be used when writing, reviewing, or refactoring React/Next.js code to ensure optimal performance patterns. Triggers on tasks involving React components, Next.js pages, data fetching, bundle optimization, or performance improvements.', 'skillsmp', 'https://skillsmp.com/skill/calcom-cal-com-agents-skills-vercel-react-best-practices-skill-md', 'skill://skillsmp/calcom-cal-com-agents-skills-vercel-react-best-practices-skill-md@latest', 'rest-api', 40592, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:calcom-cal-com-agents-skills-calcom-api-skill-md', 'calcom-api', 'calcom', 'Interact with the Cal.com API v2 to manage scheduling, bookings, event types, availability, and calendars. Use this skill when building integrations that need to create or manage bookings, check availability, configure event types, or sync calendars with Cal.com\'s scheduling infrastructure.', 'skillsmp', 'https://skillsmp.com/skill/calcom-cal-com-agents-skills-calcom-api-skill-md', 'skill://skillsmp/calcom-cal-com-agents-skills-calcom-api-skill-md@latest', 'rest-api', 40592, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:rssnext-folo-agents-skills-mobile-self-test-skill-md', 'mobile-self-test', 'RSSNext', 'Self-test a mobile feature change or bug fix after implementation in `apps/mobile`. Use this whenever the user asks to verify a mobile change, run simulator acceptance, smoke-test a mobile PR, or provide screenshot proof for a mobile fix. This skill decides between prod vs local API mode, starts the local follow-server when needed, builds a release app, uses Maestro only to bootstrap registration for non-auth work, then switches to screenshot-driven visual validation and returns screenshot evidence.', 'skillsmp', 'https://skillsmp.com/skill/rssnext-folo-agents-skills-mobile-self-test-skill-md', 'skill://skillsmp/rssnext-folo-agents-skills-mobile-self-test-skill-md@latest', 'rest-api', 37684, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:ruvnet-ruview-claude-skills-skill-builder-skill-md', 'skill-builder', 'ruvnet', 'Create new Claude Code Skills with proper YAML frontmatter, progressive disclosure structure, and complete directory organization. Use when you need to build custom skills for specific workflows, generate skill templates, or understand the Claude Skills specification.', 'skillsmp', 'https://skillsmp.com/skill/ruvnet-ruview-claude-skills-skill-builder-skill-md', 'skill://skillsmp/ruvnet-ruview-claude-skills-skill-builder-skill-md@latest', 'rest-api', 37555, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:alibaba-arthas-skills-skill-md', 'arthas', 'alibaba', 'arthas 诊断 java应用，jvm问题 skill', 'skillsmp', 'https://skillsmp.com/skill/alibaba-arthas-skills-skill-md', 'skill://skillsmp/alibaba-arthas-skills-skill-md@latest', 'rest-api', 37194, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:amruthpillai-reactive-resume-skills-resume-builder-skill-md', 'resume-builder', 'amruthpillai', 'Generate professional resumes that conform to the Reactive Resume schema. Use when the user wants to create, build, or generate a resume through conversational AI, or asks about resume structure, sections, or content. This skill guides the agent to ask clarifying questions, avoid hallucination, and produce valid JSON output for https://rxresu.me.', 'skillsmp', 'https://skillsmp.com/skill/amruthpillai-reactive-resume-skills-resume-builder-skill-md', 'skill://skillsmp/amruthpillai-reactive-resume-skills-resume-builder-skill-md@latest', 'rest-api', 35809, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-cookbooks-skills-custom-skills-applying-brand-guidelines-skill-md', 'applying-brand-guidelines', 'anthropics', 'This skill applies consistent corporate branding and styling to all generated documents including colors, fonts, layouts, and messaging', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-cookbooks-skills-custom-skills-applying-brand-guidelines-skill-md', 'skill://skillsmp/anthropics-claude-cookbooks-skills-custom-skills-applying-brand-guidelines-skill-md@latest', 'rest-api', 35028, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-cookbooks-skills-custom-skills-analyzing-financial-statements-skill-md', 'analyzing-financial-statements', 'anthropics', 'This skill calculates key financial ratios and metrics from financial statement data for investment analysis', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-cookbooks-skills-custom-skills-analyzing-financial-statements-skill-md', 'skill://skillsmp/anthropics-claude-cookbooks-skills-custom-skills-analyzing-financial-statements-skill-md@latest', 'rest-api', 35028, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:anthropics-claude-cookbooks-skills-custom-skills-creating-financial-models-skill-md', 'creating-financial-models', 'anthropics', 'This skill provides an advanced financial modeling suite with DCF analysis, sensitivity testing, Monte Carlo simulations, and scenario planning for investment decisions', 'skillsmp', 'https://skillsmp.com/skill/anthropics-claude-cookbooks-skills-custom-skills-creating-financial-models-skill-md', 'skill://skillsmp/anthropics-claude-cookbooks-skills-custom-skills-creating-financial-models-skill-md@latest', 'rest-api', 35028, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:moeru-ai-airi-agents-skills-xsai-skill-md', 'xsai', 'moeru-ai', 'Use this skill when the user is building with `xsai` or any `@xsai/*` package, or is evaluating xsAI for a small OpenAI-compatible workflow with text generation, streaming, tool calling, structured output, embeddings, image generation, speech synthesis, or transcription.', 'skillsmp', 'https://skillsmp.com/skill/moeru-ai-airi-agents-skills-xsai-skill-md', 'skill://skillsmp/moeru-ai-airi-agents-skills-xsai-skill-md@latest', 'rest-api', 34133, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:moeru-ai-airi-agents-skills-eventa-skill-md', 'eventa', 'moeru-ai', 'Guide for using @moeru/eventa — a transport-aware event library powering ergonomic RPC and streaming flows. Use this skill whenever the user imports from \'@moeru/eventa\', mentions eventa, needs cross-process/cross-thread event communication (Electron IPC, Web Workers, WebSocket, BroadcastChannel, EventEmitter, EventTarget, Worker Threads), wants to define type-safe events with RPC invoke patterns, needs streaming RPC (server-streaming, client-streaming, or bidirectional), or asks about transport-agnostic event abstractions. Also use when the user discusses alternatives to birpc or async-call-rpc.', 'skillsmp', 'https://skillsmp.com/skill/moeru-ai-airi-agents-skills-eventa-skill-md', 'skill://skillsmp/moeru-ai-airi-agents-skills-eventa-skill-md@latest', 'rest-api', 34133, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:hkuds-nanobot-nanobot-skills-skill-creator-skill-md', 'skill-creator', 'HKUDS', 'Create or update AgentSkills. Use when designing, structuring, or packaging skills with scripts, references, and assets.', 'skillsmp', 'https://skillsmp.com/skill/hkuds-nanobot-nanobot-skills-skill-creator-skill-md', 'skill://skillsmp/hkuds-nanobot-nanobot-skills-skill-creator-skill-md@latest', 'rest-api', 34109, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:hkuds-nanobot-nanobot-skills-clawhub-skill-md', 'clawhub', 'HKUDS', 'Search and install agent skills from ClawHub, the public skill registry.', 'skillsmp', 'https://skillsmp.com/skill/hkuds-nanobot-nanobot-skills-clawhub-skill-md', 'skill://skillsmp/hkuds-nanobot-nanobot-skills-clawhub-skill-md@latest', 'rest-api', 34109, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:alibaba-nacos-skills-nacos-skill-registry-skill-md', 'nacos-skill-registry', 'alibaba', 'Discover, install, and upload AI skills with Nacos. Use when users want to find, install, or publish skills to a team\'s Nacos server.', 'skillsmp', 'https://skillsmp.com/skill/alibaba-nacos-skills-nacos-skill-registry-skill-md', 'skill://skillsmp/alibaba-nacos-skills-nacos-skill-registry-skill-md@latest', 'rest-api', 32739, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:remix-run-remix-agents-skills-supersede-pr-skill-md', 'supersede-pr', 'remix-run', 'Safely replace one GitHub pull request with another. Use when a user says a PR supersedes/replaces an older PR, asks to auto-close a superseded PR, or needs guaranteed closure behavior after merge. This skill explicitly closes the superseded PR with gh CLI and verifies final PR states instead of relying on closing keywords.', 'skillsmp', 'https://skillsmp.com/skill/remix-run-remix-agents-skills-supersede-pr-skill-md', 'skill://skillsmp/remix-run-remix-agents-skills-supersede-pr-skill-md@latest', 'rest-api', 32523, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:remix-run-remix-agents-skills-make-pr-skill-md', 'make-pr', 'remix-run', 'Create GitHub pull requests with clear, reviewer-friendly descriptions. Use when asked to open or prepare a PR, especially when the PR needs strong context, related links, and feature usage examples. This skill enforces concise PR structure, avoids redundant sections like validation/testing, and creates the PR with gh CLI.', 'skillsmp', 'https://skillsmp.com/skill/remix-run-remix-agents-skills-make-pr-skill-md', 'skill://skillsmp/remix-run-remix-agents-skills-make-pr-skill-md@latest', 'rest-api', 32523, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:patchy631-ai-engineering-hub-hugging-face-skills-skills-hugging-face-tool-builder-skill-md', 'hugging-face-tool-builder', 'patchy631', 'Use this skill when the user wants to build tool/scripts or achieve a task where using data from the Hugging Face API would help. This is especially useful when chaining or combining API calls or the task will be repeated/automated. This Skill creates a reusable script to fetch, enrich or process data.', 'skillsmp', 'https://skillsmp.com/skill/patchy631-ai-engineering-hub-hugging-face-skills-skills-hugging-face-tool-builder-skill-md', 'skill://skillsmp/patchy631-ai-engineering-hub-hugging-face-skills-skills-hugging-face-tool-builder-skill-md@latest', 'rest-api', 32188, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:patchy631-ai-engineering-hub-hugging-face-skills-skills-hugging-face-model-trainer-skill-md', 'hugging-face-model-trainer', 'patchy631', 'This skill should be used when users want to train or fine-tune language models using TRL (Transformer Reinforcement Learning) on Hugging Face Jobs infrastructure. Covers SFT, DPO, GRPO and reward modeling training methods, plus GGUF conversion for local deployment. Includes guidance on the TRL Jobs package, UV scripts with PEP 723 format, dataset preparation and validation, hardware selection, cost estimation, Trackio monitoring, Hub authentication, and model persistence. Should be invoked for tasks involving cloud GPU training, GGUF conversion, or when users mention training on Hugging Face Jobs without local GPU setup.', 'skillsmp', 'https://skillsmp.com/skill/patchy631-ai-engineering-hub-hugging-face-skills-skills-hugging-face-model-trainer-skill-md', 'skill://skillsmp/patchy631-ai-engineering-hub-hugging-face-skills-skills-hugging-face-model-trainer-skill-md@latest', 'rest-api', 32188, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:patchy631-ai-engineering-hub-hugging-face-skills-skills-hugging-face-jobs-skill-md', 'hugging-face-jobs', 'patchy631', 'This skill should be used when users want to run any workload on Hugging Face Jobs infrastructure. Covers UV scripts, Docker-based jobs, hardware selection, cost estimation, authentication with tokens, secrets management, timeout configuration, and result persistence. Designed for general-purpose compute workloads including data processing, inference, experiments, batch jobs, and any Python-based tasks. Should be invoked for tasks involving cloud compute, GPU workloads, or when users mention running jobs on Hugging Face infrastructure without local setup.', 'skillsmp', 'https://skillsmp.com/skill/patchy631-ai-engineering-hub-hugging-face-skills-skills-hugging-face-jobs-skill-md', 'skill://skillsmp/patchy631-ai-engineering-hub-hugging-face-skills-skills-hugging-face-jobs-skill-md@latest', 'rest-api', 32188, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:posthog-posthog-agents-skills-writing-skills-skill-md', 'writing-skills', 'PostHog', 'Guide for writing PostHog agent skills — job-to-be-done templates that teach agents how to use MCP tools to achieve a goal. Use when adding new product functionality that agents should know how to work with, creating a new skill, or updating existing skills in products/*/skills/.', 'skillsmp', 'https://skillsmp.com/skill/posthog-posthog-agents-skills-writing-skills-skill-md', 'skill://skillsmp/posthog-posthog-agents-skills-writing-skills-skill-md@latest', 'rest-api', 32065, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:openbmb-chatdev-agents-skills-greeting-demo-skill-md', 'greeting-demo', 'OpenBMB', 'Greet the user in a distinctive, easy-to-verify format for skill activation demos.', 'skillsmp', 'https://skillsmp.com/skill/openbmb-chatdev-agents-skills-greeting-demo-skill-md', 'skill://skillsmp/openbmb-chatdev-agents-skills-greeting-demo-skill-md@latest', 'rest-api', 31678, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-agent-teams-skills-team-communication-protocols-skill-md', 'team-communication-protocols', 'wshobson', 'Structured messaging protocols for agent team communication including message type selection, plan approval, shutdown procedures, and anti-patterns to avoid. Use this skill when establishing team communication norms, handling plan approvals, or managing team shutdown.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-agent-teams-skills-team-communication-protocols-skill-md', 'skill://skillsmp/wshobson-agents-plugins-agent-teams-skills-team-communication-protocols-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-agent-teams-skills-team-composition-patterns-skill-md', 'team-composition-patterns', 'wshobson', 'Design optimal agent team compositions with sizing heuristics, preset configurations, and agent type selection. Use this skill when deciding team size, selecting agent types, or configuring team presets for multi-agent workflows.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-agent-teams-skills-team-composition-patterns-skill-md', 'skill://skillsmp/wshobson-agents-plugins-agent-teams-skills-team-composition-patterns-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-conductor-skills-track-management-skill-md', 'track-management', 'wshobson', 'Use this skill when creating, managing, or working with Conductor tracks - the logical work units for features, bugs, and refactors. Applies to spec.md, plan.md, and track lifecycle operations.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-conductor-skills-track-management-skill-md', 'skill://skillsmp/wshobson-agents-plugins-conductor-skills-track-management-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-conductor-skills-workflow-patterns-skill-md', 'workflow-patterns', 'wshobson', 'Use this skill when implementing tasks according to Conductor\'s TDD workflow, handling phase checkpoints, managing git commits for tasks, or understanding the verification protocol.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-conductor-skills-workflow-patterns-skill-md', 'skill://skillsmp/wshobson-agents-plugins-conductor-skills-workflow-patterns-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-startup-business-analyst-skills-competitive-landscape-skill-md', 'competitive-landscape', 'wshobson', 'This skill should be used when the user asks to \"analyze competitors\", \"assess competitive landscape\", \"identify differentiation\", \"evaluate market positioning\", \"apply Porter\'s Five Forces\", or requests competitive strategy analysis.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-startup-business-analyst-skills-competitive-landscape-skill-md', 'skill://skillsmp/wshobson-agents-plugins-startup-business-analyst-skills-competitive-landscape-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-startup-business-analyst-skills-market-sizing-analysis-skill-md', 'market-sizing-analysis', 'wshobson', 'This skill should be used when the user asks to \"calculate TAM\", \"determine SAM\", \"estimate SOM\", \"size the market\", \"calculate market opportunity\", \"what\'s the total addressable market\", or requests market sizing analysis for a startup or business opportunity.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-startup-business-analyst-skills-market-sizing-analysis-skill-md', 'skill://skillsmp/wshobson-agents-plugins-startup-business-analyst-skills-market-sizing-analysis-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-startup-business-analyst-skills-startup-financial-modeling-skill-md', 'startup-financial-modeling', 'wshobson', 'This skill should be used when the user asks to \"create financial projections\", \"build a financial model\", \"forecast revenue\", \"calculate burn rate\", \"estimate runway\", \"model cash flow\", or requests 3-5 year financial planning for a startup.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-startup-business-analyst-skills-startup-financial-modeling-skill-md', 'skill://skillsmp/wshobson-agents-plugins-startup-business-analyst-skills-startup-financial-modeling-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-startup-business-analyst-skills-startup-metrics-framework-skill-md', 'startup-metrics-framework', 'wshobson', 'This skill should be used when the user asks about \"key startup metrics\", \"SaaS metrics\", \"CAC and LTV\", \"unit economics\", \"burn multiple\", \"rule of 40\", \"marketplace metrics\", or requests guidance on tracking and optimizing business performance metrics.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-startup-business-analyst-skills-startup-metrics-framework-skill-md', 'skill://skillsmp/wshobson-agents-plugins-startup-business-analyst-skills-startup-metrics-framework-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-startup-business-analyst-skills-team-composition-analysis-skill-md', 'team-composition-analysis', 'wshobson', 'This skill should be used when the user asks to \"plan team structure\", \"determine hiring needs\", \"design org chart\", \"calculate compensation\", \"plan equity allocation\", or requests organizational design and headcount planning for a startup.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-startup-business-analyst-skills-team-composition-analysis-skill-md', 'skill://skillsmp/wshobson-agents-plugins-startup-business-analyst-skills-team-composition-analysis-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-agent-teams-skills-multi-reviewer-patterns-skill-md', 'multi-reviewer-patterns', 'wshobson', 'Coordinate parallel code reviews across multiple quality dimensions with finding deduplication, severity calibration, and consolidated reporting. Use this skill when organizing multi-reviewer code reviews, calibrating finding severity, or consolidating review results.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-agent-teams-skills-multi-reviewer-patterns-skill-md', 'skill://skillsmp/wshobson-agents-plugins-agent-teams-skills-multi-reviewer-patterns-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-agent-teams-skills-parallel-debugging-skill-md', 'parallel-debugging', 'wshobson', 'Debug complex issues using competing hypotheses with parallel investigation, evidence collection, and root cause arbitration. Use this skill when debugging bugs with multiple potential causes, performing root cause analysis, or organizing parallel investigation workflows.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-agent-teams-skills-parallel-debugging-skill-md', 'skill://skillsmp/wshobson-agents-plugins-agent-teams-skills-parallel-debugging-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-agent-teams-skills-parallel-feature-development-skill-md', 'parallel-feature-development', 'wshobson', 'Coordinate parallel feature development with file ownership strategies, conflict avoidance rules, and integration patterns for multi-agent implementation. Use this skill when decomposing features for parallel development, establishing file ownership boundaries, or managing integration between parallel work streams.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-agent-teams-skills-parallel-feature-development-skill-md', 'skill://skillsmp/wshobson-agents-plugins-agent-teams-skills-parallel-feature-development-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:wshobson-agents-plugins-agent-teams-skills-task-coordination-strategies-skill-md', 'task-coordination-strategies', 'wshobson', 'Decompose complex tasks, design dependency graphs, and coordinate multi-agent work with proper task descriptions and workload balancing. Use this skill when breaking down work for agent teams, managing task dependencies, or monitoring team progress.', 'skillsmp', 'https://skillsmp.com/skill/wshobson-agents-plugins-agent-teams-skills-task-coordination-strategies-skill-md', 'skill://skillsmp/wshobson-agents-plugins-agent-teams-skills-task-coordination-strategies-skill-md@latest', 'rest-api', 31458, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-skill-creator-skill-md', 'skill-creator', 'bytedance', 'Create new skills, modify and improve existing skills, and measure skill performance. Use when users want to create a skill from scratch, edit, or optimize an existing skill, run evals to test a skill, benchmark skill performance with variance analysis, or optimize a skill\'s description for better triggering accuracy.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-skill-creator-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-skill-creator-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-find-skills-skill-md', 'find-skills', 'bytedance', 'Helps users discover and install agent skills when they ask questions like \"how do I do X\", \"find a skill for X\", \"is there a skill that can...\", or express interest in extending capabilities. This skill should be used when the user is looking for functionality that might exist as an installable skill.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-find-skills-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-find-skills-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-consulting-analysis-skill-md', 'consulting-analysis', 'bytedance', 'Use this skill when the user requests to generate, create, or write professional research reports including but not limited to market analysis, consumer insights, brand analysis, financial analysis, industry research, competitive intelligence, investment due diligence, or any consulting-grade analytical report. This skill operates in two phases — (1) generating a structured analysis framework with chapter skeleton, data query requirements, and analysis logic, and (2) after data collection by other skills, producing the final consulting-grade report with structured narratives, embedded charts, and strategic insights.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-consulting-analysis-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-consulting-analysis-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-deep-research-skill-md', 'deep-research', 'bytedance', 'Use this skill instead of WebSearch for ANY question requiring web research. Trigger on queries like \"what is X\", \"explain X\", \"compare X and Y\", \"research X\", or before content generation tasks. Provides systematic multi-angle research methodology instead of single superficial searches. Use this proactively when the user\'s question needs online information.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-deep-research-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-deep-research-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-frontend-design-skill-md', 'frontend-design', 'bytedance', 'Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, artifacts, posters, or applications (examples include websites, landing pages, dashboards, React components, HTML/CSS layouts, or when styling/beautifying any web UI). Generates creative, polished code and UI design that avoids generic AI aesthetics.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-frontend-design-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-frontend-design-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-image-generation-skill-md', 'image-generation', 'bytedance', 'Use this skill when the user requests to generate, create, imagine, or visualize images including characters, scenes, products, or any visual content. Supports structured prompts and reference images for guided generation.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-image-generation-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-image-generation-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-podcast-generation-skill-md', 'podcast-generation', 'bytedance', 'Use this skill when the user requests to generate, create, or produce podcasts from text content. Converts written content into a two-host conversational podcast audio format with natural dialogue.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-podcast-generation-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-podcast-generation-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-ppt-generation-skill-md', 'ppt-generation', 'bytedance', 'Use this skill when the user requests to generate, create, or make presentations (PPT/PPTX). Creates visually rich slides by generating images for each slide and composing them into a PowerPoint file.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-ppt-generation-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-ppt-generation-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-surprise-me-skill-md', 'surprise-me', 'bytedance', 'Create a delightful, unexpected \"wow\" experience for the user by dynamically discovering and creatively combining other enabled skills. Triggers when the user says \"surprise me\" or any request expressing a desire for an unexpected creative showcase. Also triggers when the user is bored, wants inspiration, or asks for \"something interesting\".', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-surprise-me-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-surprise-me-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-vercel-deploy-claimable-skill-md', 'vercel-deploy', 'bytedance', 'Deploy applications and websites to Vercel. Use this skill when the user requests deployment actions such as \"Deploy my app\", \"Deploy this to production\", \"Create a preview deployment\", \"Deploy and give me the link\", or \"Push this live\". No authentication required - returns preview URL and claimable deployment link.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-vercel-deploy-claimable-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-vercel-deploy-claimable-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-video-generation-skill-md', 'video-generation', 'bytedance', 'Use this skill when the user requests to generate, create, or imagine videos. Supports structured prompts and reference image for guided generation.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-video-generation-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-video-generation-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-claude-to-deerflow-skill-md', 'claude-to-deerflow', 'bytedance', 'Interact with DeerFlow AI agent platform via its HTTP API. Use this skill when the user wants to send messages or questions to DeerFlow for research/analysis, start a DeerFlow conversation thread, check DeerFlow status or health, list available models/skills/agents in DeerFlow, manage DeerFlow memory, upload files to DeerFlow threads, or delegate complex research tasks to DeerFlow. Also use when the user mentions deerflow, deer flow, or wants to run a deep research task that DeerFlow can handle.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-claude-to-deerflow-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-claude-to-deerflow-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-chart-visualization-skill-md', 'chart-visualization', 'bytedance', 'This skill should be used when the user wants to visualize data. It intelligently selects the most suitable chart type from 26 available options, extracts parameters based on detailed specifications, and generates a chart image using a JavaScript script.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-chart-visualization-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-chart-visualization-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:bytedance-deer-flow-skills-public-data-analysis-skill-md', 'data-analysis', 'bytedance', 'Use this skill when the user uploads Excel (.xlsx/.xls) or CSV files and wants to perform data analysis, generate statistics, create summaries, pivot tables, SQL queries, or any form of structured data exploration. Supports multi-sheet Excel workbooks, aggregation, filtering, joins, and exporting results to CSV/JSON/Markdown.', 'skillsmp', 'https://skillsmp.com/skill/bytedance-deer-flow-skills-public-data-analysis-skill-md', 'skill://skillsmp/bytedance-deer-flow-skills-public-data-analysis-skill-md@latest', 'rest-api', 31279, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:shareai-lab-learn-claude-code-skills-agent-builder-skill-md', 'agent-builder', 'shareAI-lab', 'Design and build AI agents for any domain. Use when users:\n(1) ask to \"create an agent\", \"build an assistant\", or \"design an AI system\"\n(2) want to understand agent architecture, agentic patterns, or autonomous AI\n(3) need help with capabilities, subagents, planning, or skill mechanisms\n(4) ask about Claude Code, Cursor, or similar agent internals\n(5) want to build agents for business, research, creative, or operational tasks\nKeywords: agent, assistant, autonomous, workflow, tool use, multi-step, orchestration', 'skillsmp', 'https://skillsmp.com/skill/shareai-lab-learn-claude-code-skills-agent-builder-skill-md', 'skill://skillsmp/shareai-lab-learn-claude-code-skills-agent-builder-skill-md@latest', 'rest-api', 29685, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:chromedevtools-chrome-devtools-mcp-skills-chrome-devtools-skill-md', 'chrome-devtools', 'ChromeDevTools', 'Uses Chrome DevTools via MCP for efficient debugging, troubleshooting and browser automation. Use when debugging web pages, automating browser interactions, analyzing performance, or inspecting network requests. This skill does not apply to `--slim` mode (MCP configuration).', 'skillsmp', 'https://skillsmp.com/skill/chromedevtools-chrome-devtools-mcp-skills-chrome-devtools-skill-md', 'skill://skillsmp/chromedevtools-chrome-devtools-mcp-skills-chrome-devtools-skill-md@latest', 'rest-api', 29583, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:chromedevtools-chrome-devtools-mcp-skills-chrome-devtools-cli-skill-md', 'chrome-devtools-cli', 'ChromeDevTools', 'Use this to skill to write shell scripts or run shell commands to automate tasks in the browser or otherwise use Chrome DevTools via CLI.', 'skillsmp', 'https://skillsmp.com/skill/chromedevtools-chrome-devtools-mcp-skills-chrome-devtools-cli-skill-md', 'skill://skillsmp/chromedevtools-chrome-devtools-mcp-skills-chrome-devtools-cli-skill-md@latest', 'rest-api', 29583, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:chromedevtools-chrome-devtools-mcp-skills-debug-optimize-lcp-skill-md', 'debug-optimize-lcp', 'ChromeDevTools', 'Guides debugging and optimizing Largest Contentful Paint (LCP) using Chrome DevTools MCP tools. Use this skill whenever the user asks about LCP performance, slow page loads, Core Web Vitals optimization, or wants to understand why their page\'s main content takes too long to appear. Also use when the user mentions \"largest contentful paint\", \"page load speed\", \"CWV\", or wants to improve how fast their hero image or main content renders.', 'skillsmp', 'https://skillsmp.com/skill/chromedevtools-chrome-devtools-mcp-skills-debug-optimize-lcp-skill-md', 'skill://skillsmp/chromedevtools-chrome-devtools-mcp-skills-debug-optimize-lcp-skill-md@latest', 'rest-api', 29583, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:chromedevtools-chrome-devtools-mcp-skills-troubleshooting-skill-md', 'troubleshooting', 'ChromeDevTools', 'Uses Chrome DevTools MCP and documentation to troubleshoot connection and target issues. Trigger this skill when list_pages, new_page, or navigate_page fail, or when the server initialization fails.', 'skillsmp', 'https://skillsmp.com/skill/chromedevtools-chrome-devtools-mcp-skills-troubleshooting-skill-md', 'skill://skillsmp/chromedevtools-chrome-devtools-mcp-skills-troubleshooting-skill-md@latest', 'rest-api', 29583, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:zeroclaw-labs-zeroclaw-claude-skills-zeroclaw-skill-md', 'zeroclaw', 'zeroclaw-labs', 'Help users operate and interact with their ZeroClaw agent instance — through both the CLI (`zeroclaw` commands) and the REST/WebSocket gateway API. Use this skill whenever the user wants to: send messages to ZeroClaw, manage memory or cron jobs, check system status, configure channels or providers, hit the gateway API, troubleshoot their ZeroClaw setup, build from source, or do anything involving the `zeroclaw` binary or its HTTP endpoints. Trigger this even if the user just says things like \'check my agent status\', \'schedule a reminder\', \'store this in memory\', \'list my cron jobs\', \'send a message to my bot\', \'set up Telegram\', \'build zeroclaw\', or \'my bot is broken\' — these are all ZeroClaw operations.', 'skillsmp', 'https://skillsmp.com/skill/zeroclaw-labs-zeroclaw-claude-skills-zeroclaw-skill-md', 'skill://skillsmp/zeroclaw-labs-zeroclaw-claude-skills-zeroclaw-skill-md@latest', 'rest-api', 27531, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:labring-fastgpt-claude-skills-system-test-skill-md', 'test-skill', 'labring', '当用户需要编写一个单元测试时，触发该 skill，编写单元测试。', 'skillsmp', 'https://skillsmp.com/skill/labring-fastgpt-claude-skills-system-test-skill-md', 'skill://skillsmp/labring-fastgpt-claude-skills-system-test-skill-md@latest', 'rest-api', 27402, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:labring-fastgpt-claude-skills-design-skill-md', 'fastgpt-design-skill', 'labring', '当用户需要设计 FastGPT 的代码时，可调用此 Skill。', 'skillsmp', 'https://skillsmp.com/skill/labring-fastgpt-claude-skills-design-skill-md', 'skill://skillsmp/labring-fastgpt-claude-skills-design-skill-md@latest', 'rest-api', 27402, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:labring-fastgpt-claude-skills-system-pr-review-skill-md', 'pr-review', 'labring', '当用户传入一个 review 的 pr 链接时候，触发该 skill，对 pr 进行代码审查。', 'skillsmp', 'https://skillsmp.com/skill/labring-fastgpt-claude-skills-system-pr-review-skill-md', 'skill://skillsmp/labring-fastgpt-claude-skills-system-pr-review-skill-md@latest', 'rest-api', 27402, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:labring-fastgpt-claude-skills-doc-i18n-skill-md', 'doc-i18n', 'labring', '将 FastGPT 文档从中文翻译为面向北美用户的英文。当用户提到翻译文档、i18n、国际化、translate docs、新增/修改了中文文档需要同步英文版时，使用此 skill。也适用于用户要求检查文档翻译缺失、批量翻译、或对比中英文文档差异的场景。', 'skillsmp', 'https://skillsmp.com/skill/labring-fastgpt-claude-skills-doc-i18n-skill-md', 'skill://skillsmp/labring-fastgpt-claude-skills-doc-i18n-skill-md@latest', 'rest-api', 27402, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:paperclipai-paperclip-claude-skills-design-guide-skill-md', 'design-guide', 'paperclipai', 'Paperclip UI design system guide for building consistent, reusable frontend components. Use when creating new UI components, modifying existing ones, adding pages or features to the frontend, styling UI elements, or when you need to understand the design language and conventions. Covers: component creation, design tokens, typography, status/priority systems, composition patterns, and the /design-guide showcase page. Always use this skill alongside the frontend-design skill (for visual quality) and the web-design-guidelines skill (for web best practices).', 'skillsmp', 'https://skillsmp.com/skill/paperclipai-paperclip-claude-skills-design-guide-skill-md', 'skill://skillsmp/paperclipai-paperclip-claude-skills-design-guide-skill-md@latest', 'rest-api', 27235, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:paperclipai-paperclip-skills-para-memory-files-skill-md', 'para-memory-files', 'paperclipai', 'File-based memory system using Tiago Forte\'s PARA method. Use this skill whenever you need to store, retrieve, update, or organize knowledge across sessions. Covers three memory layers: (1) Knowledge graph in PARA folders with atomic YAML facts, (2) Daily notes as raw timeline, (3) Tacit knowledge about user patterns. Also handles planning files, memory decay, weekly synthesis, and recall via qmd. Trigger on any memory operation: saving facts, writing daily notes, creating entities, running weekly synthesis, recalling past context, or managing plans.', 'skillsmp', 'https://skillsmp.com/skill/paperclipai-paperclip-skills-para-memory-files-skill-md', 'skill://skillsmp/paperclipai-paperclip-skills-para-memory-files-skill-md@latest', 'rest-api', 27235, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:marmelab-react-admin-agents-skills-i18n-skill-md', 'react-admin-i18n', 'marmelab', 'Guidelines for internationalizing a react-admin or shadcn admin kit application. Use when adding i18n support, creating translation files, translating hardcoded English strings in JSX, or reviewing i18n PRs in a react-admin project. Covers namespace conventions, interpolation, pluralization, locale-aware formatting, and the full workflow for converting an English-only app to multi-language. Trigger this skill whenever the user mentions i18n, internationalization, translation, localization, locale switching, or multi-language in a react-admin or shadcn admin kit context — even if they just say \"translate this component\" or \"add French support\".', 'skillsmp', 'https://skillsmp.com/skill/marmelab-react-admin-agents-skills-i18n-skill-md', 'skill://skillsmp/marmelab-react-admin-agents-skills-i18n-skill-md@latest', 'rest-api', 26599, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:marmelab-react-admin-agents-skills-react-admin-skill-md', 'react-admin', 'marmelab', 'This skill should be used when building, modifying, or debugging a react-admin application — including creating resources, lists, forms, data fetching, authentication, relationships between entities, custom pages, or any CRUD admin interface built with react-admin.', 'skillsmp', 'https://skillsmp.com/skill/marmelab-react-admin-agents-skills-react-admin-skill-md', 'skill://skillsmp/marmelab-react-admin-agents-skills-react-admin-skill-md@latest', 'rest-api', 26599, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:srbhr-resume-matcher-github-skills-navigator-skill-md', 'navigator', 'srbhr', 'Quick codebase orientation for Resume Matcher. Points to key directories, architecture docs, and available skills. Use as a starting point before diving into code. For advanced search, use the codebase-navigator skill.', 'skillsmp', 'https://skillsmp.com/skill/srbhr-resume-matcher-github-skills-navigator-skill-md', 'skill://skillsmp/srbhr-resume-matcher-github-skills-navigator-skill-md@latest', 'rest-api', 26325, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:srbhr-resume-matcher-claude-skills-navigator-skill-md', 'navigator', 'srbhr', 'Codebase orientation. Use FIRST when exploring code, finding files, or understanding project structure. For advanced search, see the codebase-navigator skill.', 'skillsmp', 'https://skillsmp.com/skill/srbhr-resume-matcher-claude-skills-navigator-skill-md', 'skill://skillsmp/srbhr-resume-matcher-claude-skills-navigator-skill-md@latest', 'rest-api', 26325, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:srbhr-resume-matcher-github-skills-backend-dev-skill-md', 'backend-dev', 'srbhr', 'Backend development skill for Resume Matcher. Handles FastAPI endpoints, Pydantic schemas, TinyDB operations, LiteLLM integration, and Python service logic. Use when creating or modifying backend code.', 'skillsmp', 'https://skillsmp.com/skill/srbhr-resume-matcher-github-skills-backend-dev-skill-md', 'skill://skillsmp/srbhr-resume-matcher-github-skills-backend-dev-skill-md@latest', 'rest-api', 26325, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:srbhr-resume-matcher-github-skills-frontend-dev-skill-md', 'frontend-dev', 'srbhr', 'Frontend development skill for Resume Matcher. Handles Next.js pages, React components, Tailwind CSS with Swiss International Style, API integration, hooks, and i18n. Use when creating or modifying frontend code.', 'skillsmp', 'https://skillsmp.com/skill/srbhr-resume-matcher-github-skills-frontend-dev-skill-md', 'skill://skillsmp/srbhr-resume-matcher-github-skills-frontend-dev-skill-md@latest', 'rest-api', 26325, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:srbhr-resume-matcher-github-skills-full-stack-skill-md', 'full-stack', 'srbhr', 'Full-stack development skill that coordinates backend and frontend changes together. Use for features that span both layers: new API endpoint + UI, data model changes, end-to-end flows.', 'skillsmp', 'https://skillsmp.com/skill/srbhr-resume-matcher-github-skills-full-stack-skill-md', 'skill://skillsmp/srbhr-resume-matcher-github-skills-full-stack-skill-md@latest', 'rest-api', 26325, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:assafelovic-gpt-researcher-claude-skill-md', 'gpt-researcher', 'assafelovic', 'GPT Researcher is an autonomous deep research agent that conducts web and local research, producing detailed reports with citations. Use this skill when helping developers understand, extend, debug, or integrate with GPT Researcher - including adding features, understanding the architecture, working with the API, customizing research workflows, adding new retrievers, integrating MCP data sources, or troubleshooting research pipelines.', 'skillsmp', 'https://skillsmp.com/skill/assafelovic-gpt-researcher-claude-skill-md', 'skill://skillsmp/assafelovic-gpt-researcher-claude-skill-md@latest', 'rest-api', 25781, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:github-awesome-copilot-skills-make-skill-template-skill-md', 'make-skill-template', 'github', 'Create new Agent Skills for GitHub Copilot from prompts or by duplicating this template. Use when asked to \"create a skill\", \"make a new skill\", \"scaffold a skill\", or when building specialized AI capabilities with bundled resources. Generates SKILL.md files with proper frontmatter, directory structure, and optional scripts/references/assets folders.', 'skillsmp', 'https://skillsmp.com/skill/github-awesome-copilot-skills-make-skill-template-skill-md', 'skill://skillsmp/github-awesome-copilot-skills-make-skill-template-skill-md@latest', 'rest-api', 25460, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:github-awesome-copilot-skills-suggest-awesome-github-copilot-skills-skill-md', 'suggest-awesome-github-copilot-skills', 'github', 'Suggest relevant GitHub Copilot skills from the awesome-copilot repository based on current repository context and chat history, avoiding duplicates with existing skills in this repository, and identifying outdated skills that need updates.', 'skillsmp', 'https://skillsmp.com/skill/github-awesome-copilot-skills-suggest-awesome-github-copilot-skills-skill-md', 'skill://skillsmp/github-awesome-copilot-skills-suggest-awesome-github-copilot-skills-skill-md@latest', 'rest-api', 25460, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:github-awesome-copilot-skills-microsoft-skill-creator-skill-md', 'microsoft-skill-creator', 'github', 'Create agent skills for Microsoft technologies using Learn MCP tools. Use when users want to create a skill that teaches agents about any Microsoft technology, library, framework, or service (Azure, .NET, M365, VS Code, Bicep, etc.). Investigates topics deeply, then generates a hybrid skill storing essential knowledge locally while enabling dynamic deeper investigation.', 'skillsmp', 'https://skillsmp.com/skill/github-awesome-copilot-skills-microsoft-skill-creator-skill-md', 'skill://skillsmp/github-awesome-copilot-skills-microsoft-skill-creator-skill-md@latest', 'rest-api', 25460, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:github-awesome-copilot-skills-copilot-cli-quickstart-skill-md', 'copilot-cli-quickstart', 'github', 'Use this skill when someone wants to learn GitHub Copilot CLI from scratch. Offers interactive step-by-step tutorials with separate Developer and Non-Developer tracks, plus on-demand Q&A. Just say \"start tutorial\" or ask a question! Note: This skill targets GitHub Copilot CLI specifically and uses CLI-specific tools (ask_user, sql, fetch_copilot_cli_documentation).', 'skillsmp', 'https://skillsmp.com/skill/github-awesome-copilot-skills-copilot-cli-quickstart-skill-md', 'skill://skillsmp/github-awesome-copilot-skills-copilot-cli-quickstart-skill-md@latest', 'rest-api', 25460, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:github-awesome-copilot-skills-fabric-lakehouse-skill-md', 'fabric-lakehouse', 'github', 'Use this skill to get context about Fabric Lakehouse and its features for software systems and AI-powered functions. It offers descriptions of Lakehouse data components, organization with schemas and shortcuts, access control, and code examples. This skill supports users in designing, building, and optimizing Lakehouse solutions using best practices.', 'skillsmp', 'https://skillsmp.com/skill/github-awesome-copilot-skills-fabric-lakehouse-skill-md', 'skill://skillsmp/github-awesome-copilot-skills-fabric-lakehouse-skill-md@latest', 'rest-api', 25460, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:github-awesome-copilot-skills-scoutqa-test-skill-md', 'scoutqa-test', 'github', 'This skill should be used when the user asks to \"test this website\", \"run exploratory testing\", \"check for accessibility issues\", \"verify the login flow works\", \"find bugs on this page\", or requests automated QA testing. Triggers on web application testing scenarios including smoke tests, accessibility audits, e-commerce flows, and user flow validation using ScoutQA CLI. Use this skill proactively after implementing web application features to verify they work correctly.', 'skillsmp', 'https://skillsmp.com/skill/github-awesome-copilot-skills-scoutqa-test-skill-md', 'skill://skillsmp/github-awesome-copilot-skills-scoutqa-test-skill-md@latest', 'rest-api', 25460, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:github-awesome-copilot-skills-azure-deployment-preflight-skill-md', 'azure-deployment-preflight', 'github', 'Performs comprehensive preflight validation of Bicep deployments to Azure, including template syntax validation, what-if analysis, and permission checks. Use this skill before any deployment to Azure to preview changes, identify potential issues, and ensure the deployment will succeed. Activate when users mention deploying to Azure, validating Bicep files, checking deployment permissions, previewing infrastructure changes, running what-if, or preparing for azd provision.', 'skillsmp', 'https://skillsmp.com/skill/github-awesome-copilot-skills-azure-deployment-preflight-skill-md', 'skill://skillsmp/github-awesome-copilot-skills-azure-deployment-preflight-skill-md@latest', 'rest-api', 25460, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
INSERT INTO `skills`
    (skill_id, name, author, description, source_type, source_url, install_uri, execution_mode, stars, downloads, required_envs, agent_tools_schema, remote_updated_at)
VALUES
    ('skillsmp:github-awesome-copilot-skills-aspire-skill-md', 'aspire', 'github', 'Aspire skill covering the Aspire CLI, AppHost orchestration, service discovery, integrations, MCP server, VS Code extension, Dev Containers, GitHub Codespaces, templates, dashboard, and deployment. Use when the user asks to create, run, debug, configure, deploy, or troubleshoot an Aspire distributed application.', 'skillsmp', 'https://skillsmp.com/skill/github-awesome-copilot-skills-aspire-skill-md', 'skill://skillsmp/github-awesome-copilot-skills-aspire-skill-md@latest', 'rest-api', 25460, 0, '[]', '[]', 0)
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
    last_updated = CURRENT_TIMESTAMP;
