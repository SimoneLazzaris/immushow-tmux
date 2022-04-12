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
