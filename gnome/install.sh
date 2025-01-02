#!/bin/bash
set -ex

. $DOTFILES/_functions.sh

info "Setting keyboard keys to resize and move windows"
# https://askubuntu.com/questions/1336681/how-to-set-altmouse-drag-to-move-the-window-and-ctrlmouse-to-resize-the-window
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
