#!/usr/bin/env bash

if [[ $(playerctl -s -p chromium status) == "Playing" ]]; then
    playerctl -p chromium metadata --format "{{ title }}"
else
    echo "Offline";
fi
