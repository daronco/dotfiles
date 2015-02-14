# Emacses
alias emacs='emacs -nw'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias estart='emacs --daemon'
alias ekill='emacsclient -e "(kill-emacs)"'

# Greps
alias grep='grep --exclude="*~" --color=auto'
alias grep-js='grep --exclude-dir=.git --exclude-dir=.svn --exclude-dir=node_modules --exclude-dir=doc --exclude-dir=tmp --exclude-dir=public --exclude-dir=log --exclude-dir=tmp --exclude-dir=builtAssets --exclude="*.log"'
alias grep-rails='grep --exclude-dir=.git --exclude-dir=.svn --exclude-dir=doc --exclude-dir=rdoc --exclude-dir=log --exclude-dir=tmp --exclude-dir=public --exclude-dir=extras --exclude-dir=vendor --exclude="*.log" --exclude-dir=coverage --exclude-dir=pkg --exclude-dir=_other --exclude-dir=_tmp --exclude-dir=.sass-cache'

# Prints the number of lines in the current git repository contributed by each of the contributors
# From: http://stackoverflow.com/questions/4589731/git-blame-statistics
alias git-contrib-full='git ls-tree -r HEAD|sed -re "s/^.{53}//"|while read filename; do file "$filename"; done|grep -E ": .*text"|sed -r -e "s/: .*//"|while read filename; do git blame -w "$filename"; done|sed -r -e "s/.*\((.*)[0-9]{4}-[0-9]{2}-[0-9]{2} .*/\1/" -e "s/ +$//"|sort|uniq -c'

alias git-rm-deleted='git ls-files --deleted -z | xargs -0 git rm'
# git rm $(git ls-files --deleted)

alias rm-logs='confirm && find . -name "*.log" -delete -print'
alias rm-sass-cache='find . -name ".sass-cache" -type d -exec rm -vr {} +'

alias va='vagrant'
alias vag='vagrant'
