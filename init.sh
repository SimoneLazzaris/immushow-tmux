#!/bin/bash
source env.sh
while ! nc -z 127.0.0.1 3322; do sleep 0.5; done
export IMMUCLIENT_PASSWORD=immudb
export IMMUCLIENT_USERNAME=immudb
$IMMUCLIENT login
$IMMUCLIENT use defaultdb
$IMMUCLIENT exec create "table operations(id integer, op varchar, amount integer, primary key id)"

