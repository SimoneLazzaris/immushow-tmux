#!/bin/bash

while /bin/true
do
exec 3>&1

R=$(dialog  --no-cancel --no-tags --no-ok \
 --title "immudb by CodeNotary" --menu "time travel demo" 20 50 20 \
 insert "Initialize database" \
 ransom "Execute ransomware" \
 travel "Time travel - recover from ransomware" \
 "" "" \
 quit   "Exit program" \
 2>&1 1>&3)

exec 3>&-

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
  pkill -9 immudb
  tmux selectp -t 3 \; send-keys C-c   
  tmux selectp -t 2 \; send-keys C-c   
  tmux selectp -t 1 \; send-keys C-c   
  tmux selectp -t 3 \; send-keys C-d  
  tmux selectp -t 2 \; send-keys C-d  
  tmux selectp -t 1 \; send-keys C-d  
  tmux selectp -t 0 \; send-keys C-d  
  tmux detach
  tmux kill-session -t immushow
  break
  ;;
esac
tmux selectp -t 0
done
clear

