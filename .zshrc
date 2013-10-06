# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
## very cool
ZSH_THEME="daronco"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="crunch"
## okayishs
# ZSH_THEME="zhann"
# ZSH_THEME="cloud"
# ZSH_THEME="pygmalion"
## 2 lines, very complete
# ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Emacses
alias emacs='emacs -nw'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias ekill='emacsclient -e "(kill-emacs)"'

# Greps
alias grep='grep --exclude="*~" --color=auto'
alias grep-js='grep --exclude-dir=.git --exclude-dir=.svn --exclude-dir=node_modules --exclude-dir=doc --exclude-dir=tmp --exclude-dir=public --exclude-dir=log --exclude-dir=tmp --exclude-dir=builtAssets --exclude="*.log"'
alias grep-rails='grep --exclude-dir=.git --exclude-dir=.svn --exclude-dir=doc --exclude-dir=rdoc --exclude-dir=log --exclude-dir=tmp --exclude-dir=public --exclude-dir=extras --exclude-dir=vendor --exclude="*.log" --exclude-dir=coverage --exclude-dir=pkg'

# Prints the number of lines in the current git repository contributed by each of the contributors
# From: http://stackoverflow.com/questions/4589731/git-blame-statistics
alias git-contrib-full='git ls-tree -r HEAD|sed -re "s/^.{53}//"|while read filename; do file "$filename"; done|grep -E ": .*text"|sed -r -e "s/: .*//"|while read filename; do git blame -w "$filename"; done|sed -r -e "s/.*\((.*)[0-9]{4}-[0-9]{2}-[0-9]{2} .*/\1/" -e "s/ +$//"|sort|uniq -c'

# Rails, ruby
alias be="bundle exec "

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github ruby rails rbenv history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/home/leonardo/.nvm/v0.8.9/bin:/home/leonardo/.rbenv/shims:/home/leonardo/.rbenv/bin:~/depot_tools:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

# Emacs
export TERM='xterm-256color'

# nvm
source ~/.nvm/nvm.sh

# for history-substring-search
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
