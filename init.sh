#!/bin/bash
echo "Inicialization"
echo "Exporting variables"
source ./config.sh
if [ -z "$PLATFORM_NAME" ]; then
echo '$PLATFORM_NAME is not set correctly. Check your config.sh file'
exit 1
fi
if [ -z "$PLATFORM_SUBNAME" ]; then
echo '$PLATFORM_SUBNAME is not set correctly. Check your config.sh'
exit 1
fi

echo "The following settings will be used: "
echo "Platform name: ${PLATFORM_NAME},"
echo "Platform subname: ${PLATFORM_SUBNAME}"

echo "Updating package indexes"
apt update -y
echo "Installing software-properties-common. This package is required for adding repositories"

