#!/bin/bash

# Allego Skills Installer
# Symlinks skills from this repo to ~/.gemini/skills/

SKILLS_DIR="$HOME/.gemini/skills"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure global skills directory exists
mkdir -p "$SKILLS_DIR"

echo "------------------------------------------"
echo "   Allego Custom Skills Installer"
echo "------------------------------------------"

# Get list of skills (directories containing SKILL.md)
available_skills=()
for d in */; do
    if [ -f "${d}SKILL.md" ]; then
        available_skills+=("${d%/}")
    fi
done

if [ ${#available_skills[@]} -eq 0 ]; then
    echo "No skills found in this repository."
    exit 1
fi

install_skill() {
    local skill=$1
    echo "Installing: $skill..."
    ln -sfn "$REPO_DIR/$skill" "$SKILLS_DIR/$skill"
    echo "✅ Linked $skill to $SKILLS_DIR/$skill"
}

echo "Available skills:"
for i in "${!available_skills[@]}"; do
    echo "$((i+1))) ${available_skills[$i]}"
done
echo "A) All skills"
echo "Q) Quit"

read -p "Select a skill number to install, 'A' for all, or 'Q' to quit: " choice

case $choice in
    [Qq])
        echo "Exiting."
        exit 0
        ;;
    [Aa])
        for skill in "${available_skills[@]}"; do
            install_skill "$skill"
        done
        ;;
    *)
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -le "${#available_skills[@]}" ] && [ "$choice" -gt 0 ]; then
            install_skill "${available_skills[$((choice-1))]}"
        else
            echo "Invalid selection."
            exit 1
        fi
        ;;
esac

echo "------------------------------------------"
echo "Installation complete!"
echo "Restart your Gemini CLI session to see updates."
