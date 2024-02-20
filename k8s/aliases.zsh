# TODO see https://github.com/Dbz/kube-aliases

alias k="kubectl"
alias k21="kubectl-1.21.14"
alias kg="kubectl get"
alias kl="kubectl logs"
alias kd="kubectl describe"
alias klf="kubectl logs -f"
alias ke="kubectl exec -ti"
alias kctx="kubectx"
alias kns="kubens"
alias klf-ing="stern nginx -n ingress-nginx -e query_range -e health -e thanos -e mini-profiler -e query_exemplars -e grafana"
# alias klf-ing="klf -l app.kubernetes.io/name=ingress-nginx -n ingress-nginx --max-log-requests=20 | grep -v -e query_range -e health -e thanos -e mini-profiler -e query_exemplars -e grafana"
alias k-roll="kubectl rollout restart deployment"


alias kust="kustomize"
alias kust-diff="kustomize build . | kubectl diff -f - || true"
alias kust-apply="kustomize build . | kubectl apply -f -"
alias kust21-diff="kustomize build . | kubectl-1.21.14 diff -f - || true"
alias kust21-apply="kustomize build . | kubectl-1.21.14 apply -f -"
alias km="kustomize"
alias km-diff="kustomize build . | kubectl diff -f - || true"
alias km-apply="kustomize build . | kubectl apply -f -"
alias km21-diff="kustomize build . | kubectl-1.21.14 diff -f - || true"
alias km21-apply="kustomize build . | kubectl-1.21.14 apply -f -"

alias k-nod-full="kubectl get nodes -owide --show-labels"
alias k-nod-pod="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name"
alias k-nod-top="kubectl describe nodes | grep 'Name:\|  cpu\|  memory'"
alias k-nod-label="kubectl get nodes --show-labels"
alias k-nod-all="kubectl get nodes -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints,LABELS:.metadata.labels --no-headers"
alias k-pod-res="kubectl get pods -A -o custom-columns=\"PODS:.metadata.name,NAMESPACE:.metadata.namespace,REQUEST_CPU:.spec.containers[*].resources.requests.cpu,REQUEST_MEM:.spec.containers[*].resources.requests.memory,LIMITS_CPU:.spec.containers[*].resources.limits.cpu,LIMITS_MEM:.spec.containers[*].resources.limits.memory\""

# alias kc-once="kubectl run -it --rm alpine --image=alpine:3.6 --restart=Never"
# alias kc-once="kubectl run -it --rm alpine-$(openssl rand -hex ${1:-3}) --image=alpine:3.6 --restart=Never"
alias k-once="kubectl run -it --rm tmp-alpine-`openssl rand -hex 3` --image=alpine:3.6 --restart=Never"
alias k-once-curl="kubectl run -it --rm tmp-alpine-`openssl rand -hex 3` --image=alpine:3.6 --restart=Never -- /bin/sh -c 'apk update; apk add curl; sh; exit 0'"
alias k-once-rb="kubectl run -it --rm tmp-ruby-`openssl rand -hex 3` --image=ruby:3 --restart=Never -- bash"

# kube-ps1
alias kon="kubeon -g"
alias koff="kubeoff -g"

alias flf="flux logs -f"
