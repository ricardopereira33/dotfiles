plugins=(git)

source $ZSH/oh-my-zsh.sh
source $ZSH/lib/spectrum.zsh

# Functions
function activate(){
    export VIRTUAL_ENV_DISABLE_PROMPT='1'
    source ./$1/bin/activate
}

# ANTIBODY
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt
