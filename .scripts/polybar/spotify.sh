#!/usr/bin/env bash

if [[ $(playerctl -s -p chromium status) == "Playing" ]]; then
  playerctl -p chromium metadata --format "{{ trunc(title, 15) }}..."
else
    echo "Offline";
fi
