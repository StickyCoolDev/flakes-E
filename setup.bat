@echo off

set "GIT_HOOKS_DIR=.git\hooks"
set "PRE_COMMIT_HOOK_PATH=%GIT_HOOKS_DIR%\pre-commit"

echo Setting up djlint pre-commit git hook...

if not exist ".git" (
  echo Error: Not a git repository. Please run this script from the root of your git project.
  exit /b 1
)

echo @echo off > "%PRE_COMMIT_HOOK_PATH%"
echo echo Running djlint formatting >> "%PRE_COMMIT_HOOK_PATH%"
echo uv run djlint --reformat . >> "%PRE_COMMIT_HOOK_PATH%"
echo git add . >> "%PRE_COMMIT_HOOK_PATH%"

uv sync

echo setup djlint formatting hook and uv sync

