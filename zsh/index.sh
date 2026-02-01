#!/bin/zsh
# =============================================================================
# ZSH Configuration Index
# =============================================================================
# Optimized loading order with lazy loading support

CONFIG_DIR="$HOME/.config/zsh"

# 1. Load lazy loading utilities first (required by other modules)
source "$CONFIG_DIR/core/lazy.sh"

# 2. Core configurations
source "$CONFIG_DIR/core/init.sh"
source "$CONFIG_DIR/core/general.sh"
source "$CONFIG_DIR/core/alias.sh"

# 3. Programming language configurations
for file in "$CONFIG_DIR"/langs/*.sh; do
    [[ -f "$file" ]] && source "$file"
done

# 4. Development tools
for file in "$CONFIG_DIR"/tools/*.sh; do
    [[ -f "$file" ]] && source "$file"
done

# 5. Cloud services
for file in "$CONFIG_DIR"/cloud/*.sh; do
    [[ -f "$file" ]] && source "$file"
done

# 6. Environment-specific configurations (load last)
for file in "$CONFIG_DIR"/env/*.sh; do
    [[ -f "$file" ]] && source "$file"
done

# 7. Initialize completions ONCE at the very end
autoload -Uz compinit
# Only regenerate completion dump once per day
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C  # Use cached completions
fi

# 8. Compile zsh files for faster loading (runs once, then uses cached .zwc)
{
    local f
    for f in ~/.zshrc ~/.config/zsh/**/*.sh; do
        [[ $f -nt $f.zwc ]] && zcompile "$f" 2>/dev/null
    done
} &!
