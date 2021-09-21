. $DOTFILES/_functions.sh

SPACEMACS_INSTALL_DIR="$HOME/.emacs.d"

info "Installing spacemacs into $SPACEMACS_INSTALL_DIR"
clone_or_update "$SPACEMACS_INSTALL_DIR" https://github.com/syl20bnr/spacemacs
