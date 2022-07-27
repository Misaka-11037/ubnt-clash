#!/bin/sh
. $(dirname $(realpath $0))/../env.sh

NAME=$1

[ -f $UCROOT/config/$NAME.txt ] || exit;

for i in $(cat $UCROOT/config/ipset/$NAME.txt);
  do ipset add -! $NAME $i;
done
