<VirtualHost *:8880>
ServerName site.com
ServerAlias site.com
DocumentRoot /home/webserver/site.com
<Directory /home/webserver/site.com>
Options All
Require all granted
AllowOverride All
</Directory>
</VirtualHost>