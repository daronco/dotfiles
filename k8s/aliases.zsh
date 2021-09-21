alias kc="kubectl"
alias k="kubectl"
alias kg="kubectl get"
alias kl="kubectl logs"
alias klf="kubectl logs -f"
alias kctx="kubectx"
alias kns="kubens"
alias k-nod-full="kubectl get nodes -owide --show-labels"
alias k-nod-pod="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name"
alias k-nod-top="kubectl describe nodes | grep 'Name:\|  cpu\|  memory'"
# alias kc-once="kubectl run -it --rm alpine --image=alpine:3.6 --restart=Never"
# alias kc-once="kubectl run -it --rm alpine-$(openssl rand -hex ${1:-3}) --image=alpine:3.6 --restart=Never"
alias k-once="kubectl run -it --rm alpine-`openssl rand -hex 3` --image=alpine:3.6 --restart=Never"
