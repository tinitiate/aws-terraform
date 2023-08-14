#!/bin/bash

# Update package repositories
yum update -y

# Install PHP, MariaDB, and Nginx
yum install -y php php-mysqlnd
yum install -y mariadb mariadb-server
yum install -y nginx

# Start and enable services
systemctl start mariadb
systemctl enable mariadb

systemctl start nginx
systemctl enable nginx

# Secure MariaDB installation
mysql_secure_installation <<EOF

y
tinitiate
tinitiate
y
y
y
y
EOF

# Create a sample PHP file to test Nginx and PHP
echo "<?php phpinfo(); ?>" > /usr/share/nginx/html/info.php

# Restart Nginx
systemctl restart nginx
