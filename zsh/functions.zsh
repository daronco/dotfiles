killit() {
    # Kills any process that matches a regexp passed to it
    ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

if [ -z "\${which tree}" ]; then
    tree () {
        find $@ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
    }
fi

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

rdoc2md() {
    ruby -r rdoc -e "puts RDoc::Markup::ToMarkdown.new.convert File.read(\"$1\")";
}

# cd's into a project
# tries its best to find one with the word passed in the first arg
# searches in a default directory assuming projects are organized as in:
#
# $basedir
# |____ group1
# | |____ proj1
# | |____ proj2
# |____ group2
# | |____ proj3
#
pj () {
    basedir=$PROJECTS
    dir=$basedir/mconf/${1}
    if [[ -d $dir ]]; then
        cd $dir
    else
        dir=$basedir/mconf/mconf-${1}
        if [[ -d $dir ]]; then
            cd $dir
        else
            # search inside $basedir, a name of a project with the string passed by the user
            # sort by more recently modified and cd into the first result
            dir=$(find $basedir -mindepth 2 -maxdepth 2 -type d -iname "*${1}*" -printf "\n%AD %AT %p" | sort -k1.8nr -k1.1nr -k1r | cut -d ' ' -s -f3 | head -1)
            if [[ -d $dir ]]; then
                cd $dir
            else
                echo "No project found for: ${1}"
            fi
        fi
    fi
}
