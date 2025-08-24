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

# Create or overwrite the pre-commit hook file
cat << 'EOF' > "$PRE_COMMIT_HOOK_PATH"
#!/bin/bash

echo "Running djlint pre-commit hook..."

# Get a list of staged HTML, Django template, Jinja, or Twig files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACMR | grep -E '\.(html|htm|django|jinja|jinja2|twig)$')

if [ -z "$STAGED_FILES" ]; then
  echo "No staged files to check. Skipping djlint."
  exit 0
fi

# Run djlint on each staged file and fail if there are any issues
for FILE in $STAGED_FILES; do
  echo "Checking $FILE..."
  uv run djlint --check "$FILE"
  if [ $? -ne 0 ]; then
    echo "djlint failed for file: $FILE"
    echo "Fix the issues and try again. Commit aborted."
    exit 1
  fi
done

echo "djlint passed. All good!"
exit 0
EOF

# Make the pre-commit hook executable
chmod +x "$PRE_COMMIT_HOOK_PATH"

echo "✅ djlint pre-commit git hook has been successfully set up at $PRE_COMMIT_HOOK_PATH"
echo "It will now automatically run on staged .html, .htm, .django, .jinja, .jinja2, and .twig files before each commit."


