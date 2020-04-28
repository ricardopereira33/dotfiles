plugins=(
  git
  colored-man-pages
  extract
)

source $ZSH/oh-my-zsh.sh
source $ZSH/lib/spectrum.zsh

# Functions
function activate() {
  export VIRTUAL_ENV_DISABLE_PROMPT='1'
  source ./$1/bin/activate
}

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ANTIBODY
source <(antibody init)
antibody bundle < ~/.config/zsh/zsh_plugins.txt
