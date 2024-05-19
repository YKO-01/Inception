#!/bin/bash

# Ensure the runtime directory exists and has the correct permissions
#mkdir -p /run/mysqld
#chown -R mysql:mysql /run/mysqld
#chmod -R 755 /run/mysqld

service mariadb start

mysql -u root -e "CREATE USER IF NOT EXISTS 'ahmed'@'%' IDENTIFIED BY 'password';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS maria;"
mysql -u root -e "GRANT ALL ON maria.* TO 'ahmed'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld -u mysql
