killit() {
 # Kills any process that matches a regexp passed to it
 ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

#if [ -z "\${which tree}" ]; then
tree () {
  find $@ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}
#fi

exip () {
    # gather external ip address
    echo -n "Current External IP: "
    curl -s -m 5 http://myip.dk | grep "ha4" | sed -e 's/.*ha4">//g' -e 's/<\/span>.*//g'
}

ips () {
    # determine local IP address
    ifconfig | grep "inet " | awk '{ print $2 }'
}

shell () {
    ps | grep `echo $$` | awk '{ print $4 }'
}

confirm () {
    # call with a prompt string or use a default
    read -q "RESPONSE?Are you sure? [y/N]"
    # read -r -p "${1:-Are you sure? [y/N]} " response
    case $RESPONSE in
        [yY])
            true
            ;;
        *)
            false
            ;;
    esac
}
