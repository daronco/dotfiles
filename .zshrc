# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# TODO: too much stuff here already, time to organize it

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

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

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
plugins=(git github ruby bundler gem rails rbenv zeus node npm coffee command-not-found battery colored-man extract rsync rand-quote history-substring-search history pj last-working-dir zsh-syntax-highlighting)

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

# disable correct for parameters, but enable for commands
# from: superuser.com/questions/439209/how-to-partially-disable-the-zshs-autocorrect#answer-610025
unsetopt correct_all
setopt correct

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# overrides definition from the plugin bundler
# my bundler doesn't have the flag --jobs yet
eval "alias bi='bundle install'" # --jobs=$cores_num'"

PROJECT_PATHS=(~/Dev/mconf ~/Dev/daronco ~/Dev/bigbluebutton)

# functions
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions
