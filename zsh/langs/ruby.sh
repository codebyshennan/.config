#!/bin/zsh
# =============================================================================
# Ruby Configuration
# =============================================================================

# Homebrew Ruby (takes precedence over system Ruby)
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# RVM - lazy loaded
[[ -s "$HOME/.rvm/scripts/rvm" ]] && lazy_load "rvm ruby gem" 'source "$HOME/.rvm/scripts/rvm"'
export PATH="$PATH:$HOME/.rvm/bin"
