#!/bin/bash

echo "Pls enter your filename:"
read filename

do_ssh() {
    ssh $ip "$@"
    echo -e
}

header() {
    echo "#===================# $@ on $ip #======================#"
}

for ip in $(cat $filename) ; do 
	header "Memory Usage"
	do_ssh free -m
	echo -e
	header "disk usage"
	do_ssh du -sh
done
