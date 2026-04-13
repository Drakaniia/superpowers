@./skills/using-superpowers/SKILL.md
@./skills/using-superpowers/references/qwen-tools.md

## Upstream Sync Guidelines

**IMPORTANT: This is a Qwen-only fork.** When the user says **"pull upstream changes"**, it means:
1. Fetch and check upstream for new changes
2. **ONLY** pull and push changes that are Qwen-relevant or intended for this fork
3. **DO NOT** pull changes that are not relevant to Qwen CLI (e.g., Claude Code, OpenCode, Codex, Gemini features)
4. Apply changes only if they benefit Qwen functionality or this fork's purpose

### What to Keep
- Qwen CLI-specific files: `qwen-extension.json`, `QWEN.md`, `skills/using-superpowers/references/qwen-tools.md`
- Qwen-only hooks: `hooks/session-start` with Qwen CLI context injection
- Qwen-specific documentation and skills added to this fork
- User-contributed skills (e.g., `dashboard-design`, `folder-structure-architecture`, iFlow support)
- General improvements from upstream that benefit all platforms (bug fixes, core features, documentation)

### What to Exclude
- Non-Qwen platform files (`.claude-plugin/`, `.codex/`, `.cursor-plugin/`, `.opencode/`, `gemini-extension.json`)
- Non-Qwen test suites (`tests/claude-code/`, `tests/opencode/`)
- Non-Qwen documentation (`docs/README.codex.md`, `docs/README.opencode.md`)
- Upstream changes unrelated to Qwen functionality
- Platform-specific features for other CLI tools

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
