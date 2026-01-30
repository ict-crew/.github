#!/bin/bash

# Install git hooks for branch name validation
# Run this script in your repository root

HOOK_SOURCE="hooks/pre-push"
HOOK_DEST=".git/hooks/pre-push"

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not a git repository"
    echo "Run this script from the repository root"
    exit 1
fi

# Check if hook source exists
if [ ! -f "$HOOK_SOURCE" ]; then
    echo "❌ Error: Hook file not found: $HOOK_SOURCE"
    echo "Make sure hooks/pre-push exists"
    exit 1
fi

# Install the hook
cp "$HOOK_SOURCE" "$HOOK_DEST"
chmod +x "$HOOK_DEST"

echo "✓ Git hook installed successfully!"
echo ""
echo "Branch name validation is now active."
echo "All pushes will validate branch names."
echo ""
echo "To uninstall: rm .git/hooks/pre-push"
