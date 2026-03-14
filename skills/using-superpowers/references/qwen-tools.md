# Qwen CLI Tool Mapping

Skills use generic tool names. When you encounter these in a skill, use your Qwen CLI equivalent:

| Skill references | Qwen CLI equivalent |
|-----------------|----------------------|
| `Read` (file reading) | `read_file` |
| `Write` (file creation) | `write_file` |
| `Edit` (file editing) | `replace` |
| `Bash` (run commands) | `run_shell_command` |
| `Grep` (search file content) | `grep_search` |
| `Glob` (search files by name) | `glob` |
| `TodoWrite` (task tracking) | `todo_write` |
| `Skill` tool (invoke a skill) | `activate_skill` |
| `WebSearch` | `web_search` |
| `WebFetch` | `web_fetch` |
| `Task` tool (dispatch subagent) | `task` |

## Additional Qwen CLI tools

These tools are available in Qwen CLI but may not be referenced in skills:

| Tool | Purpose |
|------|---------|
| `list_directory` | List files and subdirectories |
| `save_memory` | Persist facts to QWEN.md across sessions |
| `ask_user_question` | Request structured input from the user |
