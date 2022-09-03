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

echo 'Change /etc/resolv.conf config'
sudo bash -c 'cat << EOF > /etc/resolv.conf
search home
nameserver 192.168.1.1
EOF'

sudo bash -c 'cat << EOF > /etc/hosts
# Standard host addresses
127.0.0.1  localhost
::1        localhost ip6-localhost ip6-loopback
ff02::1    ip6-allnodes
ff02::2    ip6-allrouters
# This host address
127.0.1.1  seremak
EOF'

sudo bash -c 'cat << EOF > /etc/hostname
seremak
EOF'

echo "##################    Network management software installed!    ##################"
