#!/bin/bash

# Allego Skills Installer
# Supports Gemini CLI (Global) and Claude Code (Global/Project-based)

SKILLS_DIR_GEMINI="$HOME/.gemini/skills"
SKILLS_DIR_CLAUDE_GLOBAL="$HOME/.claude/skills"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "------------------------------------------"
echo "   Allego Custom Skills Installer"
echo "------------------------------------------"

echo "Where would you like to install?"
echo "1) Gemini CLI (Global: $SKILLS_DIR_GEMINI)"
echo "2) Claude Code (Global: $SKILLS_DIR_CLAUDE_GLOBAL)"
echo "3) Claude Code (Specific Project)"
read -p "Select [1-3]: " mode_choice

case $mode_choice in
    1)
        TARGET_DIR="$SKILLS_DIR_GEMINI"
        ;;
    2)
        TARGET_DIR="$SKILLS_DIR_CLAUDE_GLOBAL"
        ;;
    3)
        read -p "Enter project root path [default: ..]: " project_path
        project_path=${project_path:-".."}
        # Resolve to absolute path
        TARGET_DIR="$(cd "$project_path" && pwd)/.claude/skills"
        PROJECT_ROOT="$(cd "$project_path" && pwd)"
        ;;
    *)
        echo "Invalid selection."
        exit 1
        ;;
esac

mkdir -p "$TARGET_DIR"

# Get list of skills
available_skills=()
for d in "$REPO_DIR"/*/; do
    if [ -f "${d}SKILL.md" ]; then
        skill_name=$(basename "$d")
        available_skills+=("$skill_name")
    fi
done

install_skill() {
    local skill=$1
    echo "Installing: $skill..."
    ln -sfn "$REPO_DIR/$skill" "$TARGET_DIR/$skill"
    
    # Claude Project-specific: Add reference to CLAUDE.md for visibility
    if [ "$mode_choice" == "3" ] && [ -n "$PROJECT_ROOT" ]; then
        local claude_md="$PROJECT_ROOT/CLAUDE.md"
        if [ -f "$claude_md" ]; then
            if ! grep -q "$skill" "$claude_md"; then
                echo -e "\n## Custom Skills\n- $skill: ./.claude/skills/$skill/SKILL.md" >> "$claude_md"
                echo "📝 Added reference to $(basename "$PROJECT_ROOT")/CLAUDE.md"
            fi
        fi
    fi
    echo "✅ Linked $skill to $TARGET_DIR/$skill"
}

echo "Available skills:"
for i in "${!available_skills[@]}"; do
    echo "$((i+1))) ${available_skills[$i]}"
done
echo "A) All skills"
echo "Q) Quit"

read -p "Choice: " choice

case $choice in
    [Qq]) exit 0 ;;
    [Aa])
        for skill in "${available_skills[@]}"; do install_skill "$skill"; done
        ;;
    *)
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -le "${#available_skills[@]}" ] && [ "$choice" -gt 0 ]; then
            install_skill "${available_skills[$((choice-1))]}"
        else
            echo "Invalid selection."
        fi
        ;;
esac

echo "------------------------------------------"
echo "Installation complete!"
if [ "$mode_choice" == "1" ]; then
    echo "Gemini CLI will find these in $SKILLS_DIR_GEMINI"
elif [ "$mode_choice" == "2" ]; then
    echo "Claude Code will find these globally in $SKILLS_DIR_CLAUDE_GLOBAL"
else
    echo "Claude Code will find these in your project's .claude/skills/ folder."
fi
