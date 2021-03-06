#!/bin/sh

connection=$(pgrep -a vpnc$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1)

if [ -n "$connection" ]; then
    echo "VPN: $connection "
else
    echo "VPN: off "
fi
