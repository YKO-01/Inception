#!/bin/bash

service mariadb start

mysql -u root -e "CREATE USER IF NOT EXISTS 'ahmed'@'%' IDENTIFIED BY '12345';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root -e "GRANT ALL ON wordpress.* TO 'ahmed'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

service mariadb stop
exec mysqld -u mysql
