#!/bin/bash
set -ex

. $DOTFILES/_functions.sh
. $DOTFILES/system/functions.zsh

# gum: https://github.com/charmbracelet/gum
echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum

info "Installing system packages"
APT_PACKAGES='wget curl guake zsh emacs aptitude lxc xclip tmux meld git python3-pip python3-setuptools python3-streamlink python-is-python3 vim tree'
sudo apt-get install -y $APT_PACKAGES

# info "Installing protonvpn"
# PROTONVPN_VERSION=1.0.3-2
# TMPFILE=$(mktemp)
# TMPDIR=$(mktemp -d)
# wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_${PROTONVPN_VERSION}_all.deb -O $TMPFILE
# sudo dpkg -i $TMPFILE && sudo apt update
# sudo apt-get install -y proton-vpn-gnome-desktop

info "Adding user $USER to sudoers without password"
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER

# Keychain: https://www.funtoo.org/Funtoo:Keychain
# here so ssh is set up before trying to use github etc
sudo apt install -y keychain
ssh-keys-setup true
