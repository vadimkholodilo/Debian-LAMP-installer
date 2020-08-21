#!/bin/bash
add-apt-repository ppa:ondrej/php -y
apt update -y
apt install php7.4 - y
a2enmod php7.4
systemctl restart apache2