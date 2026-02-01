# =============================================================================
# ZSH Configuration Entry Point
# =============================================================================
# All configuration is modular - see ~/.config/zsh/

# Essential PATH (before any tools)
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Powerlevel10k instant prompt (must be near top)
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Load all configurations
source "$HOME/.config/zsh/index.sh"

# =============================================================================
# Additional PATH entries (tools installed outside package managers)
# =============================================================================

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-22.0.2.jdk/Contents/Home

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH"

# Ruby (RVM) - lazy load
[[ -s "$HOME/.rvm/scripts/rvm" ]] && lazy_load "rvm ruby gem" 'source "$HOME/.rvm/scripts/rvm"'
export PATH="$PATH:$HOME/.rvm/bin"

# Blockchain tools
export PATH="$HOME/.foundry/bin:$HOME/.local/share/solana/install/active_release/bin:$PATH"

# GNU tools
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:/opt/homebrew/opt/bzip2/bin:$PATH"

# MySQL client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Rancher Desktop
[[ -d "$HOME/.rd/bin" ]] && export PATH="$HOME/.rd/bin:$PATH"

# Editor tools
[[ -d "$HOME/.codeium/windsurf/bin" ]] && export PATH="$HOME/.codeium/windsurf/bin:$PATH"
[[ -d "$HOME/.amp/bin" ]] && export PATH="$HOME/.amp/bin:$PATH"
[[ -d "$HOME/.cache/lm-studio/bin" ]] && export PATH="$PATH:$HOME/.cache/lm-studio/bin"

# Heroku completion (lazy)
_heroku_lazy() {
    local setup="$HOME/Library/Caches/heroku/autocomplete/zsh_setup"
    [[ -f "$setup" ]] && source "$setup"
}
(( $+commands[heroku] )) && lazy_load "heroku" '_heroku_lazy'

# Local bin
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"