#!/bin/bash
# wp config delete SETTING_NAME
#  wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --allow-root --path=/usr/share/wordpress

cd /usr/share/wordpress
cp -r * /var/www/html
rm -rf /var/www/html/index.html

wp config set DB_NAME ${MYSQL_DATABASE} --allow-root --path=/var/www/html
wp config set DB_USER ${MYSQL_USER} --allow-root --path=/var/www/html
# wp config set DB_PASSWORD ${MYSQL_PASSWORD} --type=constant --anchor="define('DB_USER'" --quiet --path="/usr/share/wordpress") --allow-root
# wp config --config=/usr/share/wordpress/wp-config.php --after DB_USER DB_PASSWORD "your_new_password" --allow-root --path=/usr/share/wordpress
# wp core config --extra-php "define('DB_PASSWORD', 'your_new_password'); --allow-root --path=/usr/share/wordpress"
# wp config update DB_PASSWORD "${MYSQL_PASSWORD}" --allow-root --path=/usr/share/wordpress
# wp config create --dbpass=${MYSQL_PASSWORD} --allow-root --path=/usr/share/wordpress
# wp config set DB_PASSWORD ${MYSQL_PASSWORD} --allow-root --path=/usr/share/wordpress

cat /usr/share/wordpress/wp-config.php
# service start php-fpm7.3
#tail -f
exec php-fpm8.2 -F