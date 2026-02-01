#!/bin/zsh
# =============================================================================
# Rust Configuration
# =============================================================================

# Cargo PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Cargo env (only if exists)
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Aliases
alias cb="cargo build"
alias cch="cargo check"
alias cf="cargo fmt -v"
alias ci="cargo install"
alias cr="cargo run"
alias ct="cargo test"
alias cw="cargo watch"
alias cwr="cargo watch -x run"
