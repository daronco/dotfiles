#!/bin/bash

APT_PACKAGES='wget curl guake zsh emacs aptitude lxc xclip tmux meld'

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
echo "          ~/.tmux.conf"
echo "          ~/.gconf/apps/guake/"
echo "-------------------------------------------------------------------------"
echo

if [ $FORCE_YES ]; then
    REPLY=y
else
    read -p "Proceed (y/N)?"
fi

SPACEMACS_INSTALL_DIR="$HOME/.emacs.d"
install_spacemacs () {
    rm -rf $SPACEMACS_INSTALL_DIR
    git clone https://github.com/syl20bnr/spacemacs $SPACEMACS_INSTALL_DIR
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
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $OHMYZSH_PLUGINS_DIR/zsh-syntax-highlighting
}

install_tmux_plugins () {
    rm -rf $PWD/tmux/tmux-yank
    git clone https://github.com/tmux-plugins/tmux-yank.git $PWD/tmux/tmux-yank
}

if [[ $REPLY == [yY] ]]; then

  # default packages
  sudo apt-get install -y $APT_PACKAGES
  sudo pip install --upgrade pip
  sudo pip install --upgrade livestreamer

  # bash, git, etc
  ln -sfv $PWD/.gitconfig ~/.gitconfig
  ln -sfv $PWD/.gemrc ~/.gemrc
  ln -sfv $PWD/.bashrc ~/.bashrc
  ln -sfv $PWD/.profile ~/.profile
  ln -sfv $PWD/ssh_config ~/.ssh/config

  # emacs
  install_spacemacs
  ln -sfv $PWD/.spacemacs ~/.spacemacs

  # zsh
  install_on_my_zsh
  install_on_my_zsh_plugins
  ln -sfv $PWD/.zshrc ~/.zshrc
  ln -sfv $PWD/.aliases.zsh ~/.aliases.zsh
  test -f $PWD/.aliases.zsh.local && ln -sfv $PWD/.aliases.zsh.local ~/.aliases.zsh.local
  ln -sfv $PWD/.functions.zsh ~/.functions.zsh
  # zsh themes
  ln -sfv $PWD/zsh/themes $OHMYZSH_THEMES_DIR

  # tmux
  install_tmux_plugins
  ln -sfv $PWD/.tmux.conf ~/.tmux.conf

  # guake
  mkdir ~/.gconf/apps/
  rm -rf ~/.gconf/apps/guake
  ln -sfv $PWD/guake/gconf ~/.gconf/apps/guake

  # TODO: rbenv
fi
