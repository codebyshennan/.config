#!/bin/zsh
# =============================================================================
# Kubernetes (kubectl) Configuration
# =============================================================================

# Environment
export KUBECONFIG="${KUBECONFIG}:${HOME}/.kube/config:${HOME}/.kube/circles/config:${HOME}/.kube/labs/aws/config:${HOME}/.kube/labs/azure/config:${HOME}/.kube/labs/gcp/config"

# Use kubecolor if available
(( $+commands[kubecolor] )) && alias kubectl='kubecolor'

# Lazy load kubectl completion (expensive operation)
_kubectl_lazy_complete() {
    compdef -d kubectl k kc kube
    source <(kubectl completion zsh)
    complete -F __start_kubectl k
}
compdef _kubectl_lazy_complete kubectl k kc kube

# kube-ps1 is loaded on-demand since it modifies PROMPT
# Uncomment if you want it always:
# [[ -f "${HOMEBREW_PREFIX}/opt/kube-ps1/share/kube-ps1.sh" ]] && source "${HOMEBREW_PREFIX}/opt/kube-ps1/share/kube-ps1.sh"

# =============================================================================
# Functions
# =============================================================================

function kcexec() { kubectl exec -it "$1" -- "${2:-bash}"; }
function kexec() { kubectl exec -it "$1" -- "${2:-bash}"; }
function knc() { kubectl config set-context "$1" && kubectl config use-context "$1"; }
function get_cluster_resources() { kubectl get "$1" -o wide --all-namespaces "${@:2}"; }

# =============================================================================
# Aliases
# =============================================================================

# Context Management
alias kcc='kubectl config get-contexts'
alias kctx='kubectx'
alias kns='kubens'

# Core Commands
alias k='kubectl'
alias kc='kubectl'
alias kube='kubectl'
alias kd='kubectl delete'
alias ke='kubectl edit'
alias kg='kubectl get'
alias kga='kubectl get --all-namespaces'
alias kl='kubectl logs'
alias kcl='kubectl logs'
alias klf='kubectl logs -f'

# Resource Management - Workloads
alias kgp='kubectl get pods'
alias kgd='kubectl get deployments'
alias kgds='kubectl get daemonsets'
alias kgss='kubectl get statefulsets'
alias kgc='kubectl get cronjobs'
alias kgj='kubectl get jobs'

# Configuration
alias kgcm='kubectl get configmaps'
alias kgsc='kubectl get secrets'
alias kgi='kubectl get ingress'

# Storage
alias kgpv='kubectl get persistentvolumes'
alias kgpvc='kubectl get persistentvolumeclaims'

# RBAC
alias kgsa='kubectl get serviceaccounts'
alias kgr='kubectl get roles'
alias kgrb='kubectl get rolebindings'
alias kgcr='kubectl get clusterroles'
alias kgcrb='kubectl get clusterrolebindings'

# Infrastructure
alias kgn='kubectl get nodes'
alias kgs='kubectl get services'
alias kgns='kubectl get namespaces'

# Watch Commands
alias kgpw='watch kubectl get pods'
alias kgdw='watch kubectl get deployments'

# File Operations
alias kaf='kubectl apply -f'
alias kcf='kubectl create -f'
alias kdf='kubectl delete -f'

# Resource Monitoring
alias ktp='kubectl top pods'
alias ktn='kubectl top nodes'

# Exec
alias keit='kubectl exec -it --'

# Describe/Delete/Edit shortcuts
alias kdp='kubectl delete pod'
alias kdsp='kubectl describe pods'
alias kep='kubectl edit pods'
alias kdd='kubectl delete deployment'
alias kdsd='kubectl describe deployments'
alias ked='kubectl edit deployments'
