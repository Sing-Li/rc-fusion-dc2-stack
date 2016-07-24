#!/bin/bash
set -e
echo "server starts"

mongod  --smallfiles --noprealloc --dbpath /data/db --oplogSize 128 --replSet rs0 &
DB1_PID=$!

sleep 40
echo "make replica sets"

mongo admin  --eval "db.runCommand({ replSetInitiate: [] })"

trap 'echo "KILLING"; killall mongod; wait $DB1_PID;' SIGINT SIGTERM EXIT

wait $DB1_PID
