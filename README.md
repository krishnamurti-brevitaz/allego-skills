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

The installer offers three modes to ensure your AI agent can access these skills:

### 1. Gemini CLI (Global)
- **Target**: `~/.gemini/skills/`
- **Use Case**: Makes skills available globally for all Gemini CLI sessions.
- **Usage**: Use the `activate_skill` tool.

### 2. Claude Code (Global)
- **Target**: `~/.claude/skills/`
- **Use Case**: Makes skills available globally for Claude Code across all your repositories.
- **Usage**: Claude will automatically search this directory if instructed.

### 3. Claude Code (Specific Project)
- **Target**: `./.claude/skills/` (inside a project directory)
- **Use Case**: Best for project-specific isolation. The installer will also attempt to update the project's `CLAUDE.md` to register the skill.
- **Usage**: Ask Claude: *"Use the skill in .claude/skills/feature-context-generator to analyze X."*

## 💡 Troubleshooting Claude Discovery
If Claude doesn't recognize a skill immediately:
1. **Restart the session**: Claude often indexes instructions at startup.
2. **Be Explicit**: Prompt Claude with: *"Analyze the SKILL.md in .claude/skills/feature-context-generator and use it as a guide."*
3. **Superpowers**: For the best experience, ensure you have the `using-superpowers` skill active, as it handles cross-platform skill discovery.

## 📂 Included Skills
- **feature-context-generator**: Functional documentation engine for the Allego codebase.
