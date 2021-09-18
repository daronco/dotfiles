# Load a local file with aliases if it exists
# for aliases that can't be public
FILE=~/.aliases.zsh.local && test -f $FILE && source $FILE

#
# emacs
#
alias emacs='emacs -nw'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias estart='emacs --daemon'
alias ekill='emacsclient -e "(kill-emacs)"'

#
# grep
#
IGNORES='--exclude-dir=.git --exclude-dir=.svn --exclude-dir=doc --exclude-dir=rdoc --exclude-dir=node_modules --exclude-dir=tmp --exclude-dir=public --exclude-dir=.meteor --exclude-dir=log --exclude-dir=tmp --exclude-dir=builtAssets --exclude-dir=extras --exclude-dir=vendor --exclude-dir=coverage --exclude="*.log" --exclude="*.bz2" --exclude-dir=pkg --exclude-dir=_other --exclude-dir=_tmp --exclude-dir=.sass-cache --exclude-dir=venv --exclude-dir=.venv --exclude-dir=__pycache__ --exclude-dir=dist --exclude-dir=.cache --exclude-dir=.volumes --exclude-dir=private'
GREP='grep --exclude="*~" --color=auto'
alias grep="$GREP"
alias grepr="$GREP $IGNORES -r"

#
# git
#
alias git-rm-deleted='git ls-files --deleted -z | xargs -0 git rm'
alias gits='git status'
# Prints the number of lines in the current git repository contributed by each of the contributors
# From: http://stackoverflow.com/questions/4589731/git-blame-statistics
alias git-contrib-full='git ls-tree -r HEAD|sed -re "s/^.{53}//"|while read filename; do file "$filename"; done|grep -E ": .*text"|sed -r -e "s/: .*//"|while read filename; do git blame -w "$filename"; done|sed -r -e "s/.*\((.*)[0-9]{4}-[0-9]{2}-[0-9]{2} .*/\1/" -e "s/ +$//"|sort|uniq -c'

#
# docker
#
alias docker-rm-all='sudo docker stop $(sudo docker ps -a -q); sudo docker rm $(sudo docker ps -a -q)'
alias docker-stop-all='sudo docker stop $(sudo docker ps -a -q)'
alias docker-prune='docker container prune -f; docker image prune -f'
alias d-c='docker-compose'
alias dcd='docker-compose down'

#
# tmux
#
alias tmux-kill-others='tmux kill-session -a'
alias tmux-boot='~/.dotfiles/tmux-boot.sh'

#
# kubernetes
#
alias kc='kubectl'
alias k='kubectl'
alias kg='kubectl get'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kctx='kubectx'
alias kns='kubens'
alias k-nod-full='kubectl get nodes -owide --show-labels'
alias k-nod-pod='kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name'
alias k-nod-top="kubectl describe nodes | grep 'Name:\|  cpu\|  memory'"
# alias kc-once="kubectl run -it --rm alpine --image=alpine:3.6 --restart=Never"
# alias kc-once="kubectl run -it --rm alpine-$(openssl rand -hex ${1:-3}) --image=alpine:3.6 --restart=Never"

kc_once() {
    kubectl run -it --rm alpine-`openssl rand -hex 3` --image=alpine:3.6 --restart=Never ${@}
}

#
# curl
#
# to track the response time
alias curltf='curl -w "    time_namelookup:  %{time_namelookup}\n       time_connect:  %{time_connect}\n    time_appconnect:  %{time_appconnect}\n   time_pretransfer:  %{time_pretransfer}\n      time_redirect:  %{time_redirect}\n time_starttransfer:  %{time_starttransfer}\n                    ----------\n         time_total:  %{time_total}\n" -s -o /dev/null'
alias curlt='printf "time_namelookup: %%{time_namelookup}\\\n\ntime_connect: %%{time_connect}\\\n\ntime_appconnect: %%{time_appconnect}\\\n\ntime_pretransfer: %%{time_pretransfer}\\\n\ntime_redirect: %%{time_redirect}\\\n\ntime_starttransfer: %%{time_starttransfer}\\\n\ntime_total: %%{time_total}\\\n\n" > /tmp/curlt-format.txt && curl -w "@/tmp/curlt-format.txt" -o /dev/null -s'
# alias curlt='curl -w %{time_total} -s -o /dev/null'


#
# ruby
#
alias bu='bundle update --source'

#
# general
#
alias rm-logs='confirm && find . -name "*.log" -delete -print'
alias rm-sass-cache='find . -name ".sass-cache" -type d -exec rm -vr {} +'
alias reload-gnome-shell='killall -3 gnome-shell'
alias prettyjson='python -m json.tool'
alias myip='curl ifconfig.me' # alias myip='wget https://ipinfo.io/ip -qO -'

genhash() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1 | cut -c -${1:-32}
}
gensecret() {
    # openssl rand -base64 32 | sha1sum
    openssl rand -hex ${1:-20}
}
gensecretapi() {
    gensecret
}
gensecretlti() {
    gensecret 30
}
tob64() {
    echo -n ${1} | base64
}
fromb64() {
    echo -n ${1} | base64 -d
}
replace() {
    grepr $1 -l | xargs sed -i "s/$1/$2/g"
}

alias tw-upgrade='sudo pip install --upgrade streamlink'
tw() {
    # livestreamer twitch.tv/$1 "${2:-best}" --ringbuffer-size 100M --hls-live-edge 12 -l ${3:-info}
    streamlink --twitch-disable-ads twitch.tv/$1 "${2:-best}"
}

shapass() {
    echo -n $1 | sha256sum | cut -f1 -d\ | xxd -r -p | base64 | cut -c -${2:-32}
}
bbb-checksum() {
    echo -n $1 | sha1sum | cut -d ' ' -f 1
}

#
# old
#
alias lxc-stop-all='for m in `sudo lxc-ls --running | cut -d" " -f 1`; do sudo lxc-stop -n $m ; done'
alias disable-lid-close='xset s off; xset -dpms; xset s noblank'

rdoc2md() {
    ruby -r rdoc -e "puts RDoc::Markup::ToMarkdown.new.convert File.read(\"$1\")";
}
