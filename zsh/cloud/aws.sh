#!/bin/zsh
# =============================================================================
# AWS CLI Configuration
# =============================================================================

# AWS completion - lazy loaded (requires bashcompinit which is slow)
_aws_lazy_complete() {
    compdef -d aws
    autoload bashcompinit && bashcompinit
    complete -C '/opt/homebrew/bin/aws_completer' aws
}
compdef _aws_lazy_complete aws

# AWS Copilot CLI (installed via aws/tap)
alias aws-copilot="copilot"
