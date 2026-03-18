# Superpowers Installation for iFlow CLI

This guide will help you install Superpowers in iFlow CLI. 

## Prerequisites

- iFlow CLI installed and running
- Git installed

## Quick Install

```bash
# Clone the repository
git clone https://github.com/Drakaniia/superpowers.git /path/to/superpowers
cd /path/to/superpowers

# Run the installation script
powershell -ExecutionPolicy Bypass -File .\.iflow\install.ps1
```

## Manual Installation

### 1. Locate your iFlow directories

Your iFlow CLI should have the following directories:
- `skills/` - where skill files go
- `agents/` - where agent files go  
- `commands/` - where command files go
- `hooks/` - where hook files go

### 2. Copy Skills

**IMPORTANT**: iFlow CLI requires skills to be at the root level of the skills directory. Each skill must have its own `SKILL.md` file.

Copy each skill from the Superpowers repository:

```powershell
# Example on Windows
Copy-Item -Path "C:\path\to\superpowers\skills\brainstorming" -Destination "C:\path\to\iflow\skills\brainstorming" -Recurse
Copy-Item -Path "C:\path\to\superpowers\skills\test-driven-development" -Destination "C:\path\to\iflow\skills\test-driven-development" -Recurse
Copy-Item -Path "C:\path\to\superpowers\skills\systematic-debugging" -Destination "C:\path\to\iflow\skills\systematic-debugging" -Recurse
# ... repeat for all skills
```

**All available skills:**
- brainstorming
- canvas-design
- design-md
- dispatching-parallel-agents
- enhance-prompt
- executing-plans
- finishing-a-development-branch
- receiving-code-review
- requesting-code-review
- stitch-loop
- subagent-driven-development
- systematic-debugging
- test-driven-development
- using-git-worktrees
- using-superpowers
- verification-before-completion
- writing-skills

### 3. Copy Agents

```powershell
Copy-Item -Path "C:\path\to\superpowers\agents\*" -Destination "C:\path\to\iflow\agents\" -Recurse
```

### 4. Copy Commands

```powershell
Copy-Item -Path "C:\path\to\superpowers\commands\*" -Destination "C:\path\to\iflow\commands\" -Recurse
```

### 5. Copy Hooks (Optional)

```powershell
# Copy hooks configuration
Copy-Item -Path "C:\path\to\superpowers\hooks\hooks.json" -Destination "C:\path\to\iflow\hooks\"

# Copy session-start hook
Copy-Item -Path "C:\path\to\superpowers\hooks\session-start" -Destination "C:\path\to\iflow\hooks\"
```

## Verify Installation

Start a new iFlow CLI session and try:

```
Help me plan a new feature for my application
```

The agent should automatically invoke the relevant Superpowers skill.

## Updating

```bash
cd /path/to/superpowers
git pull
# Re-run the installation steps to update your iFlow directories
```

## Troubleshooting

### Skills not being detected

- **Issue**: Skills are not being automatically discovered
- **Solution**: Ensure each skill has its own directory with a `SKILL.md` file at the root level (e.g., `skills/brainstorming/SKILL.md`)

### Agents not loading

- **Issue**: Agent definitions not found
- **Solution**: Check that agent files are copied to the correct `agents/` directory

### Hooks not executing

- **Issue**: Session-start hook not running
- **Solution**: Verify the `session-start` file is in your `hooks/` directory and has execute permissions

## Directory Structure Reference

Your iFlow installation should look like this:

```
iflow/
├── skills/
│   ├── brainstorming/
│   │   └── SKILL.md
│   ├── test-driven-development/
│   │   └── SKILL.md
│   ├── systematic-debugging/
│   │   └── SKILL.md
│   └── ... (other skills)
├── agents/
│   ├── code-reviewer.md
│   └── ... (other agents)
├── commands/
│   ├── brainstorm.md
│   ├── execute-plan.md
│   └── ... (other commands)
└── hooks/
    ├── hooks.json
    └── session-start
```

## Support

- **GitHub Issues**: https://github.com/obra/superpowers/issues
- **Documentation**: See IFLOW.md in the Superpowers repository