#!/bin/bash

. $DOTFILES/_functions.sh

info "Installing ruby packages"
APT_PACKAGES='rbenv'
sudo apt-get install -y $APT_PACKAGES
