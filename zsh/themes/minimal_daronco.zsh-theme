LCHAR_WIDTH=%1G
# LCHAR='$'
LCHAR='➜'

# TIME="%(?.%{$fg[cyan]%}.%{$fg[red]%})%*%{$reset_color%}"
PROMPT='%{$fg[cyan]%}%~ $(git_prompt_info)%{$fg[white]%}%{$LCHAR$LCHAR_WIDTH%} '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"
# ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}="
ZSH_THEME_GIT_PROMPT_CLEAN=""
