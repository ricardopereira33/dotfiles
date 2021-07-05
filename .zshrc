DOTFILES_DIR="$HOME/Documents/dotfiles"
ZSH_DISABLE_COMPFIX=true

for file in $DOTFILES_DIR/zsh/*.zsh; do
  source "$file"
done

eval "$(starship init zsh)"
