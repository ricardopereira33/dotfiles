plugins=(
  git
  colored-man-pages
  extract
)

# zsh
source $ZSH/oh-my-zsh.sh
source $ZSH/lib/spectrum.zsh

# asdf
source $HOME/.asdf/asdf.sh

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Antibody
source <(antibody init)
antibody bundle < ~/.config/zsh/zsh_plugins.txt
