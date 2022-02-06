#!/usr/bin/env bash
set -eo pipefail

echo 'Install Docker!'
sudo pacman -S docker

echo 'Start and Enable Docker!'
sudo systemctl start docker.service
sudo systemctl enable docker.service

echo 'Add user to the docker group!'
sudo usermod -aG docker $USER
