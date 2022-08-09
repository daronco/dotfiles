. $DOTFILES/_functions.sh

# gum: https://github.com/charmbracelet/gum
echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum

info "Installing system packages"
APT_PACKAGES='wget curl guake zsh emacs aptitude lxc xclip tmux meld git'
sudo apt-get install -y $APT_PACKAGES

info "Installing python tools"
sudo pip install --upgrade setuptools pip
if ! command -v pip3 &> /dev/null
then
    sudo pip install --upgrade streamlink
else
    sudo pip3 install --upgrade streamlink
fi
