#!/bin/bash
source env.sh
$IMMUCLIENT query "select * from operations" before tx 14 \
  | sed 1,3d | tr -d ' ' \
  | while read LINE
do
IFS='|' read -ra FIELDS<<<$LINE
if [ -z ${FIELDS[1]} ]
then
continue
fi
ID=${FIELDS[1]}
OP=${FIELDS[2]//\"/}
AM=${FIELDS[3]}
Q="upsert into operations(id, op, amount) values($ID, '$OP', $AM)"
echo -e "::> \033[32m$Q\033[0m"
$IMMUCLIENT exec "$Q"
sleep 0.5
done
