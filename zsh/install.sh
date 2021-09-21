. $DOTFILES/_functions.sh

OHMYZSH_INSTALL_DIR="$HOME/.oh-my-zsh"
OHMYZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
OHMYZSH_THEMES_DIR="$HOME/.oh-my-zsh/custom/themes"

info "Installing oh-my-zsh into $OHMYZSH_INSTALL_DIR"
if [ ! -d "$OHMYZSH_INSTALL_DIR" ]
then
    info "Installing oh-my-zsh for the first time"
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
else
    info "Updating oh-my-zsh"
    sh -c "cd $OHMYZSH_INSTALL_DIR; git pull"
fi

info "Installing oh-my-zsh plugins into $OHMYZSH_PLUGINS_DIR"
clone_or_update $OHMYZSH_PLUGINS_DIR/zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git

info "Installing zsh/pure into $DOTFILES/zsh/pure"
mkdir -p "$DOTFILES/zsh"
clone_or_update "$DOTFILES/zsh/pure" https://github.com/sindresorhus/pure.git
