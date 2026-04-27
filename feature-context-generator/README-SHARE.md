# Feature Context Generator Skill

This skill allows Gemini CLI and Claude Code to generate deterministic, functional documentation (Feature Contexts) from your codebase.

## 🚀 Installation

### For Gemini CLI
Clone this repository into your local skills directory:
```bash
git clone <your-repo-url> ~/.gemini/skills/feature-context-generator
```

### For Claude Code
The most reliable way to use this in Claude Code is to add a reference in your project's `CLAUDE.md`:
1. Clone the repo anywhere on your machine.
2. In your project `CLAUDE.md`, add:
   ```markdown
   ## Custom Skills
   - Feature Context Generator: [Path to SKILL.md]
   ```
3. Alternatively, copy the `SKILL.md` content into a file named `.claude/skills/feature-context-generator.md`.

## 🛠 Usage
Once installed, simply ask your agent:
> "Generate the feature context for the [Feature Name] feature."

The agent will then:
1. Prompt you for the output format (Single File vs. Folder).
2. Analyze the relevant code and Jira context.
3. Produce structured functional documentation.
