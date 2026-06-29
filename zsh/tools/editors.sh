#!/bin/zsh
# =============================================================================
# Editor / IDE CLI Tools (Windsurf, Amp, LM Studio)
# =============================================================================

[[ -d "$HOME/.codeium/windsurf/bin" ]] && export PATH="$HOME/.codeium/windsurf/bin:$PATH"
[[ -d "$HOME/.amp/bin" ]] && export PATH="$HOME/.amp/bin:$PATH"
[[ -d "$HOME/.cache/lm-studio/bin" ]] && export PATH="$PATH:$HOME/.cache/lm-studio/bin"
