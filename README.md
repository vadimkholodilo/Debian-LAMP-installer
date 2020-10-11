# Debian-LAMP-installer
This repo contains scripts to install LAMP-server on Debian-based systems.  
I thought about doing something cross-platform, but there are a lot of platform-specific details.  
So, it is better and easier to create several repositories. When they are ready, I will include links to them as well.  
LAMP stands for Linux, Apache, PHP, and MySQL.  
However, MySQL is replaced with MariaDB, and NGINX is installed as a reverse proxy

## What can be installed
1. NGINX (The latest stable version)
2. Apache (The latest available version in Debian's or Ubuntu's repository)
3. Mariadb (10.5)
4. PHP (7.4). The following extensions will be installed: php7.4-mysql php7.4-curl php7.4-json php7.4-mbstring php7.4-xml php7.4-zip php7.4-gd php7.4-soap php7.4-tokenizer.




## Folder structure
In the root directory you will find scripts which can be run directly and independently.  
inc folder contains some scripts which are used by other scripts.  
Do not run anything from this folder.  
virtual_host_templates contains template hosts for NGINX and Apache.  
Each folder also contains its own readme.md where you will find more details.  

# How to use it
There will be no interractive installer to use it in CI workflows.  
Before running any script, edit config.sh.  
Set PLATFORM_NAME to "debian" or "ubuntu" (With quotes)  
 All scripts  have descriptive names, so you should not have any issues.  
Note, remember that NGINX has to be installed before Apache, because they both take the same port.  
Apache installation script will assign another port to Apache if it finds that port 80 is already in use.  
If you forgot about this. It is not a problem. You can edit the following file /etc/apache2/ports.conf.  
Change 80 to any free port.  
You can also just run sudo ./install_all.sh to install all components in the right order.  
install_all.sh will run scripts in the right order.

## How to create virtual hosts
As of now, there are no scripts to create virtual hosts.  
You can use templates in virtual_host_templates directory to create your own.  
NGINX reads configuration files from /etc/nginx/config.d.  
They can have any name, but must end with .conf  
Apache reads from /etc/apache2/sites-enabled.
You can create configuration files in /etc/apache2/sites-enabled, but it is much better to create them in /etc/apache2/sites-available and create a symlink.  
You can also use apache2ensite and apache2dissite utilities to enable or disable sites.  
For example, you have a configuration file for site.com called site.com in /etc/apache2/sites-available,  
you can simply call apache2ensite site.com to enable it or apache2dissite site.com to disable it.

# Tests
Github Actions is used to test the code.  
Unfortunately, it does not offer Debian as a runner. Debian and Ubuntu are very close, so everything should work fine.  
However, if something does not work as expected,  open an issue on Github.


