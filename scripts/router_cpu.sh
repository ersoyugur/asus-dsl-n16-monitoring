#!/bin/sh

type="rcpu"
name="router_cpu"
columns="usr nic sys idle io irq sirq"
points=`mpstat | awk '/all/ {print $3,$4,$5,$11,$6,$7,$8}' | sed 's/%//g'`
echo $columns
echo $points
./todb.sh "$name" "$columns" "$points" "$type"
