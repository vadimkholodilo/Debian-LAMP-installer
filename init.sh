#!/bin/bash
echo "Inicialization"
source ./inc/service.sh
source ./inc/check_root.sh
source ./config.sh
check_root
if [ $? -eq 1 ]; then
echo "$0 must be run under root"
exit 1
fi
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

