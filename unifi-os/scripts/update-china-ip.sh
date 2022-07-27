#!/bin/sh
. $(dirname $(realpath $0))/../env.sh

curl -q -s -o $UCROOT/config/DST_CHINA_IP.txt https://p.rst.im/q/raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt

$UCROOT/scripts/import-ipset.sh DST_CHINA_IP


