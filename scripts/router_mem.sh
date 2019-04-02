#!/bin/sh

type="rmem"

name="router_mem"
columns="used_kb free_kb"
points=`free | awk '/Mem/ {print $3,$4}' | sed 's/K//g'`
./todb.sh "$name" "$columns" "$points" "$type"
