#!/bin/bash

rm -rf data

session="immushow"
tmux new-session -d -s $session

tmux selectp -t 0
tmux splitw -h -p 65
tmux splitw -v -p 50
tmux selectp -t 0
tmux splitw -v -p 50
tmux selectp -t 0 \; send-keys 'echo 0' C-m
tmux selectp -t 1 \; send-keys 'echo 1' C-m
tmux selectp -t 2 \; send-keys 'echo 2' C-m
tmux selectp -t 3 \; send-keys 'echo 3' C-m

# Pane layout:
# 0 2
# 1 3

tmux selectp -t 1 \; send-keys './immudb' C-m
sleep 1
tmux selectp -t 0
tmux send-keys './menu.sh' C-m
tmux selectp -t 2 \; send-keys 'sleep 3' C-m
tmux selectp -t 2 \; send-keys './immuclient login immudb' C-m 'immudb' C-m
tmux selectp -t 2 \; send-keys './immuclient use defaultdb' C-m
tmux selectp -t 2 \; send-keys './immuclient exec create "table operations(id integer, op varchar, amount integer, primary key id)"' C-m
tmux selectp -t 3 \; send-keys './watch.sh' C-m
tmux selectp -t 0
tmux attach-session -t $session
