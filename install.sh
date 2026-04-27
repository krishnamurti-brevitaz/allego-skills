#!/bin/bash

# Allego Skills Installer
# Supports Gemini CLI (Global) and Claude Code (Project-based)

SKILLS_DIR_GEMINI="$HOME/.gemini/skills"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "------------------------------------------"
echo "   Allego Custom Skills Installer"
echo "------------------------------------------"

# Detect Mode
echo "Where would you like to install?"
echo "1) Gemini CLI (Global: $SKILLS_DIR_GEMINI)"
echo "2) Claude Code (Current Project: ./.claude/skills)"
read -p "Select [1-2]: " mode_choice

if [ "$mode_choice" == "1" ]; then
    TARGET_DIR="$SKILLS_DIR_GEMINI"
else
    TARGET_DIR="$(pwd)/.claude/skills"
fi

mkdir -p "$TARGET_DIR"

# Get list of skills
available_skills=()
for d in */; do
    if [ -f "${d}SKILL.md" ]; then
        available_skills+=("${d%/}")
    fi
done

install_skill() {
    local skill=$1
    echo "Installing: $skill..."
    ln -sfn "$REPO_DIR/$skill" "$TARGET_DIR/$skill"
    
    # Claude-specific: Add reference to CLAUDE.md for visibility
    if [ "$mode_choice" == "2" ]; then
        if [ -f "CLAUDE.md" ]; then
            if ! grep -q "$skill" CLAUDE.md; then
                echo -e "\n## Custom Skills\n- $skill: ./.claude/skills/$skill/SKILL.md" >> CLAUDE.md
                echo "📝 Added reference to CLAUDE.md"
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
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -le "${#available_skills[@]}" ]; then
            install_skill "${available_skills[$((choice-1))]}"
        fi
        ;;
esac

echo "------------------------------------------"
echo "Installation complete!"
if [ "$mode_choice" == "2" ]; then
    echo "Claude Code will now find these skills in ./.claude/skills/"
fi
