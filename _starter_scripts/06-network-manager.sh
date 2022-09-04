#!/usr/bin/env bash
set -eo pipefail

echo "##################    Installing Network management.    ##################"

yay -S --needed \
	networkmanager \
	network-manager-applet \
	networkmanager-openconnect \
	networkmanager-openvpn \
	networkmanager-pptp \
	networkmanager-vpnc \
	networkmanager-ssh

echo 'Start and Enable NetworkManager!'
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

echo "##################    Network management software installed!    ##################"
