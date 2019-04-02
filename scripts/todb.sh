#/bin/sh

dbname="mydb"
dbhost="192.168.1.99:8086"
user="root"
passwd="root"

#if [ $# -ne 4 ]; then
#    echo "Usage: $0 \"series name\" \"columns\" \"points\" \"type\""
#    exit
#fi

name="\"$1\""
columns=`echo $2 | sed 's/^\(.*\)$/"\1"/' | sed 's/ /","/g'`
points=`echo $3 | sed 's/\([a-zA-Z0-9\.]*[a-zA-Z][a-zA-Z0-9\.]*\)/"\1"/g' | sed 's/ /,/g'`
### "dst","ms", "www.google.com",27.2

if [ "$4" = "pingo" ] || [ "$4" = "rtemp" ]; then
    echo "###### Results Being Sent To Influx..."
    columnspart1="$(echo $columns | cut -d',' -f1 | sed 's/"//g')"
    columnspart2="$(echo $columns | cut -d',' -f2 | sed 's/"//g')"
    points1="$(echo $points | cut -d',' -f1 | sed 's/"//g')"
    points2="$(echo $points | cut -d',' -f2 | sed 's/"//g')"
    name="$(echo $name | sed 's/"//g')"

    payload="$name $columnspart1=\"$points1\",$columnspart2=$points2 $(date +%s)000000000"
    echo $payload
    # curl -i -XPOST 'http://localhost:8086/write?db=mydb' --data-binary "router_ping_ext,dst=google ms=62.6 ${CURDATE}000000000"
    wget --quiet --post-data "$payload" "http://$dbhost/write?db=mydb" -O /dev/null
fi

if [ "$4" = "rmem" ] || [ "$4" = "rassoc" ]; then
    echo "###### Results Being Sent To Influx..."
    columnspart1="$(echo $columns | cut -d',' -f1 | sed 's/"//g')"
    columnspart2="$(echo $columns | cut -d',' -f2 | sed 's/"//g')"
    points1="$(echo $points | cut -d',' -f1 | sed 's/"//g')"
    points2="$(echo $points | cut -d',' -f2 | sed 's/"//g')"
    name="$(echo $name | sed 's/"//g')"
    
    payload="$name $columnspart1=$points1,$columnspart2=$points2 $(date +%s)000000000"
    echo $payload
    # curl -i -XPOST 'http://localhost:8086/write?db=mydb' --data-binary "router_ping_ext,dst=google ms=62.6 ${CURDATE}000000000"
    wget --quiet --post-data "$payload" "http://$dbhost/write?db=mydb" -O /dev/null
fi

if [ "$4" = "rnet" ]; then
    c1="$(echo $columns | cut -d',' -f1 | sed 's/"//g')"
    c2="$(echo $columns | cut -d',' -f2 | sed 's/"//g')"
    c3="$(echo $columns | cut -d',' -f3 | sed 's/"//g')"
    c4="$(echo $columns | cut -d',' -f4 | sed 's/"//g')"
    c5="$(echo $columns | cut -d',' -f5 | sed 's/"//g')"
    c6="$(echo $columns | cut -d',' -f6 | sed 's/"//g')"
    c7="$(echo $columns | cut -d',' -f7 | sed 's/"//g')"
    p1="$(echo $points | cut -d',' -f1 | sed 's/"//g')"
    p2="$(echo $points | cut -d',' -f2 | sed 's/"//g')"
    p3="$(echo $points | cut -d',' -f3 | sed 's/"//g')"
    p4="$(echo $points | cut -d',' -f4 | sed 's/"//g')"
    p5="$(echo $points | cut -d',' -f5 | sed 's/"//g')"
    p6="$(echo $points | cut -d',' -f6 | sed 's/"//g')"
    p7="$(echo $points | cut -d',' -f7 | sed 's/"//g')"
    name="$(echo $name | sed 's/"//g')"
    
    payload="$name $c1=\"$p1\",$c2=$p2,$c3=$p3,$c4=$p4,$c5=$p5,$c6=$p6,$c7=$p7 $(date +%s)000000000"
    echo $payload
    wget --quiet --post-data "$payload" "http://$dbhost/write?db=mydb" -O /dev/null
fi

if [ "$4" = "rcpu" ]; then
    c1="$(echo $columns | cut -d',' -f1 | sed 's/"//g')"
    c2="$(echo $columns | cut -d',' -f2 | sed 's/"//g')"
    c3="$(echo $columns | cut -d',' -f3 | sed 's/"//g')"
    c4="$(echo $columns | cut -d',' -f4 | sed 's/"//g')"
    c5="$(echo $columns | cut -d',' -f5 | sed 's/"//g')"
    c6="$(echo $columns | cut -d',' -f6 | sed 's/"//g')"
    c7="$(echo $columns | cut -d',' -f7 | sed 's/"//g')"
    p1="$(echo $points | cut -d',' -f1 | sed 's/"//g')"
    p2="$(echo $points | cut -d',' -f2 | sed 's/"//g')"
    p3="$(echo $points | cut -d',' -f3 | sed 's/"//g')"
    p4="$(echo $points | cut -d',' -f4 | sed 's/"//g')"
    p5="$(echo $points | cut -d',' -f5 | sed 's/"//g')"
    p6="$(echo $points | cut -d',' -f6 | sed 's/"//g')"
    p7="$(echo $points | cut -d',' -f7 | sed 's/"//g')"
    name="$(echo $name | sed 's/"//g')"
    
    payload="$name $c1=$p1,$c2=$p2,$c3=$p3,$c4=$p4,$c5=$p5,$c6=$p6,$c7=$p7 $(date +%s)000000000"
    echo $payload
    wget --quiet --post-data "$payload" "http://$dbhost/write?db=mydb" -O /dev/null
fi
