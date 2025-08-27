#!/bin/bash

# Define the path to the git hooks directory
GIT_HOOKS_DIR=".git/hooks"
PRE_COMMIT_HOOK_PATH="$GIT_HOOKS_DIR/pre-commit"

echo "Setting up djlint pre-commit git hook..."

# Check if the .git directory exists
if [ ! -d ".git" ]; then
  echo "Error: Not a git repository. Please run this script from the root of your git project."
  exit 1
fi

cat << 'EOF' > "$PRE_COMMIT_HOOK_PATH"
#!/bin/bash

echo "Running djlint formatting"
uv run djlint --reformat .

EOF

# Make the pre-commit hook executable
chmod +x "$PRE_COMMIT_HOOK_PATH"
uv sync

echo "setup djlint formatting hook and uv sync"
