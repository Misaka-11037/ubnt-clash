#!/bin/sh
. $(dirname $(realpath $0))/../env.sh

for DEV in ${INTERFACES[@]}; do 
    $UCROOT/scripts/add-firewall.sh $DEV $DEFAULT_ROUTER_IP
done

