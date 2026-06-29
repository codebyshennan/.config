#!/bin/zsh
# =============================================================================
# Node.js Configuration
# =============================================================================
# Using fnm (Fast Node Manager) - 40x faster than nvm

# fnm PATH + eager init (fnm is a fast Rust binary, lazy-load not worth it)
export PATH="$HOME/Library/Application Support/fnm:$PATH"
eval "$(fnm env --use-on-cd)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Bun
export PATH="$HOME/.bun/bin:$PATH"
[[ -s "$HOME/.bun/_bun" ]] && lazy_load "bun bunx" 'source "$HOME/.bun/_bun"'  # lazy completion
