#!/bin/sh


NAME=$1

[ -f ../config/$NAME.txt ] || exit;

for i in $(cat ../config/$NAME.txt);
  do ipset add -! $NAME $i;
done
