#!/bin/bash

#   ./install.sh
#   ./install.sh [--yes|-y]

while [ $# -gt 0 ]; do
    if [ "$1" = "--yes" -o "$1" = "-y" ]; then
        FORCE_YES=1
        shift
        continue
    fi
done

echo
echo "-------------------------------------------------------------------------"
echo " WARNING: this will override:"
echo "          ~/.gitconfig"
echo "          ~/.gemrc"
echo "          ~/.bash_aliases"
echo "          ~/.bashrc"
echo "          ~/.profile"
echo "          ~/.emacs"
echo "          ~/.emacs.d/"
echo "          ~/.config/beets"
echo "          ~/.vagrant.d/scripts/"
echo "          ~/.tmux.conf"
echo "          ~/.gconf/apps/guake/"
echo "-------------------------------------------------------------------------"
echo

if [ $FORCE_YES ]; then
    REPLY=y
else
    read -p "Proceed (y/N)?"
fi

PRELUDE_INSTALL_DIR="$HOME/.emacs.d"
install_prelude () {
  rm -rf $PRELUDE_INSTALL_DIR
  curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh
}

OHMYZSH_INSTALL_DIR="$HOME/.oh-my-zsh"
OHMYZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
OHMYZSH_THEMES_DIR="$HOME/.oh-my-zsh/custom/themes"
install_on_my_zsh () {
    rm -rf $OHMYZSH_INSTALL_DIR
    wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
}
install_on_my_zsh_plugins () {
    mkdir -p $OHMYZSH_PLUGINS_DIR
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $OHMYZSH_PLUGINS_DIR/zsh-syntax-highlighting
}


if [[ $REPLY == [yY] ]]; then

  # default packages
  sudo pip install --upgrade pip
  sudo pip install --upgrade livestreamer
  sudo apt-get install -y wget curl guake

  # bash, git, etc
  ln -sfv $PWD/.gitconfig ~/.gitconfig
  ln -sfv $PWD/.gemrc ~/.gemrc
  ln -sfv $PWD/.bashrc ~/.bashrc
  ln -sfv $PWD/.profile ~/.profile
  ln -sfv $PWD/ssh_config ~/.ssh/config

  # emacs
  install_prelude
  rm -rf ~/.emacs.d/personal && ln -sfv $PWD/prelude-personal/personal ~/.emacs.d/personal
  rm -rf ~/.emacs.d/themes && ln -sfv $PWD/prelude-personal/themes ~/.emacs.d/themes

  # zsh
  install_on_my_zsh
  install_on_my_zsh_plugins
  ln -sfv $PWD/.zshrc ~/.zshrc
  ln -sfv $PWD/.aliases.zsh ~/.aliases.zsh
  ln -sfv $PWD/.functions.zsh ~/.functions.zsh
  # zsh themes
  ln -sfv $PWD/zsh/themes $OHMYZSH_THEMES_DIR

  # vagrant
  mkdir -p ~/.vagrant.d/
  rm -rf ~/.vagrant.d/scripts
  rm -rf ~/.vagrant.d/Vagrantfile
  ln -sfv $PWD/vagrant/scripts ~/.vagrant.d/scripts
  ln -sfv $PWD/vagrant/Vagrantfile ~/.vagrant.d/Vagrantfile

  # beets
  sudo apt-get install python-pip
  rm -rf ~/.config/beets
  mkdir -p ~/.config
  ln -sfv $PWD/beets/config ~/.config/beets

  # tmux
  ln -sfv $PWD/.tmux.conf ~/.tmux.conf

  # guake
  mkdir ~/.gconf/apps/
  rm -rf ~/.gconf/apps/guake
  ln -sfv $PWD/guake/gconf ~/.gconf/apps/guake

fi
