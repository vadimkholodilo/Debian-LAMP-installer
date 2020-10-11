#!/bin/bash
source ./init.sh
# determining a port which Apache can listen on
# Apache can be installed with NGINX, so to make everything working properly, we need to make sure that Apache will use a port which is not already used
# ports. Feel free to modify this list according to your needs
ports=(80 8000 8080)
port=-1 # If after for loop this variable is still -1, it means that all ports in the list are busy
for p in ${ports[@]}
do
lsof -i:$p > /dev/null
if [ $? -eq 1 ]; then
port=$p
break
fi
done
if [ $port -eq -1 ]; then
echo "All ports are already taken"
exit 1
fi
echo "Apache will be on port $port"
apt install apache2 -y

# If the port is different from 80, change it in /etc/apache2/ports.conf
if [ $port -ne 80 ]; then
sed -i "s/80/$port/g" /etc/apache2/ports.conf
fi

echo "Restarting Apache"
service_do_action restart apache2
echo "Enabling Apache on boot"
service_do_action enable apache2
