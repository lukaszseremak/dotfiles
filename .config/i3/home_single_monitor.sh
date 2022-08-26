#!/bin/sh
xrandr --output eDP-1 --off --output HDMI-1 --off --output DP-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2 --off --output DP-3 --off --output DP-4 --off
nitrogen --restore --set-scaled
i3-msg restart
