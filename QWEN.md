@./skills/using-superpowers/SKILL.md
@./skills/using-superpowers/references/qwen-tools.md

## Upstream Sync Guidelines

When pulling and pushing from upstream (obra/superpowers), only include Qwen-related changes:

### What to Keep
- Qwen CLI-specific files: `qwen-extension.json`, `QWEN.md`, `skills/using-superpowers/references/qwen-tools.md`
- Qwen-only hooks: `hooks/session-start` with Qwen CLI context injection
- Qwen-specific documentation and skills added to this fork
- User-contributed skills (e.g., `dashboard-design`, `folder-structure-architecture`, iFlow support)

### What to Exclude
- Non-Qwen platform files (`.claude-plugin/`, `.codex/`, `.cursor-plugin/`, `.opencode/`, `gemini-extension.json`)
- Non-Qwen test suites (`tests/claude-code/`, `tests/opencode/`)
- Non-Qwen documentation (`docs/README.codex.md`, `docs/README.opencode.md`)
- Upstream changes unrelated to Qwen functionality

### Recommended Workflow
```bash
# Fetch upstream
git fetch upstream

# Rebase with conflict resolution
git pull --rebase upstream main

# During conflicts, remove non-Qwen platform files and accept upstream changes for shared files
# Then push to fork
git push origin main --force-with-lease
```
