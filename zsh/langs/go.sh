#!/bin/zsh
# =============================================================================
# Go Configuration
# =============================================================================

export GOPATH=$HOME/go

# Cache brew prefix to avoid slow $(brew --prefix) call
# Update this if you change Go installation
export GOROOT="/opt/homebrew/opt/go/libexec"

export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# GVM - lazy load
[[ -s "$HOME/.gvm/scripts/gvm" ]] && lazy_load "gvm" 'source "$HOME/.gvm/scripts/gvm"'

# golangci-lint completion - deferred until first tab completion on golangci-lint
_golangci_lint_lazy() {
    compdef -d golangci-lint
    source <(golangci-lint completion zsh)
}
compdef _golangci_lint_lazy golangci-lint
