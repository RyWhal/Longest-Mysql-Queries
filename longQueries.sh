#!/bin/bash
#Author: Ryan Whalen
#This script prints out the 5 longest running queries on a MySQL Database instance
#Sleeping threads, Binlog dumps, Replication threads, and this query its self are filtered out of the results

h="localhost"
p=3306
u=

while test $# -gt 0
do
    case $1 in
        -h)
            h=$2
            shift
            ;;
        -p)
            p=$2
            shift
            ;;
        -u)
            u=$2
            shift
            ;;       
         *)
            echo >&2 "Invalid argument: $1"
            ;;
    esac
    shift
done

[ $1 =="--help" ] && { echo "Usage: $0 -h HOSTNAME -p PORT -u USERNAME"; exit 1; }


query="SELECT * FROM INFORMATION_SCHEMA.PROCESSLIST Where Command NOT IN ('Sleep', 'Binlog Dump', 'Connect') AND ID <> CONNECTION_ID() ORDER BY Time LIMIT 5"


mysql -p -h"$h"  -P"$p" -u"$u" -e "$query"
