#!/usr/bin/env bash
set -eo pipefail

echo 'Install VirtualBox package!'
yay -S virtualbox virtualbox-guest-iso

echo 'Add user to the vboxusers group!'
sudo gpasswd -a $USER vboxusers

echo 'Load the virtualbox kernel module'
sudo modprobe vboxdrv

echo 'Install VirtualBox extension package'
yay -S virtualbox-ext-oracle
sudo systemctl enable vboxweb.service
sudo systemctl start vboxweb.service
