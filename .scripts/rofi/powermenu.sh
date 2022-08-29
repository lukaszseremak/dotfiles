#!/bin/bash

rofi_command="rofi -config ~/.config/rofi/powermenu_config.rasi -p "power""

#### Options ###
power_off=" Power off"
reboot=" Reboot"
lock=" Lock"
suspend=" Sleep"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend"

chosen="$(echo -e "$options" | $rofi_command -dmenu -i -selected-row 3)"
case $chosen in
$lock)
	i3exit lock
	;;
$power_off)
	i3exit shutdown
	;;
$reboot)
	i3exit reboot
	;;
$suspend)
	i3exit suspend
	;;
esac
