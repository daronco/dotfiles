# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
## very good
ZSH_THEME="daronco"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="crunch"
## good
# ZSH_THEME="zhann"
# ZSH_THEME="cloud"
# ZSH_THEME="pygmalion"
## 2 lines, very complete
# ZSH_THEME="ys"

typeset -ga sources
sources+=~/.aliases.zsh
sources+=~/.functions.zsh

# try to include all sources
for file in ${sources}; do
    if [[ -a $file ]]; then
      source $file
    fi
done

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Disable auto correction
DISABLE_CORRECTION="true"
## To disable only for parameters but enable it for commands:
## from: superuser.com/questions/439209/how-to-partially-disable-the-zshs-autocorrect#answer-610025
# unsetopt correct_all
# setopt correct

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github ruby bundler gem rails rbenv zeus node npm coffee command-not-found battery colored-man extract rsync rand-quote history-substring-search history pj last-working-dir zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customized path
export PATH=$PATH:/home/leonardo/.nvm/v0.8.9/bin:/home/leonardo/.rbenv/shims:/home/leonardo/.rbenv/bin:~/depot_tools:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

# Emacs
export TERM='xterm-256color'

# NVM
source ~/.nvm/nvm.sh

# For history-substring-search
# Bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Ignore duplicate history entries
setopt histignoredups

# Keep TONS of history
export HISTSIZE=4096

# Overrides definition from the plugin bundler
# My bundler doesn't have the flag --jobs yet
eval "alias bi='bundle install'" # --jobs=$cores_num'"

# Project paths for the plugin pj
PROJECT_PATHS=(~/Dev/mconf ~/Dev/daronco ~/Dev/bigbluebutton)
