#!/bin/zsh
# =============================================================================
# Lazy Loading Utilities
# =============================================================================
# Functions to defer expensive operations until first use

# Generic lazy loader - creates wrapper functions that load on first call
# Usage: lazy_load "trigger_commands" "load_code"
lazy_load() {
    local triggers=$1
    local load_code=$2

    for cmd in ${(s: :)triggers}; do
        eval "
        $cmd() {
            unfunction $triggers 2>/dev/null
            $load_code
            $cmd \"\$@\"
        }
        "
    done
}

# Lazy load with completion support
lazy_load_completion() {
    local cmd=$1
    local completion_cmd=$2

    eval "
    _lazy_load_completion_$cmd() {
        compdef -d $cmd
        $completion_cmd
    }
    compdef _lazy_load_completion_$cmd $cmd
    "
}
