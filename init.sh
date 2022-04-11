#!/bin/bash
while ! nc -z 127.0.0.1 3322; do sleep 0.5; done
export IMMUCLIENT_PASSWORD=immudb
export IMMUCLIENT_USERNAME=immudb
./immuclient login
./immuclient use defaultdb
./immuclient exec create "table operations(id integer, op varchar, amount integer, primary key id)"

