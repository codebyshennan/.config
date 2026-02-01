#!/bin/zsh
# =============================================================================
# Terraform Configuration
# =============================================================================

# Terraform completion - lazy loaded
_terraform_lazy_complete() {
    compdef -d terraform tf
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /opt/homebrew/bin/terraform terraform
}
compdef _terraform_lazy_complete terraform tf

# =============================================================================
# Aliases
# =============================================================================

# Basic commands
alias tf='terraform'
alias tfin='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfv='terraform validate'

# Enhanced init and apply
alias tfinu='terraform init -upgrade'
alias tfay='terraform apply -auto-approve'
alias tfdy='terraform destroy -auto-approve'

# State commands
alias tfs='terraform state'
alias tfsls='terraform state list'
alias tfssw='terraform state show'
alias tfsmv='terraform state mv'
alias tfsrm='terraform state rm'
alias tfspl='terraform state pull'
alias tfsph='terraform state push'

# Workspace commands
alias tfw='terraform workspace'
alias tfwls='terraform workspace list'
alias tfwsw='terraform workspace show'
alias tfwst='terraform workspace select'
alias tfwnw='terraform workspace new'
alias tfwde='terraform workspace delete'

# Resource manipulation
alias tft='terraform taint'
alias tfut='terraform untaint'
alias tfim='terraform import'
alias tffu='terraform force-unlock'

# Development tools
alias tff='terraform fmt'
alias tfc='terraform console'
alias tfo='terraform output'
alias tfg='terraform graph'
alias tfpr='terraform providers'
alias tfr='terraform refresh'
alias tfsh='terraform show'
alias tfpde='terraform plan --destroy'
