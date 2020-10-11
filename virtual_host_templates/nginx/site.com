		server {
		listen 80;
		server_name {server_name} www.{server_name};


		location ~* \.(jpg|jpeg|gif|png|ico|css|bmp|swf|js|doc|docx|pdf|xls|xlsx|rar|zip|tbz|7z|exe|txt)$ {
		root {root_path};
		index index.php index.htm index.html;
		try_files $uri $uri/ =404;
			}

		location / {
		proxy_pass http://localhost:{apache_port};
		proxy_set_header Host $host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme;
		}
		location ~ /\.ht {
		deny all;
		}
		}