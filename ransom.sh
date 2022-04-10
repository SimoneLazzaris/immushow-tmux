#!/bin/sh
for i in `seq 0 10`
do
OP=`openssl rand -base64 12`
Q="upsert into operations(id, op, amount) values($i, '$OP', 0)"
echo -e "::> \033[31m$Q\033[0m"
./immuclient exec "$Q"
sleep 0.5
done
