. $DOTFILES/_functions.sh

sudo apt install python3-pip -y #skip this step if pip is already installed

# pipx: https://github.com/pypa/pipx
# for issues of pipx on ubuntu see https://github.com/pypa/pipx/issues/1481
sudo apt install pipx -y
~/.local/bin/pipx ensurepath
