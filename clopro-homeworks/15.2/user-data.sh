#!/bin/bash
apt-get update
apt-get install -y apache2 php libapache2-mod-php mysql-server php-mysql
systemctl start apache2
systemctl enable apache2

cat <<EOT > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>LAMP Instance</title>
</head>
<body>
    <h1>Welcome to LAMP on Yandex Cloud!</h1>
    <p>This is my image from Object Storage:</p>
    <img src="https://${bucket_name}.storage.yandexcloud.net/${image_key}" alt="Image from bucket">
</body>
</html>
EOT