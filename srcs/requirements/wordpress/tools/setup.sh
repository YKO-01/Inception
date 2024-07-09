#!/bin/bash
# wp config delete SETTING_NAME
#  wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --allow-root --path=/usr/share/wordpress

cd /usr/share/wordpress
cp -r * /var/www/html
rm -rf /var/www/html/index.html
rm -rf /var/www/html/wp-config.php
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

wp config set DB_NAME ${MYSQL_DATABASE} --allow-root --path=/var/www/html
wp config set DB_USER ${MYSQL_USER} --allow-root --path=/var/www/html
wp config set DB_PASSWORD ${MYSQL_PASSWORD} --allow-root --path=/var/www/html
wp config set DB_HOST "mariadb" --allow-root --path=/var/www/html

# wp core install --allow-root --url=ayakoubi.42.fr --title=yako --admin_user=root --admin_password=12345 --admin_email=ayakoubi@gmail.com
# wp user create --allow-root root ayakoubi@gmail.com --role=administrator --user_pass=12345 --path=/var/www/html
# wp user create --allow-root ahmed ahmed@gmail.com --role=editor --user_pass=12345 --path=/var/www/html
# wp core install --allow-root --url=ayakoubi.42.fr --title=yako --admin_user=root --admin_password=123 --admin_email=ayakoubi@gmail.com
# service start php-fpm7.3
#tail -f
exec php-fpm8.2 -F