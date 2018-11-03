#!/bin/sh

# List of dotfiles to be version controled.
FILES=( ".vimrc" ".oh-my-zsh/themes/z33.zsh-theme" "README.md" ".zshrc" ".zsh_plugins.txt" ".gitconfig" ".config/nvim/init.vim" ".dotfiles.sh" ".config/nvim/rc/*" ".config/zsh/*")
GIT_COMMAND="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Wait 5 seconds before attempting to backup dotfiles.
sleep 5

eval "$GIT_COMMAND rm .oh-my-zsh/themes/dst.zsh-theme"

# Add files to git staging.
for FILE in "${FILES[@]}"
do
  eval "$GIT_COMMAND add $FILE"
done

# Check if there are any differences and if so commit with timestamp.
if ! eval "$GIT_COMMAND diff-index --quiet HEAD --"; then
  COMMIT_MESSAGE="\"Automatic backup at $(date +%s).\""
  eval "$GIT_COMMAND commit -m $COMMIT_MESSAGE"
  eval "$GIT_COMMAND push -u origin master"
fi
