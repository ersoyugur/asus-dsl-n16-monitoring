#!/bin/sh

nice -n -19 /bin/sh router_cpu.sh
sleep 1
nice -n -19 ./router_mem.sh
sleep 1
nice -n -19 ./router_net.sh
sleep 1
nice -n -19 ./router_ping_ext.sh
sleep 1
nice -n -19 ./router_assoclist.sh
