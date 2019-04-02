#!/bin/sh

type="rassoc"

name="router_clients"
columns="count interface"
p1="$(arp |awk '/ether/' | wc -l && arp |awk '/ether/' | wc -l)"
points="$p1"
./todb.sh "$name" "$columns" "$points" "$type"
