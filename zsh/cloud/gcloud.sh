#!/bin/zsh
# =============================================================================
# Google Cloud SDK Configuration
# =============================================================================

# gcloud PATH and completion - lazy loaded
_gcloud_lazy_init() {
    local gcloud_path="$HOME/google-cloud-sdk"
    [[ -f "$gcloud_path/path.zsh.inc" ]] && source "$gcloud_path/path.zsh.inc"
    [[ -f "$gcloud_path/completion.zsh.inc" ]] && source "$gcloud_path/completion.zsh.inc"
}

# Only set up lazy loading if gcloud SDK exists
[[ -d "$HOME/google-cloud-sdk" ]] && lazy_load "gcloud gsutil bq" '_gcloud_lazy_init'
