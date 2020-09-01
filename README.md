# Debian LAMP-installer
This repo contains scripts to install LAMP-server on Debian-based systems.
I thought about doing something cross-platform, but there are a lot of platform-specific details. So, it is better and easier to create several repositories. When they are ready, I will include links to them as well.
LAMP stands for Linux, Apache, PHP, and MySQL.
However, MySQL is replaced with MariaDB. I just like MariaDB for its better performance and some features which are not available in the community edition of MySQL.

# How to use it
There will be no interractive installer to keep it simple and reusable.
However, there are some important steps which you need to do to make everything working properly:
1. Edit exports.sh. You need to set your system (Debian or Ubuntu) and system subname. For example, for Ubuntu it might be trusted. For Debian it might be Buster.
2. Run ./exports.sh to set environment variables.

When steps above are performed, feel free to run any script which you need. They have descriptive names, so you should not have any issues.
Remember that NGINX must be installed after Apache, because Apache takes port 80 and NGINX does the same.
Run ./configure_ports.sh if you plan to install NGINX after Apache.

# How to contact me
If you have any issues, please, create an issue on Github, if you want to discuss something with me or you want to offer me a job (I'm currently looking for a job), contact me using my email: vadimkholodilo@gmail.com
I check it regulary to make sure that I did not miss anything.
