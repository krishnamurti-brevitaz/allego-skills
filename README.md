# Allego Custom Skills

A unified repository for AI skills used in the Allego project. Supports both **Gemini CLI** and **Claude Code**.

## 🚀 Quick Start

### 1. Clone the Repo
```bash
git clone https://github.com/krishnamurti-brevitaz/allego-skills.git
```

### 2. Run the Installer
```bash
cd allego-skills
chmod +x install.sh
./install.sh
```

## 🤖 Platform Support

### Claude Code (Team's Primary Choice)
The installer provides two options for Claude Code:
1.  **Global**: Installs to `~/.claude/skills/`. Use this if you want the skills available across all your projects.
2.  **Specific Project**: Installs to `./.claude/skills/` within a project of your choice and automatically updates its `CLAUDE.md`.

**💡 How to make Claude "see" the skill:**
- If using the **Project** installation, the `CLAUDE.md` update tells Claude where to look.
- If Claude still doesn't recognize it, try asking: *"Check the custom skills available in .claude/skills/"* or *"Use the feature-context-generator skill to analyze X."*
- For best results, ensure you have the `using-superpowers` skill active in your environment, as it handles skill discovery automatically.

### Gemini CLI
- Installs to `~/.gemini/skills/` for global availability.
- **Usage**: Use the `activate_skill` tool.

## 📂 Included Skills
- **feature-context-generator**: Functional documentation engine.
