#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar, using default config location ~/.config/polybar/config
for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	echo "Launching Polybar on monitor: "$monitor
	MONITOR=$monitor polybar --reload -c $(dirname "$0")/config.ini top 2>&1 | tee -a /tmp/polybar.log &
done

echo "Polybar launched..."
