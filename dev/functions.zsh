genhash() {
    case "$1" in
        secret)
            openssl rand -hex ${2:-20}
            ;;
        api)
            openssl rand -hex ${2:-20}
            ;;
        lti)
            openssl rand -hex ${2:-30}
            ;;
        *)
            # If $1 is a number, use it as the length for the default method
            if [[ "$1" =~ ^[0-9]+$ ]]; then
                cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $1 | head -n 1 | cut -c -$1
            else
                cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${2:-32} | head -n 1 | cut -c -${2:-32}
            fi
            ;;
    esac
}

bbb-checksum() {
    echo -n $1 | sha1sum | cut -d ' ' -f 1
}

# Helper function to find the project directory
pj_find_dir() {
    basedir=$PROJECTS
    dir=$basedir/mconf/${1}
    if [[ -d $dir ]]; then
        echo $dir
    else
        dir=$basedir/mconf/mconf-${1}
        if [[ -d $dir ]]; then
            echo $dir
        else
            dir=$(find $basedir -mindepth 1 -maxdepth 2 -type d -iname "*${1}*" -printf "\n%AD %AT %p" | sort -k1.8nr -k1.1nr -k1r | cut -d ' ' -s -f3 | head -1)
            if [[ -d $dir ]]; then
                echo $dir
            else
                echo ""
            fi
        fi
    fi
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
# |____ proj4
#
pj () {
    dir=$(pj_find_dir "$1")
    if [[ -n $dir && -d $dir ]]; then
        cd $dir
    else
        echo "No project found for: ${1}"
    fi
}

# open "code <project_dir>""
pjcode () {
    dir=$(pj_find_dir "$1")
    if [[ -n $dir && -d $dir ]]; then
        code "$dir"
    else
        echo "No project found for: ${1}"
    fi
}

ngrok-ls () {
    curl -s http://localhost:4040/api/tunnels | jq '.tunnels.[] | {mame: .name, url: .public_url }'
}
