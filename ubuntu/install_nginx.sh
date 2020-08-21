#!/bin/bash
echo "Installing nginx"
echo "Adding key for nginx repository"
wget -qO - https://nginx.org/keys/nginx_signing.key | apt-key add -
echo "Adding nginx repository to sources.list"
echo "deb https://nginx.org/packages/ubuntu/ bionic nginx" >> /etc/apt/sources.list
echo "Adding nginx source repository to sources.list"
echo "deb-src https://nginx.org/packages/ubuntu/ bionic nginx" >> /etc/apt/sources.list
echo "Updating packages"
apt update
echo "Installing nginx"
apt install nginx -y
echo "Setting nginx to run on startup"
systemctl enable nginx
echo "Running nginx"
systemctl start nginx
