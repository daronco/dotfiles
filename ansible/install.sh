. $DOTFILES/_functions.sh

info "Installing ansible"
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update && sudo apt install ansible -y
