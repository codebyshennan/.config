#!/bin/zsh
# =============================================================================
# General ZSH Configuration
# =============================================================================

# Key Bindings
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# Directory Navigation Enhancement
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert always
alias z=cdr

# Safe rm: prompts for confirmation and moves to Trash instead of deleting
rm() {
  echo "\033[33m  $*\033[0m"
  read "REPLY?  Move to Trash? [y/N] "
  echo
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    trash "$@" && echo "\033[32m  Moved to Trash.\033[0m"
  else
    echo "\033[90m  Aborted.\033[0m"
  fi
}
