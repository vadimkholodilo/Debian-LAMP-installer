#!/bin/bash
source ./init.sh
echo "Installing nginx"
echo "Adding key for nginx repository"
wget -qO - https://nginx.org/keys/nginx_signing.key | apt-key add -
echo "Adding nginx repository to sources.list"
echo "deb https://nginx.org/packages/${PLATFORM_NAME}/ ${PLATFORM_SUBNAME} nginx" >> /etc/apt/sources.list
echo "Updating packages"
apt update
echo "Installing nginx"
apt install nginx -y
echo "Setting nginx to run on startup"
systemctl enable nginx
echo "Running nginx"
systemctl start nginx
