#!/bin/bash

while /bin/true
do
clear
R=$(echo insert ransom travel quit|tr ' ' '\n'|smenu -c)
case $R in
"insert")
  tmux selectp -t 2 \; send-keys './insert.sh' C-m 
  ;;
"ransom")
  tmux selectp -t 2 \; send-keys './ransom.sh' C-m 
  ;;
"travel")
  tmux selectp -t 3 \; send-keys C-c './rewatch.sh' C-m 
  ;;
"quit")
  exit 0
  ;;
esac
tmux selectp -t 0
done
