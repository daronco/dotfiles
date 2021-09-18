#!/bin/bash

set -xe

# [ -z "$TMUX" ] && command -v tmux > /dev/null &&
cd ~/dev &&
    tmux rename-window "*"
    tmux split-window -v &&
    tmux split-window -h &&
    tmux send-keys -t ":1.3" "cd /home/daronco/dev/shapass/shapass-vue && npm run serve" Enter
    tmux new-window -n K8S &&
    tmux new-window -n DEPLOY &&
    tmux new-window -n DEV &&
    tmux new-window -n RANDOM &&
    tmux selectw -t 1 &&
    tmux attach-session -t 0
