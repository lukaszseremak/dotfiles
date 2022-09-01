#!/usr/bin/env bash
set -eo pipefail

echo "##################    Installing Network management.    ##################"

yay -S \
	networkmanager \
	network-manager-applet \
	networkmanager-openconnect \
	networkmanager-openvpn \
	networkmanager-pptp \
	networkmanager-vpnc \
	networkmanager-strongswan \
	networkmanager-fortisslvpn-git \
	networkmanager-iodine-git \
	networkmanager-libreswan \
	networkmanager-l2tp \
	networkmanager-ssh-git \
	network-manager-sstp

echo 'Start and Enable NetworkManager!'
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

echo "##################    Network management software installed!    ##################"
