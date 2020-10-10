#!/bin/bash
source ./init.sh
echo "Installing mariadb"
echo "Adding an official Mariadb repository"
apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
add-apt-repository "deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.liquidtelecom.com/repo/10.5/${PLATFORM_NAME} ${PLATFORM_SUBNAME} main"
echo "Updating package indexes"
apt-get update -y
echo "Installing MariaDB-server"
apt-get install mariadb-server -y
echo "Starting mariadb"
systemctl start mariadb
echo "Enabling MariaDB on boot"
systemctl enable mariadb
