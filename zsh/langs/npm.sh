#!/bin/zsh
# =============================================================================
# Node.js Configuration
# =============================================================================
# Using fnm (Fast Node Manager) - 40x faster than nvm

# fnm PATH
export PATH="$HOME/Library/Application Support/fnm:$PATH"

# Lazy load fnm - only initialize when node/npm/npx/fnm is called
lazy_load "node npm npx pnpm yarn fnm" 'eval "$(fnm env --use-on-cd)"'

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Bun (lazy completion)
[[ -s "$HOME/.bun/_bun" ]] && lazy_load "bun bunx" 'source "$HOME/.bun/_bun"'
