do-update-kubeconfig () {
    readonly ctx=${1:?"The cluster must be specified."}

    TMPFILE=$(mktemp)
    BKFILE=~/.kube/bk/$ctx.yaml
    KUBECONFIG=~/.kube/config

    print_info "Downloading kubeconfig for $ctx"
    if doctl kubernetes cluster kubeconfig show $ctx > $TMPFILE
    then
        TOKEN=$(grep -o -E "token:.*" $TMPFILE | cut -d ' ' -f2)
        USER=$(grep "users:" $TMPFILE -A 1 | tail -1 | sed 's/.*name: //g')
        print_success "Downloaded to $TMPFILE"

        print_info "Backing up $KUBECONFIG on $BKFILE"
        cat $KUBECONFIG > $BKFILE

        print_info "Setting new token for user '$USER' on $KUBECONFIG"
        sed -e "/$USER/ { n; n; s/token:.*/token: $TOKEN/; }" -i ~/.kube/config
        print_success "All done!"
    else
        print_fail "Something wrong happened"
    fi
}

# kubectl exec -- rails console
ke-rc () {
    # readonly pod=${1:?"The pod must be specified."}
    pod=${1}

    if [[ -z "${pod// }" ]]; then
        pod=$(kubectl get pods -oname | grep -E "^pod/elos-portal-[a-f0-9]{8,}-" | tail -1)
        if [[ -z "${pod// }" ]]; then
            pod=$(kubectl get pods -oname | grep -E "^pod/portal-[a-f0-9]{8,}-" | tail -1)
        fi
    fi

    if [[ -z "${pod// }" ]]; then
        echo "No pod found..."
    else
        echo "Running rails console on $pod"
        kubectl exec -ti $pod -c portal -- bin/rails c
    fi
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

km-delete () {
    kustomize build .
    echo "\nDelete all from kustomize. Proceed?"
    if confirm
    then
        kustomize build . | kubectl delete -f -
    fi
}

# kubectl exec -- bash
ke-bash () {
    # readonly pod=${1:?"The pod must be specified."}
    pod=${1}

    container=${2} # optional

    # if [[ -z "${pod// }" ]]; then
    #     pod=$(kubectl get pods -oname | grep -E "^pod/elos-portal-[a-f0-9]{8,}-" | head -1)
    #     if [[ -z "${pod// }" ]]; then
    #         pod=$(kubectl get pods -oname | grep -E "^pod/portal-[a-f0-9]{8,}-" | head -1)
    #     fi
    # fi

    # if [[ -z "${pod// }" ]]; then
    #     echo "No pod found..."
    # else
    #     echo "Running rails console on $pod"
    #     kubectl exec -ti $pod -c portal -- bin/rails c
    # fi
}

k-bk-elos-site-wp () {
    # readonly pod=${1:?"The pod must be specified."}
    pod=${1}

    if [[ -z "${pod// }" ]]; then
        pod=$(kubectl get pods -oname -n app-portal | grep -E "^pod/elos-site-wp-[a-f0-9]{8,}-" | head -1)
    fi

    if [[ -z "${pod// }" ]]; then
        echo "No pod found..."
    else
        pod=${pod//pod\//}
        target="~/Mconf/Backups/wp-content-prd-`date +%F-%s`"
        echo "Copying from $pod to $target"
        kubectl cp --retries=5 -n app-portal -c wordpress $pod:/bitnami/wordpress/wp-content $target
    fi
}

st () {
    app=${1}
    if [[ -n "${app// }" ]]; then
        if [[ "$app" == "portal" ]]; then
            cmd="stern -t portal -c portal --since 1m -n app-portal"
        elif [[ "$app" == "proxy" || "$app" == "api-proxy" ]]; then
            cmd="stern -t proxy -n app-api --since 1m -e '/metrics'"
        elif [[ "$app" == "api-data" ]]; then
            cmd="stern -t api-data -n app-api-data -c app --since 1m -e '/metrics'"
        else
            cmd="stern $@"
        fi
    else
        cmd="stern $@"
    fi
    echo "$cmd"
    eval "$cmd"
}
