#!/usr/bin/env bash
#
# Activate this repo's tracked hooks. Run once after cloning:
#   bash hooks/install.sh
#
# Git hooks in .git/hooks are NOT version-controlled, so we point git at the
# tracked hooks/ directory instead. Re-run safely; it's idempotent.
#
set -euo pipefail
cd "$(dirname "$0")/.."
chmod +x hooks/pre-push
git config core.hooksPath hooks
echo "core.hooksPath -> $(git config --get core.hooksPath)"
echo "pre-push secret scan active. Bypass a false positive with: git push --no-verify"
