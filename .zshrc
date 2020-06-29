DOTFILES_DIR="$HOME/Documents/dotfiles"

for file in $DOTFILES_DIR/zsh/*.zsh; do
  source "$file"
done

eval "$(starship init zsh)"
