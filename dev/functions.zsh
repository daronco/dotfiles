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

bbb-checksum() {
    echo -n $1 | sha1sum | cut -d ' ' -f 1
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
            find $basedir -mindepth 2 -maxdepth 2 -type d -iname "*${1}*" -printf "\n%AD %AT %p" | sort -k1.8nr -k1.1nr -k1r
            dir=$(find $basedir -mindepth 2 -maxdepth 2 -type d -iname "*${1}*" -printf "\n%AD %AT %p" | sort -k1.8nr -k1.1nr -k1r | cut -d ' ' -s -f3 | head -1)
            if [[ -d $dir ]]; then
                cd $dir
            else
                echo "No project found for: ${1}"
            fi
        fi
    fi
}

# open "code <project_dir>""
pjcode () {
    basedir=$PROJECTS
    dir=$basedir/mconf/${1}
    if [[ -d $dir ]]; then
        echo "Opening project: ${dir}"
        code $dir
    else
        dir=$basedir/mconf/mconf-${1}
        if [[ -d $dir ]]; then
            echo "Opening project: ${dir}"
            code $dir
        else
            # search inside $basedir, a name of a project with the string passed by the user
            # sort by more recently modified and cd into the first result
            find $basedir -mindepth 2 -maxdepth 2 -type d -iname "*${1}*" -printf "\n%AD %AT %p" | sort -k1.8nr -k1.1nr -k1r
            dir=$(find $basedir -mindepth 2 -maxdepth 2 -type d -iname "*${1}*" -printf "\n%AD %AT %p" | sort -k1.8nr -k1.1nr -k1r | cut -d ' ' -s -f3 | head -1)
            if [[ -d $dir ]]; then
                echo "Opening project: ${dir}"
                code $dir
            else
                echo "No project found for: ${1}"
            fi
        fi
    fi
}

ngrok-ls () {
    curl -s http://localhost:4040/api/tunnels | jq '.tunnels.[] | {mame: .name, url: .public_url }'
}
