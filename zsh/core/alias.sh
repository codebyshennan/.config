# ZSH Configuration Aliases
alias load="code ~/.config/"
alias reload="source ~/.config/.zshrc"

# Navigation Shortcuts
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias ~="cd ~"

# Directory Navigation Functions
mcd()
{
  test -d "$1" || mkdir "$1" && cd "$1"
}

cl()
{
  cd "$1" && ls -laGh --color=always
}

# Project Directory Shortcuts
alias hustles="cd ~/Documents/hustles && ts1"
alias me="cd ~/Documents/personal && ts1"
alias home="cd ~/Documents && ts1"
alias work="cd ~/Documents/work && ts1"
alias learn="cd ~/Documents/learning && ts1"
alias 42sg="cd ~/Documents/learning/42sg && ts1"

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
