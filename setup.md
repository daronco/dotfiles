# Setting up a new system

Applications, configs, dotfiles, etc.


# Ubuntu

Current version: 13.10

## Basic

Basic:

```bash
sudo apt-get install build-essential curl aptitude yakuake gnome-shell zsh git git-gui meld xclip
```

Extra:

```bash
sudo apt-get install lm-sensors gnome-tweak-tool
```

SSH keys:

```bash
ssh-keygen  # just to create ~/.ssh

# copy the old keys to ~/.ssh/id_rsa and ~/.ssh/id_rsa.pub

ssh-add ~/.ssh/id_rsa
ssh-add -l # check it
```

Start using zsh: Yakuake -> Edit current profile -> General -> Command: `/bin/zsh`

Open a new terminal window and:

```bash
git clone git@github.com:daronco/terminal-stuff.git
cd terminal-stuff
git submodule init
git submodule update
./install.sh
```

Install emacs24 (more at [https://launchpad.net/~cassou/+archive/emacs](https://launchpad.net/~cassou/+archive/emacs)):

```bash
sudo add-apt-repository ppa:cassou/emacs
sudo apt-get update
sudo apt-get install emacs24 emacs24-el emacs24-common-non-dfsg
```


## More

* Install nvm from https://github.com/creationix/nvm
* Install rbenv from https://github.com/sstephenson/rbenv (paths are already set in the dotfiles, skip it)
  * Install ruby-build from https://github.com/sstephenson/ruby-build


# Configurations

## Firefox

Preferences:

* Firefox -> Edit -> Preferences -> Downloads -> Always ask me where to save files
* Firefox -> Tools -> Set Up Sync...

Plugins:

* Session Manager: https://addons.mozilla.org/en-US/firefox/addon/session-manager/


## Gnome

Extensions ([https://extensions.gnome.org/](https://extensions.gnome.org/)):

* User Themes: https://extensions.gnome.org/extension/19/user-themes/
* AlternateTab: https://extensions.gnome.org/extension/15/alternatetab/
* Alternative Status Menu: https://extensions.gnome.org/extension/5/alternative-status-menu/
* Native Window Placement: https://extensions.gnome.org/extension/18/native-window-placement/
* Caffeine: https://extensions.gnome.org/extension/517/caffeine/
* Impatience: https://extensions.gnome.org/extension/277/impatience/
* TaskBar: https://extensions.gnome.org/extension/584/taskbar/ (have to configure it a bit)
* Status Area Horizontal Spacing: https://extensions.gnome.org/extension/355/status-area-horizontal-spacing/
* Sensors: https://extensions.gnome.org/extension/82/cpu-temperature-indicator/
* NetSpeed: https://extensions.gnome.org/extension/104/netspeed/
* Frippery Move Clock: https://extensions.gnome.org/extension/2/move-clock/
* Workspace Gird: https://extensions.gnome.org/extension/484/workspace-grid/

Themes ([http://gnome-look.org/?xcontentmode=191](http://gnome-look.org/?xcontentmode=191) and [http://gnome-look.org/index.php?xcontentmode=167](http://gnome-look.org/index.php?xcontentmode=167)):

Extract them to `/usr/share/themes/` (on `~/.themes` won't be able to pick them for window theme).

For our custom theme:

```bash
sudo cp -r gnome-shell/Daronco /usr/share/themes/
```

* Adwaita-x-dark: http://gnome-look.org/content/show.php?content=150905
* Mediterranean: http://gnome-look.org/content/show.php/MediterraneanNight+Series?content=156782
* Faience: http://gnome-look.org/content/show.php/Faience?content=144815


Configurations:

* Gnome Tweak -> Theme -> Current theme: Adwaita-X-dark
* Gnome Tweak -> Theme -> Gtk+ theme: Adwaita-X-dark | MediterraneanNightDarkest
* Gnome Tweak -> Theme -> Shell theme: Daronco
* Gnome Tweak -> Theme -> Icon theme: Oxygen
* Gnome Tweak -> Shell -> Show date in clock
* Gnome Tweak -> Shell -> Arrangement of buttons -> All


## Yakuake

```bash
cd terminal-stuff
mkdir -p ~/.kde/share/apps/konsole/
cp konsole/* ~/.kde/share/apps/konsole/
```

Kill yakuake, start it again.

Preferences:

* Edit current profile -> Appearance -> Color scheme: `Zenburn-daronco`
* Configure Yakuake -> Tab Bar: Show title bar contents in tab labels
* Configure Yakuake -> Size and Animation: whatever...
* Configure Yakuake -> Size and Animation: whatever...
* Configure Yakuake -> Appearance -> General -> Highlight terminals when moving focus between them
* Configure Yakuake -> Appearance -> Window Background -> Use translucency: 80%
* Edit Current Profile -> Scrolling -> Fixed size scrollback: 50000 lines

## Other

* No password sudo:

  ```bash
  sudo visudo
  # add
  daronco ALL=(ALL) NOPASSWD: ALL
  ```
