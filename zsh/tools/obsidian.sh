#!/bin/zsh
# Obsidian vault helper

obs() {
    local vault_dir="$HOME/Documents/personal/reference/vault"
    if [[ "$PWD" != "$vault_dir"* ]]; then
        echo "obs: must be inside $vault_dir" >&2
        return 1
    fi
    local rel="${PWD#$vault_dir}"
    rel="${rel#/}"
    if [[ -n "$rel" && -f "00-overview.md" ]]; then
        open "obsidian://open?vault=vault&file=${rel}/00-overview"
    elif [[ -n "$rel" ]]; then
        open "obsidian://vault/vault/${rel}"
    else
        open "obsidian://open?vault=vault"
    fi
}
