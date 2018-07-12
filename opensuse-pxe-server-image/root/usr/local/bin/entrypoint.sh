#!/bin/bash
set -x

ipaddr=$1

if [ -n "$ipaddr" ]; then
   sed -i "s|localaddr|$ipaddr|g" /etc/dnsmasq.conf
else
   echo "Please specify the local IP address of the host"
fi

exec dnsmasq --no-daemon
