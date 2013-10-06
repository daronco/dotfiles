# daronco
# strongly based on crunch (and others).

# colors
DARONCO_BRACKET_COLOR="%{$fg[white]%}"
DARONCO_TIME_COLOR="%{$fg[white]%}"
DARONCO_RVM_COLOR="%{$fg[magenta]%}"
DARONCO_DIRCOLOR="%{$fg[cyan]%}"
DARONCO_GIT_BRANCH_COLOR="%{$fg[green]%}"
DARONCO_GIT_CLEAN_COLOR="%{$fg[green]%}"
DARONCO_GIT_DIRTY_COLOR="%{$fg[red]%}"
DARONCO_GIT_UNTRACKED_COLOR="%{$fg[cyan]%}"

# git (used by oh-my-zsh git_prompt_info helper)
ZSH_THEME_GIT_PROMPT_PREFIX="$DARONCO_BRACKET_COLOR:$DARONCO_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$DARONCO_GIT_DIRTY_COLOR ±"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$DARONCO_GIT_UNTRACKED_COLOR ?"
ZSH_THEME_GIT_PROMPT_CLEAN="$DARONCO_GIT_CLEAN_COLOR ●"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✓"

# hour
DARONCO_TIME="$DARONCO_BRACKET_COLOR$DARONCO_TIMECOLOR%T$DARONCO_BRACKET_COLOR%{$reset_color%}"
# rvm
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  DARONCO_RVM="$DARONCO_BRACKET_COLOR"["$DARONCO_RVMCOLOR\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}$DARONCO_BRACKET_COLOR"]"%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    DARONCO_RVM="$DARONCO_BRACKET_COLOR"["$DARONCO_RVMCOLOR\${\$(rbenv version | sed -e 's/ (set.*$//' -e 's/^ruby-//')}$DARONCO_BRACKET_COLOR"]"%{$reset_color%}"
  fi
fi
# dir
DARONCO_DIR="$DARONCO_DIRCOLOR%~\$(git_prompt_info) "
# arrow at the end
DARONCO_ARROW="$DARONCO_TIMECOLOR➜ %{$reset_color%}"
# user name
if [ $UID -eq 0 ]; then NCOLOR="%{$fg_bold[magenta]%}"; else NCOLOR="%{$fg[cyan]%}"; fi
DARONCO_USER="$NCOLOR%n%{$reset_color%}"

# put it all together
PROMPT="$DARONCO_USER@$DARONCO_TIME$DARONCO_RVM $DARONCO_DIR$DARONCO_ARROW%{$reset_color%}"
