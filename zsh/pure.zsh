fpath+=$HOME/.zsh/pure
# PURE_PROMPT_SYMBOL=➜
# PURE_PROMPT_SYMBOL=\>
autoload -U promptinit; promptinit
zstyle :prompt:pure:prompt:success color cyan
zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:prompt:success attr +bold
zstyle :prompt:pure:prompt:error attr +bold
prompt pure
