#!/bin/sh

ipset create SRC_CLASH hash:net

ipset create DST_CHINA_IP hash:net

ipset create DST_LAN_IP hash:net


