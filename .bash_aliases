# Emacses
alias emacs='emacs -nw'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias ekill='emacsclient -e "(kill-emacs)"'

# Greps
alias grep='grep --exclude="*~" --color=auto'
alias grep-js='grep --exclude-dir=.git --exclude-dir=.svn --exclude-dir=node_modules --exclude-dir=doc --exclude-dir=tmp --exclude-dir=public --exclude-dir=log --exclude-dir=tmp --exclude-dir=builtAssets --exclude="*.log"'
alias grep-rails='grep --exclude-dir=.git --exclude-dir=.svn --exclude-dir=doc --exclude-dir=rdoc --exclude-dir=log --exclude-dir=tmp --exclude-dir=public --exclude-dir=extras --exclude-dir=vendor --exclude="*.log" --exclude-dir=coverage --exclude-dir=pkg'
