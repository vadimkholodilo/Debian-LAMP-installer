<VirtualHost *:8880>
ServerName {server_name}
ServerAlias {server_name}
DocumentRoot {root_path}
<Directory {root_path}>
Options All
Require all granted
AllowOverride All
</Directory>
</VirtualHost>