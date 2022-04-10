#!/bin/sh
for i in `seq 0 10`
do
OP=`openssl rand -base64 12`
Q="upsert into operations(id, op, amount) values($i, '$OP', 0)"
echo -e "::> \033[31m$Q\033[0m"
./immuclient exec "$Q"
sleep 0.5
done
TX=`./immuclient status |grep txID|cut -d : -f 2|tr -d ' \t'`
echo "Current transaction $TX"
GOOD=`cat /tmp/lastknown`
echo "Last known good: $GOOD"
