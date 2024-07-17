FROM    debian:bookworm

RUN apt update && apt install wordpress php8.2 php8.2-fpm mariadb-client -y \
        && apt install curl -y
RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/8.2/fpm/pool.d/www.conf
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./tools/setup.sh .
RUN chmod +x setup.sh
CMD ["./setup.sh"]
