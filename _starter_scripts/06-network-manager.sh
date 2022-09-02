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

echo 'Setting Up Firewall with UFW'
yay -S --needed ufw
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh


echo "##################    Network management software installed!    ##################"
