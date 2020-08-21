#!/bin/bash
if [ "$(whoami)" != "root" ]; then
echo "This script must be run under root"
exit 1
fi

source ./exports.sh # This script sets important environment variables
echo "Welcome to Wordpress installer"
echo "This program will prepare your server to run Wordpress"
echo "You do not need to be an expert in Linux to use this software"
echo "If you have any questions. Please, create an issue on Github or contact me using the following email: vadimkholodilo@gmail.com"
echo "I will try my best to help you"
echo "Your OS is ${PLATFORM}"
echo "Your OS subname is ${PLATFORM_SUBNAME}"
cd "${PLATFORM}" # Changing directory to platform specific scripts
source ./install_common_packages.sh
source ./install_nginx.sh
source ./install_apache.sh
source ./install_mariadb.sh
source ./install_php.sh
echo "Done"

