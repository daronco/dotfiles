. $DOTFILES/_functions.sh

info "Installing system packages"
APT_PACKAGES='wget curl guake zsh emacs aptitude lxc xclip tmux meld git'
sudo apt-get install -y $APT_PACKAGES

sudo pip install --upgrade setuptools pip
if ! command -v pip3 &> /dev/null
then
    sudo pip install --upgrade streamlink
else
    sudo pip3 install --upgrade streamlink
fi
