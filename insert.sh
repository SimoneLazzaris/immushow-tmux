#!/bin/bash
for i in `seq 0 10`
do
OPS=("CASH" "PAYPAL" "CREDITCARD" "DEBITCARD")
rand=$[ $RANDOM % 4 ]
OP=${OPS[$rand]}
Q="insert into operations(id, op, amount) values($i, '$OP', $RANDOM)"
echo -e "::> \033[32m$Q\033[0m"
./immuclient exec "$Q"
sleep 0.5
done
