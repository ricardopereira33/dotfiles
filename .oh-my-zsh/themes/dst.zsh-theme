
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

PROMPT='%(?, ,%{$fg[orange]%}%{$reset_color%}
)
%{$fg[red]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}: %{$fg_bold[yellow]%}%~%{$reset_color%}$(git_prompt_info)
%_ $(prompt_char) '


