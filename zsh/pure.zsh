fpath+=$HOME/.zsh/pure
# PURE_PROMPT_SYMBOL=➜
# PURE_PROMPT_SYMBOL=\>
autoload -U promptinit; promptinit
zstyle :prompt:pure:prompt:success color cyan
zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:prompt:success attr +bold
zstyle :prompt:pure:prompt:error attr +bold
prompt pure

# setup kube-ps1 https://github.com/jonmosco/kube-ps1
# KUBE_PS1_PREFIX=''
# KUBE_PS1_SYMBOL_ENABLE=false
# KUBE_PS1_SUFFIX=''
PROMPT='$(kube_ps1)'$PROMPT
kubeoff # disabled by default
