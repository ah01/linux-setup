#!/bin/bash

IPs=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172\.'`
HOSTN=`hostname`
UP=`uptime -p`

echo -e "\n\033[0;34m$HOSTN\033[0m (${IPs//$'\n'/ }) \033[0;32m$UP\033[0m \n"

if [ -f /sys/firmware/devicetree/base/model ]; then
        echo -e "RPi model: $(tr -d '\0' </sys/firmware/devicetree/base/model)\n"
fi

df -h -x tmpfs -x udev # disk usage, minus def and swap

echo ""
