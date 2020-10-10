#!/bin/bash
source ./init.sh
echo "Installing php"
echo "Adding php repository which contains the latest php"
add-apt-repository -y ppa:ondrej/php
echo "Updating package indexes"
apt update -y
echo "Installing php 7.4"
apt install -y php7.4 php7.4-mysql php7.4-curl php7.4-json php7.4-mbstring php7.4-xml php7.4-zip php7.4-gd php7.4-soap php7.4-tokenizer
echo "Enabling php module for apache"
# Apache2 specific stuff
hash a2enmod 2> /dev/null
if [ $? -ne 1 ]; then
a2enmod php7.4
echo "Restarting apache"
systemctl restart apache2
fi
