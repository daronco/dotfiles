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

# stern: k8s logs
# https://github.com/wercker/stern
STERN_VERSION=1.11.0
TMPFILE=$(mktemp)
DESTINATION=/usr/local/bin/stern
info "Installing stern ${STERN_VERSION} at ${DESTINATION}"
curl -Lo $TMPFILE "https://github.com/wercker/stern/releases/download/${STERN_VERSION}/stern_linux_amd64"
sudo install -o root -g root -m 0755 $TMPFILE $DESTINATION

# kustomize
KUSTOMIZE_VERSION=4.5.5
TMPFILE=$(mktemp)
TMPDIR=$(mktemp -d)
DESTINATION=/usr/local/bin/kustomize
info "Installing kustomize v${KUSTOMIZE_VERSION} at ${DESTINATION}"
curl -Lo $TMPFILE "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz"
tar -xvf $TMPFILE -C $TMPDIR
sudo install -o root -g root -m 0755 $TMPDIR/kustomize $DESTINATION

# TODO:
# curl -s https://fluxcd.io/install.sh | sudo bash
# completions
# echo "${fpath// /\n}" | grep -i completion
# flux completion zsh > _flux
# mv _flux ~/.oh-my-zsh/completions  # oh-my-zsh

# not really for k8s, but...
# https://rclone.org/install/
info "Installing rclone"
curl https://rclone.org/install.sh | sudo bash
