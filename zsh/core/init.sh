#!/bin/zsh
# =============================================================================
# Core ZSH Initialization
# =============================================================================

# Oh-My-Zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
HIST_STAMPS="mm/dd/yyyy"

# Minimal plugins - heavy completions are lazy-loaded
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    git-open
)

# Defer oh-my-zsh loading slightly but keep it synchronous for prompt
source $ZSH/oh-my-zsh.sh

# Terminal-Specific Prompt
if [[ $TERM_PROGRAM == "WarpTerminal" ]]; then
    eval "$(starship init zsh)"
else
    [[ -e "${HOME}/.iterm2_shell_integration.zsh" ]] && source "${HOME}/.iterm2_shell_integration.zsh"
fi
