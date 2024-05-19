FROM	debian:bookworm
RUN	apt update -y && apt install mariadb-server -y

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE	3306/tcp

COPY ./bash.sh /

RUN chmod +x bash.sh

CMD ["./bash.sh"]
