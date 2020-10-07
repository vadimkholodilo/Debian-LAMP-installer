		server {
		listen 80;
		server_name site.com www.site.com;

		return 301 https://$host$request_uri;
		}

		server {
		listen 443 ssl http2;
		server_name site.com;

		ssl_certificate /etc/CloudflareCerts/site.com/cert.pem;
		ssl_certificate_key /etc/CloudflareCerts/site.com/private.key;
		ssl_trusted_certificate /etc/ssl/certs/origin_ca_rsa_root.pem;

		location ~* \.(jpg|jpeg|gif|png|ico|css|bmp|swf|js|doc|docx|pdf|xls|xlsx|rar|zip|tbz|7z|exe|txt)$ {
		root /home/webserver/site.com;
		index index.php index.htm index.html;
		try_files $uri $uri/ =404;
			}

		location / {
		proxy_pass http://localhost:8880;
		proxy_set_header Host $host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme;
		}
		location ~ /\.ht {
		deny all;
		}
		}