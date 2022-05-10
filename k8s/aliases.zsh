alias kc="kubectl"
alias k="kubectl"
alias kg="kubectl get"
alias kl="kubectl logs"
alias kd="kubectl describe"
alias klf="kubectl logs -f"
alias ke="kubectl exec -ti"
alias kctx="kubectx"
alias kns="kubens"
alias kust="kustomize"
alias klf-ing="klf -l app.kubernetes.io/name=ingress-nginx -n ingress-nginx  | grep -v -e query_range -e health -e thanos -e mini-profiler -e query_exemplars -e grafana"

alias k-nod-full="kubectl get nodes -owide --show-labels"
alias k-nod-pod="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name"
alias k-nod-top="kubectl describe nodes | grep 'Name:\|  cpu\|  memory'"
alias k-nod-label="kubectl get nodes --show-labels"
# alias kc-once="kubectl run -it --rm alpine --image=alpine:3.6 --restart=Never"
# alias kc-once="kubectl run -it --rm alpine-$(openssl rand -hex ${1:-3}) --image=alpine:3.6 --restart=Never"
alias k-once="kubectl run -it --rm alpine-`openssl rand -hex 3` --image=alpine:3.6 --restart=Never"

alias flf="flux logs -f"
