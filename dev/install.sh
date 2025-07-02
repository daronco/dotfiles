#!/bin/bash

. $DOTFILES/_functions.sh

# rbenv
info "Installing rbenv"
if [ -d "$HOME/.rbenv" ]; then
  info "~/.rbenv exists, pulling latest changes"
  git -C "$HOME/.rbenv" fetch --all
  git -C "$HOME/.rbenv" reset --hard origin/master
else
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
fi
if [ -d "$HOME/.rbenv/plugins/ruby-build" ]; then
  info "~/.rbenv/plugins/ruby-build exists, pulling latest changes"
  git -C "$HOME/.rbenv/plugins/ruby-build" fetch --all
  git -C "$HOME/.rbenv/plugins/ruby-build" reset --hard origin/master
else
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi
# dependencies for ruby builds
info "Installing dependencies for ruby builds"
sudo apt install curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential \
                 libyaml-dev libffi-dev libgdbm-dev libmysqlclient-dev -y

# python
info "Installing python packages"
sudo apt install python3-pip -y #skip this step if pip is already installed
# pipx: https://github.com/pypa/pipx
# for issues of pipx on ubuntu see https://github.com/pypa/pipx/issues/1481
sudo apt install pipx -y
~/.local/bin/pipx ensurepath

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

# Fly.io: https://fly.io/docs/flyctl/install/
curl -L https://fly.io/install.sh | sh
