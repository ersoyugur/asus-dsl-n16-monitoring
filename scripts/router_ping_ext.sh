#!/bin/sh

name="router_ping_ext"
columns="dst ms"

type="pingo"

pingdest="www.google.com"
p1="$pingdest"
p2=`ping -c 1 -W 1 $pingdest | grep 'seq=' | sed 's/.*time=\([0-9]*\.[0-9]*\).*$/\1/'`
points="$p1 $p2"
./todb.sh "$name" "$columns" "$points" "$type"

pingdest="www.dn.se"
p1="$pingdest"
p2=`ping -c 1 -W 1 $pingdest | grep 'seq=' | sed 's/.*time=\([0-9]*\.[0-9]*\).*$/\1/'`
points="$p1 $p2"
./todb.sh "$name" "$columns" "$points" "$type"
