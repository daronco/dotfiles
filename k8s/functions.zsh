do-update-kubeconfig () {
    readonly ctx=${1:?"The cluster must be specified."}

    TMP_CONFIG=~/.kube/bk/$ctx.yaml
    KUBECONFIG=~/.kube/config

    print_info "Downloading kubeconfig for $ctx"
    if doctl kubernetes cluster kubeconfig show $ctx > $TMP_CONFIG
    then
        TOKEN=$(grep -o -E "token:.*" $TMP_CONFIG | cut -d ' ' -f2)
        USER=$(grep "users:" $TMP_CONFIG -A 1 | tail -1 | sed 's/.*name: //g')
        print_success "Downloaded to $TMP_CONFIG"

        TMPFILE=$(mktemp)
        print_info "Backing up $KUBECONFIG on $TMPFILE"
        cat $KUBECONFIG > $TMPFILE

        print_info "Setting new token for user '$USER' on $KUBECONFIG"
        sed -e "/$USER/ { n; n; s/token:.*/token: $TOKEN/; }" -i ~/.kube/config
        print_success "All done!"
    else
        print_fail "Something wrong happened"
    fi
}

# kubectl exec -- rails console
ke-rc () {
    readonly pod=${1:?"The pod must be specified."}
    kubectl exec -ti $pod -c portal -- bin/rails c
}

k-delete-evicted () {
    echo "Removing evicted pods:"
    kubectl get pods | grep Evicted
    echo "Proceed?"
    if confirm
    then
        for each in $(kubectl get pods | grep Evicted | awk '{print $1}');
        do
            kubectl delete pods $each
        done
    fi
}

kind-create-default () {
    TMPFILE=$(mktemp)
    echo "Writing config to ${TMPFILE}"
    cat >> $TMPFILE << EOF
apiVersion: kind.x-k8s.io/v1alpha4
kind: Cluster
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
  - containerPort: 443
    hostPort: 443
EOF
    echo "Creating cluster..."
    kind create cluster --config $TMPFILE
    # TODO: name the cluster
    echo "Enabling ingress-nginx..."
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
}

kind-delete-default () {
    kind delete cluster
}
