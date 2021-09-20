# Load a local file with aliases if it exists
# for aliases that can't be public
FILE=~/.aliases.zsh.local && test -f $FILE && source $FILE

#
# curl
#
# to track the response time
alias curltf='curl -w "    time_namelookup:  %{time_namelookup}\n       time_connect:  %{time_connect}\n    time_appconnect:  %{time_appconnect}\n   time_pretransfer:  %{time_pretransfer}\n      time_redirect:  %{time_redirect}\n time_starttransfer:  %{time_starttransfer}\n                    ----------\n         time_total:  %{time_total}\n" -s -o /dev/null'
alias curlt='printf "time_namelookup: %%{time_namelookup}\\\n\ntime_connect: %%{time_connect}\\\n\ntime_appconnect: %%{time_appconnect}\\\n\ntime_pretransfer: %%{time_pretransfer}\\\n\ntime_redirect: %%{time_redirect}\\\n\ntime_starttransfer: %%{time_starttransfer}\\\n\ntime_total: %%{time_total}\\\n\n" > /tmp/curlt-format.txt && curl -w "@/tmp/curlt-format.txt" -o /dev/null -s'
# alias curlt='curl -w %{time_total} -s -o /dev/null'

#
# general
#
alias rm-logs='confirm && find . -name "*.log" -delete -print'
alias rm-sass-cache='find . -name ".sass-cache" -type d -exec rm -vr {} +'
alias reload-gnome-shell='killall -3 gnome-shell'
alias prettyjson='python -m json.tool'
alias myip='curl ifconfig.me' # alias myip='wget https://ipinfo.io/ip -qO -'

#
# old
#
alias lxc-stop-all='for m in `sudo lxc-ls --running | cut -d" " -f 1`; do sudo lxc-stop -n $m ; done'
alias disable-lid-close='xset s off; xset -dpms; xset s noblank'
