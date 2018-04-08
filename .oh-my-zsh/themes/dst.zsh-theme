ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[072]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function virtualenv_info {
    ENV="%{${fg_bold[white]}%}env %{${fg[green]}%}`basename \"$VIRTUAL_ENV\"`%{${fg_bold[white]}%}%{${reset_color}%}"
    [ $VIRTUAL_ENV ] && echo $ENV
}

ERROR="%{$fg_bold[red]%}❯%{$reset_color%}"
RIGHT="%{$fg_bold[reset_color]%}❯%{$reset_color%}"

PROMPT='%(?, ,%{$fg[orange]%}%{$reset_color%})
%{$FG[038]%}%3~%{$reset_color%}$(git_prompt_info)
%_ %(?.$RIGHT.$ERROR) '

RPROMPT='$(virtualenv_info)'


