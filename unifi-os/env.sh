#!/bin/sh

# install root
UCROOT=/mnt/data/ubnt-clash

# config subscription url
CONFIG_URL=""

# enable on interfaces
INTERFACES=(br2)

# dns listen, make sure it's listened at 0.0.0.0:xxxx
DNS_PORT=7874

# redir-port, make sure allow-lan is enabled
REDIR_PORT=7892

# pick any interface ip
DEFAULT_ROUTER_IP=192.168.2.1


# Use Proxy
if [ -f $UCROOT/USE_PROXY ]; then
    USE_PROXY="1"
fi

