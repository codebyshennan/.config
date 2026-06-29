#!/bin/zsh
# =============================================================================
# Heroku CLI
# =============================================================================

# Heroku completion (lazy)
_heroku_lazy() {
    local setup="$HOME/Library/Caches/heroku/autocomplete/zsh_setup"
    [[ -f "$setup" ]] && source "$setup"
}
(( $+commands[heroku] )) && lazy_load "heroku" '_heroku_lazy'
