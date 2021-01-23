plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  git
  colored-man-pages
  extract
)

eval "$(rbenv init -)"

# zsh
source $ZSH/oh-my-zsh.sh

# asdf
source /usr/local/opt/asdf/asdf.sh

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh