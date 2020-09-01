#!/bin/bash
echo "Installing php"
echo "Adding php repository which contains the latest php"
add-apt-repository ppa:ondrej/php
echo "Updating package indexes"
apt update
echo "Installing php 7.4"
apt install php7.4
echo "Enabling php module for apache"
a2enmod php7.4
echo "Restarting apache"
systemctl restart apache2