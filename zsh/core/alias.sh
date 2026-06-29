# ZSH Configuration Aliases
alias load="code ~/.zshrc ~/.config/zsh/"
alias reload="source ~/.zshrc"

# Navigation Shortcuts
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias ~="cd ~"

# Directory Navigation Functions
mcd() { mkdir -p "$1" && cd "$1"; }

cl()
{
  cd "$1" && ls -laGh --color=always
}

# Project Directory Shortcuts
alias me="cd ~/Documents/personal && ts1"
alias home="cd ~/Documents && ts1"
alias docs='cd ~/Documents/personal/reference/vault && ts1'
alias docc='cd ~/Documents/personal/reference/vault && claudeyolo'
alias ventures='cd ~/Documents/personal/ventures && ts1'
alias frac='cd ~/Documents/personal/ventures/operating/consultancy/x-collective/fracxional && ts1'
alias download='cd ~/Downloads && ts1'

# Git and Development
alias cdr="cd \$(git rev-parse --show-toplevel)"
alias lg="lazygit"

# File and Directory Listing
alias lsa="ls -laGh --color=always"
alias ts="tree -hasC --du -L 2 -f"
alias ts1="tree -hasC --du -L 1 -f"

# Editor Aliases
alias vim="nvim"
alias vi="nvim"
alias lv="lvim"

# Utility Aliases
alias weather="curl wttr.in"
alias snowsql="/Applications/SnowSQL.app/Contents/MacOS/snowsql"

# AI - Claude Code
alias c='claude'
alias claudeyolo='claude --dangerously-skip-permissions'
alias claudep='claude --print'
alias claudec='claude --continue'
alias clauder='claude --resume'
alias claudeteam="claude --teammate-mode tmux --dangerously-skip-permissions"

# AI - Codex (workspace-only sandbox is the safe default)
alias codexd="codex --sandbox workspace-write --ask-for-approval never"
alias codexyolo='codex --dangerously-bypass-approvals-and-sandbox'

# AI - GitHub Copilot CLI
alias gh-copilot="gh copilot"

# AI - Model Shortcuts
alias opus='claude --model claude-opus-4-6'
alias sonnet='claude --model claude-sonnet-4-6'
alias haiku='claude --model claude-haiku-4-5-20251001'
alias dopus='claude --model claude-opus-4-6 --dangerously-skip-permissions'
alias dsonnet='claude --model claude-sonnet-4-6 --dangerously-skip-permissions'

# AI - Power Functions
fix() {
  local last_cmd=$(fc -ln -1)
  local output=$(eval "$last_cmd" 2>&1)
  claude -p "Fix this command that failed: $last_cmd\nOutput: $output"
}

explain() { local out; out=$(eval "$@" 2>&1); echo "$out"; claude -p "Explain this output: $out"; }

gcai() { git diff --staged | claude -p "Write a concise git commit message for these changes. Output only the message, no explanation."; }

review() { cat "$@" | claude -p "Review this:"; }
