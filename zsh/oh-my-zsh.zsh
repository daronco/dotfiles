# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
## very good
# ZSH_THEME="daronco"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="spaceship"
# ZSH_THEME=minimal_improve
# ZSH_THEME=minimal_daronco
# ZSH_THEME="crunch"
## good
# ZSH_THEME="zhann"
# ZSH_THEME="cloud"
# ZSH_THEME="pygmalion"
## 2 lines, very complete
# ZSH_THEME="ys"

typeset -ga sources

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Disable escaping of URLs when pasting
# See https://stackoverflow.com/questions/25614613/how-to-disable-zsh-substitution-autocomplete-with-url-and-backslashes
DISABLE_MAGIC_FUNCTIONS=true

# Disable auto correction
DISABLE_CORRECTION="true"
## To disable only for parameters but enable it for commands:
## from: superuser.com/questions/439209/how-to-partially-disable-the-zshs-autocorrect#answer-610025
# unsetopt correct_all
# setopt correct

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github ruby bundler gem rails rbenv zeus node npm coffee command-not-found battery extract rsync rand-quote history-substring-search history last-working-dir zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# For history-substring-search
# Bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Ignore duplicate history entries
setopt histignoredups

# Keep TONS of history
export HISTSIZE=4096

# CTRL+arrows to move between words
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Automatically open tmux when running a new shell
[ -z "$TMUX" ] && command -v tmux > /dev/null && TERM=xterm-256color && cd $PROJECTS && exec tmux
