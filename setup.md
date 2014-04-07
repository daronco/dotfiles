# Setup

Things to remember...


# Ubuntu

Current version: 13.10

## Basic

Basic:

```bash
sudo apt-get install build-essential curl aptitude yakuake gnome-shell zsh git git-gui xclip emacs24
```

2nd pass:

```bash
sudo apt-get install vlc lm-sensors gnome-tweak-tool meld vim gimp libgeoip-dev
```

SSH keys:

```bash
ssh-keygen  # just to create ~/.ssh

# copy the old keys to ~/.ssh/id_rsa and ~/.ssh/id_rsa.pub

ssh-add ~/.ssh/id_rsa
ssh-add -l              # check it
ssh -vT git@github.com  # check against GitHub
```

Open a new terminal window and:


```bash
git clone git@github.com:daronco/terminal-stuff.git
cd terminal-stuff
./install.sh
```


## More

* Install nvm from https://github.com/creationix/nvm
* Install rbenv from https://github.com/sstephenson/rbenv (paths are already set in the dotfiles, skip it)
  * Install ruby-build from https://github.com/sstephenson/ruby-build


# Configurations

## Ubuntu

* Appearance -> Look -> Launcher icon size: 40
* Appearance -> Behavior -> Auto-hide the Launcher
* Appearance -> Behavior -> Enable workspaces

## Ubuntu-Tweak

```bash
sudo add-apt-repository ppa:tualatrix/ppa
sudo apt-get update
sudo apt-get install ubuntu-tweak
```

* Ubuntu Tweak -> Tweaks -> Fonts: -1 for each
* Ubuntu Tweak -> Tweaks -> Window -> Window control button position: Left
* Ubuntu Tweak -> Tweaks -> Window -> "Close" button only: off


## Firefox

Preferences:

* Firefox -> Edit -> Preferences -> Downloads -> Always ask me where to save files
* Firefox -> Tools -> Set Up Sync...

Plugins:

* Session Manager: https://addons.mozilla.org/en-US/firefox/addon/session-manager/

## Chrome

Settings -> Appearance -> Use system title bars and borders

## Gnome

Extensions ([https://extensions.gnome.org/](https://extensions.gnome.org/)):

* Advanced Volume Mixer: https://extensions.gnome.org/extension/212/advanced-volume-mixer/
* AlternateTab: https://extensions.gnome.org/extension/15/alternatetab/
* Alternative Status Menu: https://extensions.gnome.org/extension/5/alternative-status-menu/
* Avoid Overview: https://extensions.gnome.org/extension/586/avoid-overview/
* Brightness Control: https://extensions.gnome.org/extension/231/brightness-control/
* Caffeine: https://extensions.gnome.org/extension/517/caffeine/
* Dash to Dock: https://extensions.gnome.org/extension/307/dash-to-dock/
* Frippery Move Clock: https://extensions.gnome.org/extension/2/move-clock/
* Headphone Event: https://extensions.gnome.org/extension/316/headphone-indicator/
* Impatience: https://extensions.gnome.org/extension/277/impatience/
* Lock Screen: https://extensions.gnome.org/extension/715/lock-screen/
* Message Notifier: https://extensions.gnome.org/extension/150/message-notifier/
* Minimized Window Reminder: https://extensions.gnome.org/extension/403/minimized-window-reminder/
* Native Window Placement: https://extensions.gnome.org/extension/18/native-window-placement/
* NetSpeed: https://extensions.gnome.org/extension/104/netspeed/
* No Topleft Hot Corner: https://extensions.gnome.org/extension/118/no-topleft-hot-corner/
* Panel OSD: https://extensions.gnome.org/extension/708/panel-osd/
* Places Status Indicator: https://extensions.gnome.org/extension/8/places-status-indicator/
* Put Windows: https://extensions.gnome.org/extension/39/put-windows/
* Remove Accessibility: https://extensions.gnome.org/extension/112/remove-accesibility/
* Remove Rounded Corners: https://extensions.gnome.org/extension/448/remove-rounded-corners/
* Sensors: https://extensions.gnome.org/extension/82/cpu-temperature-indicator/
* shellshape: https://extensions.gnome.org/extension/294/shellshape/
* Status Area Horizontal Spacing: https://extensions.gnome.org/extension/355/status-area-horizontal-spacing/
* TaskBar: https://extensions.gnome.org/extension/584/taskbar/ (have to configure it a bit)
* Text Translator: https://extensions.gnome.org/extension/593/text-translator/
* Top Icons: https://extensions.gnome.org/extension/495/topicons/
* User Themes: https://extensions.gnome.org/extension/19/user-themes/
* WindowOverlay Icons: https://extensions.gnome.org/extension/302/windowoverlay-icons/
* Workspace Grid: https://extensions.gnome.org/extension/484/workspace-grid/ (configure it to 2x2)

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

```bash
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-X-dark
gsettings set org.gnome.desktop.wm.preferences theme Adwaita-X-dark
```

* Gnome Tweak -> Theme -> Current theme: Adwaita-X-dark
* Gnome Tweak -> Theme -> Gtk+ theme: Adwaita-X-dark | MediterraneanNightDarkest
* Gnome Tweak -> Theme -> Shell theme: Daronco
* Gnome Tweak -> Theme -> Icon theme: Oxygen
* Gnome Tweak -> Shell -> Show date in clock


## Yakuake

```bash
cd terminal-stuff
mkdir -p ~/.kde/share/apps/konsole/
cp konsole/* ~/.kde/share/apps/konsole/
```

Kill yakuake, start it again.

Preferences:

* Startup Applications: Add an entry `yakuake`
* Edit Current Profile -> General -> Command: `/bin/zsh`
* Edit Current Profile -> Appearance -> Color scheme: `zzenburn`
* Edit Current Profile -> Scrolling -> Fixed size scrollback: 50000 lines
* Configure Yakuake -> Tab Bar: Show title bar contents in tab labels
* Configure Yakuake -> Size and Animation: whatever...
* Configure Yakuake -> Appearance -> General -> Highlight terminals when moving focus between them
* Configure Yakuake -> Appearance -> Window Background -> Use translucency: 80%

## Hardware Sensors Indicator

```bash
sudo add-apt-repository ppa:alexmurray/indicator-sensors
sudo apt-get update && sudo apt-get install indicator-sensors
```

* Startup Applications: Add an entry `indicator-sensors`

## Other

* No password sudo:

  ```bash
  sudo visudo
  # add
  daronco ALL=(ALL) NOPASSWD: ALL
  ```
