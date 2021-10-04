# Old stuff kept here in case I need it

# # Customized path
# export PATH=$PATH:$HOME/.nvm/v0.8.9/bin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:~/depot_tools:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

# # Emacs
# export TERM='xterm-256color'

# # From: https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html
# # Defer initialization of nvm until nvm, node or a node-dependent command is
# # run. Ensure this block is only run once if .bashrc gets sourced multiple times
# # by checking whether __init_nvm is a function.
# # if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type -t __init_nvm)" = function ]; then
# if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type '__init_nvm' 2>/dev/null | grep -q 'function')" = function ]; then
#     export NVM_DIR="$HOME/.nvm"
#     [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
#     declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
#     function __init_nvm() {
#         for i in "${__node_commands[@]}"; do unalias $i; done
#         . "$NVM_DIR"/nvm.sh
#         unset __node_commands
#         unset -f __init_nvm
#     }
#     for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
# fi
# # simple version:
# # if [[ -f ~/.nvm/nvm.sh && -r ~/.nvm/nvm.sh ]]; then
# #   source ~/.nvm/nvm.sh
# # fi