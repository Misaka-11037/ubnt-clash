#!/bin/sh

DEV=$1
IP=$2

iptables -t nat -A PREROUTING -i $DEV -p tcp \
  -m set --match-set SRC_CLASH src \
  -m set ! --match-set DST_CHINA_IP dst \
  -m set ! --match-set DST_LAN_IP dst \
  -j REDIRECT --to-ports $REDIR_PORT

iptables -t nat -A PREROUTING -i $DEV -p udp \
  -m set --match-set SRC_CLASH src \
  -m set ! --match-set DST_CHINA_IP dst \
  -m set ! --match-set DST_LAN_IP dst \
  -j REDIRECT --to-ports $REDIR_PORT


iptables -t nat -A PREROUTING -i $DEV -p udp \
  -m set --match-set SRC_CLASH src \
  -m udp --dport 53 \
  -m set --match-set UBIOS_ADDRv4_$DEV dst \
  -j DNAT --to-destination $IP:$DNS_PORT


