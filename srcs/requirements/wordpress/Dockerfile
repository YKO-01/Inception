FROM    debian:bookworm

RUN apt update && apt install wordpress php-fpm -y \
        && apt install curl -y
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup.sh .
RUN chmod +x setup.sh
ENTRYPOINT ["./setup.sh"]
# CMD ["php-fpm7.3 -F"]