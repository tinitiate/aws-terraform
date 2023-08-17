#!/bin/bash

# Update the system packages
sudo yum update -y

# Install PHP
sudo amazon-linux-extras enable php
sudo yum install php

# Install MariaDB
sudo amazon-linux-extras enable lamp-mariadb10.2-php7.2=latest
sudo yum install mariadb-server mariadb

# Secure MariaDB
sudo mysql_secure_installation

# Set the root password for MariaDB
sudo mysql -u root -p
ALTER USER 'root'@'localhost' IDENTIFIED BY 'tinitiate';
FLUSH PRIVILEGES;

# Install Nginx
sudo amazon-linux-extras enable nginx1
sudo yum install nginx

# Install the PHP MySQL Native Driver
sudo yum install php-mysqlnd

# Start MariaDB and nginx services
sudo systemctl start mariadb
sudo systemctl start nginx

# Enable the MariaDB and nginx service to start automatically at boot
sudo systemctl enable mariadb
sudo systemctl enable nginx

# Start php and nginx services
sudo systemctl start mariadb
sudo systemctl start nginx

# Enable the MariaDB and nginx service to start automatically at boot
sudo systemctl enable mariadb
sudo systemctl enable nginx


