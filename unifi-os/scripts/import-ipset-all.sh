#!/bin/sh
. $(dirname $(realpath $0))/../env.sh

for i in $(ls $UCROOT/config/ipset/*.txt); do
	KEY=$(basename $i | awk -F '.' '{print $1}') 
	echo "Import ipset $KEY"
	$UCROOT/scripts/import-ipset.sh "$KEY"
done
