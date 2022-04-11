#!/bin/bash
while ! nc -z 127.0.0.1 3322; do sleep 0.5; done
watch -d -t -n 0.5 "./immuclient query 'select * from operations before tx 14'"

