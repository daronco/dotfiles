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
echo "--------------------------------------------------------------------------------"
echo " WARNING: this will override:"
echo "          ~/.gitconfig"
echo "          ~/.gemrc"
echo "          ~/.bash_aliases"
echo "          ~/.emacs"
echo "          ~/.emacs.d/"
echo "--------------------------------------------------------------------------------"
echo

if [ $FORCE_YES ]; then
    REPLY=y
else
    read -p "Proceed (y/N)?"
fi

if [[ $REPLY == [yY] ]]; then
  git submodule init
  git submodule update

  ln -sfv $PWD/.gitconfig ~/.gitconfig
  ln -sfv $PWD/.gemrc ~/.gemrc
  ln -sfv $PWD/.bash_aliases ~/.bash_aliases
  ln -sfv $PWD/emacsOnRails/.emacs ~/.emacs
  rm -rf ~/.emacs.d && ln -sfv $PWD/emacsOnRails/.emacs.d ~/.emacs.d
fi
