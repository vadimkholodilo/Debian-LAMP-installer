#!/bin/bash
# This script is part of Wordpress-installer project
# Lisenced under MIT
# See license.txt for more detailes

# Configuration variables
# If you run scripts manually, do not forget to run this script before running any other scripts
# However, I recommend run wordpress_installer.sh, because it does everything for you
export PLATFORM="ubuntu" # It will be set by OS detection script. If it does not do its job correctly, set it here
export UBUNTU_CODE_NAME="bionic" # See this page for more detailes: https://wiki.ubuntu.com/Releases
