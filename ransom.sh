#!/bin/bash

# Copyright 2022 CodeNotary, Inc. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 	http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

source env.sh
for i in `seq 0 10`
do
OP=`openssl rand -base64 12`
Q="upsert into operations(id, op, amount) values($i, '$OP', 0)"
echo -e "::> \033[31m$Q\033[0m"
$IMMUCLIENT exec "$Q"
sleep 0.5
done
TX=`$IMMUCLIENT status |grep txID|cut -d : -f 2|tr -d ' \t'`
echo "Current transaction $TX"
GOOD=`cat /tmp/lastknown`
echo "Last known good: $GOOD"
