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
service_do_action start nginx
service_do_action enable nginx

