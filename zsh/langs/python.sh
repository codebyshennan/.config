#!/bin/zsh
# =============================================================================
# Python Configuration
# =============================================================================

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# Lazy load pyenv
if command -v pyenv &>/dev/null; then
    lazy_load "python python3 pip pip3 pyenv" 'eval "$(pyenv init -)"'
fi

# Conda - lazy load (very slow to initialize)
_conda_init() {
    local conda_path="/opt/anaconda3"
    [[ ! -d "$conda_path" ]] && conda_path="$HOME/opt/anaconda3"

    if [[ -f "$conda_path/etc/profile.d/conda.sh" ]]; then
        source "$conda_path/etc/profile.d/conda.sh"
    elif [[ -d "$conda_path" ]]; then
        export PATH="$conda_path/bin:$PATH"
    fi
}

lazy_load "conda" '_conda_init'
