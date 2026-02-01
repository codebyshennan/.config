# lg()
# {
#     export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

#     lazygit "$@"

#     if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
#             cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
#             rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
#     fi
# }

# show all remotes of git repositories in the cwd
alias show-remotes="find . -type d -name '.git' -exec sh -c 'cd {} && echo Remote: && git remote -v' \;"