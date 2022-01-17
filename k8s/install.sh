. $DOTFILES/_functions.sh

KUBECTL_VERSION=1.21.5
TMPFILE=$(mktemp)
info "Installing kubectl ${KUBECTL_VERSION}"
curl -Lo $TMPFILE "https://dl.k8s.io/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 $TMPFILE /usr/local/bin/kubectl

info "Installing kubectx at /opt/kubectx"
sudo sh -c ". $DOTFILES/_functions.sh; clone_or_update /opt/kubectx https://github.com/ahmetb/kubectx"
sudo ln -s -f /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s -f /opt/kubectx/kubens /usr/local/bin/kubens
# zsh completions
info "Installing kubectx completions at ~/.oh-my-zsh/completions"
mkdir -p ~/.oh-my-zsh/completions
chmod -R 755 ~/.oh-my-zsh/completions
ln -s -f /opt/kubectx/completion/_kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
ln -s -f /opt/kubectx/completion/_kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh

# konfig
info "Installing konfig at /usr/local/bin/konfig"
TMPFILE=$(mktemp)
curl -Lo $TMPFILE https://github.com/corneliusweig/konfig/raw/v0.2.6/konfig \
    && chmod +x $TMPFILE \
    && sudo mv -f $TMPFILE /usr/local/bin/konfig

# TODO:
# curl -s https://fluxcd.io/install.sh | sudo bash
# completions
# echo "${fpath// /\n}" | grep -i completion
# flux completion zsh > _flux
# mv _flux ~/.oh-my-zsh/completions  # oh-my-zsh
