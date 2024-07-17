#!/bin/bash

cd /usr/share/wordpress
cp -r * /var/www/html
rm -rf /var/www/html/index.html
rm -rf /var/www/html/wp-config.php
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

wp config set DB_NAME ${MYSQL_DATABASE} --allow-root --path=/var/www/html
wp config set DB_USER ${MYSQL_USER} --allow-root --path=/var/www/html
wp config set DB_PASSWORD ${MYSQL_PASSWORD} --allow-root --path=/var/www/html
wp config set DB_HOST "mariadb" --allow-root --path=/var/www/html


#echo wp core install --allow-root --url=$DOMAINE_NAME --title=yako --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL

#wp core install --allow-root --url=$DOMAINE_NAME --title=yakoInception --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL --skip-email --path=/var/www/html
wp core install --allow-root --url=${DOMAINE_NAME} --title=yako --admin_user=${WP_USER} --admin_password=${WP_PASS} --admin_email=${WP_EMAIL} --path=/var/www/html
wp user create ${WP_NUSER} ${WP_NEAMIL} --role=editor --user_pass=${WP_NPASS} --allow-root --path=/var/www/html
exec php-fpm8.2 -F
