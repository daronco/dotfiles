# TODO: install oh-my-zsh

mkdir -p "$DOTFILES/zsh"
PURE_OUTPUT="$DOTFILES/zsh/pure"
if [ -d "$PURE_OUTPUT" ]
then
    echo "$PURE_OUTPUT already exists"
    if [ -d "$PURE_OUTPUT/.git" ]
    then
        echo "Updating $PURE_OUTPUT"
        sh -c "cd $PURE_OUTPUT; git pull"
    else
        echo "$PURE_OUTPUT is not a git repository, ignoring."
    fi
else
    echo "Cloning into $PURE_OUTPUT"
    git clone https://github.com/sindresorhus/pure.git "$DOTFILES/zsh/pure"
fi
