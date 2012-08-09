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
echo "          ~/.emacs"
echo "          ~/.emacs.d/"
echo "-------------------------------------------------------------------------"
echo

if [ $FORCE_YES ]; then
    REPLY=y
else
    read -p "Proceed (y/N)?"
fi

PRELUDE_INSTALL_DIR="$HOME/.emacs.d"
install_prelude () {
  if [ -d $PRELUDE_INSTALL_DIR/prelude ] # If prelude is already installed
  then
    OLD_PWD=$PWD
    cd $PRELUDE_INSTALL_DIR; git pull origin master; cd $OLD_PWD;
  else
    rm -rf $PRELUDE_INSTALL_DIR
    curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh
  fi
}

if [[ $REPLY == [yY] ]]; then
  git submodule init
  git submodule update

  install_prelude

  ln -sfv $PWD/.gitconfig ~/.gitconfig
  ln -sfv $PWD/.gemrc ~/.gemrc
  ln -sfv $PWD/.bash_aliases ~/.bash_aliases
  #ln -sfv $PWD/.emacs ~/.emacs
  rm -rf ~/.emacs.d/personal && ln -sfv $PWD/prelude-personal/personal ~/.emacs.d/personal
fi

echo "-------------------------------------------------------------------------"
echo " NOTE: ~/.bashrc was NOT edited. Do it manually."
echo "-------------------------------------------------------------------------"
