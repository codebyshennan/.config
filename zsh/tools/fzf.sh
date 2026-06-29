#!/bin/zsh
# =============================================================================
# fzf - Fuzzy Finder
# =============================================================================

FZF_PREFIX="/opt/homebrew/opt/fzf"

[[ -d "$FZF_PREFIX" ]] || return

# Shell integration (key bindings + completion)
source "$FZF_PREFIX/shell/key-bindings.zsh"
source "$FZF_PREFIX/shell/completion.zsh"
