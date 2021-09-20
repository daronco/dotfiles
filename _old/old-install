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

if [[ $REPLY == [yY] ]]; then

  # emacs
  install_spacemacs
  ln -sfv $PWD/.spacemacs ~/.spacemacs

  # guake
  mkdir ~/.gconf/apps/
  rm -rf ~/.gconf/apps/guake
  ln -sfv $PWD/guake/gconf ~/.gconf/apps/guake

  # TODO: rbenv
fi
