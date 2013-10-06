# daronco
# strongly based on crunch (and others).

# TODO: user@machine when logged via ssh

# colors
BRACKET_COLOR="%{$fg[white]%}"
TIME_COLOR="%{$fg[white]%}"
DIRCOLOR="%{$fg[cyan]%}"
GIT_BRANCH_COLOR="%{$fg[green]%}"
GIT_CLEAN_COLOR="%{$fg_bold[green]%}"
GIT_DIRTY_COLOR="%{$fg_bold[red]%}"
GIT_UNTRACKED_COLOR="%{$fg_bold[cyan]%}"
RBENV_COLOR="%{$fg[yellow]%}"
ARROW_COLOR="%{$fg_bold[white]%}"

# git (used by oh-my-zsh git_prompt_info helper)
ZSH_THEME_GIT_PROMPT_PREFIX="$BRACKET_COLOR($GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}$BRACKET_COLOR)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$GIT_DIRTY_COLOR ±"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$GIT_UNTRACKED_COLOR ?"
#ZSH_THEME_GIT_PROMPT_CLEAN="$GIT_CLEAN_COLOR 0"
#ZSH_THEME_GIT_PROMPT_CLEAN="$GIT_CLEAN_COLOR ✓"
ZSH_THEME_GIT_PROMPT_CLEAN="$GIT_CLEAN_COLOR ●"

# hour
TIME="$BRACKET_COLOR$TIMECOLOR%T$BRACKET_COLOR%{$reset_color%}"

# rvm/rbenv
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  RVM="$BRACKET_COLOR"["$RBENV_COLOR\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}$BRACKET_COLOR"]"%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    # RVM="$BRACKET_COLOR"["$RBENV_COLOR\${\$(rbenv version | sed -e 's/ (set.*$//' -e 's/^ruby-//')}$BRACKET_COLOR"]"%{$reset_color%}"
    RVM='$RBENV_COLOR$(current_ruby)%{$reset_color%}'
  fi
fi

# dir
DIR="$DIRCOLOR%~\$(git_prompt_info)"

# user name
if [ $UID -eq 0 ]; then NCOLOR="%{$fg_bold[magenta]%}"; else NCOLOR="%{$fg[cyan]%}"; fi
USER='$NCOLOR%n%{$reset_color%}'

# arrow at the end
# LIMITER="$TIMECOLOR➜%{$reset_color%}"
if [ $UID -eq 0 ]; then
  LIMITER="%{$fg_bold[magenta]%}#%{$reset_color%}"
else
  LIMITER="%{$fg_bold[white]%}$%{$reset_color%}"
fi

# put it all together
PROMPT="$USER@$TIME $DIR $LIMITER %{$reset_color%}"
