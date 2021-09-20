. $DOTFILES/_functions.sh

info "Installing system packages"
APT_PACKAGES='wget curl guake zsh emacs aptitude lxc xclip tmux meld git'
sudo apt-get install -y $APT_PACKAGES

sudo pip install --upgrade pip
sudo pip install --upgrade streamlink
