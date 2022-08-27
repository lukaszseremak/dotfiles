#!/usr/bin/env bash
set -eo pipefail

echo "Install and config bluetooth."
yay -S bluez bluez-utils
modprobe btusb
sudo systemctl start --now bluetooth.service
sudo systemctl enable bluetooth.service
if grep -Fxq "AutoEnable=true" /etc/bluetooth/main.conf; then
	echo "bluetooth is auto enabled."
else
	echo "auto enabling bluetooth."
  sudo sed '/AutoEnable=true/s/^#//' -i /etc/bluetooth/main.conf
fi
