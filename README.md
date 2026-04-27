# Allego Custom Skills

A unified repository for AI skills used in the Allego project. Supports both **Gemini CLI** and **Claude Code**.

## 🚀 Quick Start

### 1. Clone the Repo
```bash
git clone <your-repo-url> allego-skills
```

### 2. Run the Installer
```bash
cd allego-skills
chmod +x install.sh
./install.sh
```

## 🤖 Platform Support

### Claude Code (Recommended)
When you choose **Option 2 (Claude Code)** in the installer:
- It creates a `.claude/skills/` directory in your current project.
- It symlinks the selected skills there.
- It automatically updates your project's `CLAUDE.md` so Claude knows the skills exist.
- **Usage**: Just ask Claude: *"Generate feature context for X using the skill in .claude/skills"*

### Gemini CLI
When you choose **Option 1 (Gemini CLI)**:
- It links skills to `~/.gemini/skills/` for global availability.
- **Usage**: Use the `activate_skill` tool as usual.

## 📂 Included Skills
- **feature-context-generator**: Functional documentation engine.
