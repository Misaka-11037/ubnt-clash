#!/bin/sh

. $(dirname $(realpath $0))/../env.sh

if [ "$USE_PROXY" == "1" ]; then
    echo "Download will be proxied via p.rst.im" 1>&2
    CONFIG_URL=$(echo $CONFIG_URL | sed -e 's#https://#https://p.rst.im/q/#')
fi

curl -o $UCROOT/config/clash.config $CONFIG_URL

