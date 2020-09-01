#!/bin/bash
echo "Installing mariadb"
echo "Adding an official Mariadb repository"
apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.liquidtelecom.com/repo/10.5/ubuntu bionic main'
echo "Updating package indexes"
apt-get update -y
echo "Installing MariaDB-server"
apt-get install mariadb-server -y
echo "Enabling MariaDB on boot"
systemctl enable mysqld