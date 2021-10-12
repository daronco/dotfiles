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
