#!/bin/bash

. $DOTFILES/_functions.sh

# https://code.visualstudio.com/docs/setup/linux
info "Installing vscode"
sudo snap install --classic code

# https://download.ngrok.com/linux
info "Installing ngrok"
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update \
  && sudo apt install ngrok

# DigitalOcean
info "Installing doctl"
sudo snap install doctl

# rbenv
info "Installing rbenv"
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
