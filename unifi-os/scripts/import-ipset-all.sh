#!/bin/sh

for i in $(ls ../config/*.txt); do
	KEY=$(basename $i | awk -F '.' '{print $1}') 
	echo "Import ipset $KEY"
	./import-ipset.sh "$KEY"
done
