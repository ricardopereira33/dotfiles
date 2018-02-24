
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[071]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo %{$fg_bold[reset_color]%}▶; fi
}

PROMPT='%(?, ,%{$fg[orange]%}%{$reset_color%}
)
%{$fg[red]%}%n%{$reset_color%} @ %{$FG[039]%}MacbookAir$reset_color%: %{$FG[222]%}%3~%{$reset_color%}$(git_prompt_info)
%_ $(prompt_char) '


