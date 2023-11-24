#!/bin/bash

# Update package repository
sudo yum update -y

# Add the MariaDB 10.11 repository to the system's repository list for yum.
sudo tee /etc/yum.repos.d/MariaDB.repo <<EOF
# MariaDB 10.11 CentOS repository list - created 2023-11-24
# https://mariadb.org/download/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.11/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF

# Install the EPEL repository, which contains additional packages not available in the standard repository.
sudo amazon-linux-extras install epel -y

# Install the 'pv' package (Pipe Viewer), required by some MariaDB configurations.
sudo yum install -y pv

# Clean the yum cache to ensure the latest packages are fetched.
sudo yum clean all

# Rebuild the yum cache after cleaning.
sudo yum makecache

# Install MariaDB Server and Client from the added MariaDB repository.
sudo yum install -y MariaDB-server MariaDB-client

# Start the MariaDB service.
sudo systemctl start mariadb

# Enable the MariaDB service to start automatically on system boot.
sudo systemctl enable mariadb

# Secure the MariaDB installation by setting the root password and applying some basic security settings.
sudo mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('tinitiate');"
sudo mysql -e "DELETE FROM mysql.user WHERE User='';"  # Remove anonymous users.
sudo mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"  # Restrict root user to local access only.
sudo mysql -e "DROP DATABASE test;"  # Remove the default test database.
sudo mysql -e "FLUSH PRIVILEGES;"  # Reload the privilege tables.

# Create a new database user named 'tinitiate' with remote access and set a password.
sudo mysql -e "CREATE USER 'tinitiate'@'%' IDENTIFIED BY 'tinitiate';"

# Grant all privileges to the new user on all databases and allow them to grant privileges to other users.
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'tinitiate'@'%' WITH GRANT OPTION;"

# Flush privileges again to ensure all changes are applied.
sudo mysql -e "FLUSH PRIVILEGES;"

# Create a new database named 'tinitiate'.
sudo mysql -e "CREATE DATABASE tinitiate;"