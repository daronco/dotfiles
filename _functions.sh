export DOTFILES=$HOME/.dotfiles

clone_or_update () {
    if [ -d "$1" ]
    then
        echo "$1 already exists"
        if [ -d "$1/.git" ]
        then
            echo "$1 is a git repository, updating"
            sh -c "cd $1; git pull"
        else
            echo "$1 is not a git repository, ignoring."
        fi
    else
        echo "Cloning into $1"
        git clone $2 $1
    fi
}

info () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
    printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
}
