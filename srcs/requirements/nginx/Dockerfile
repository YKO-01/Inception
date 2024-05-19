FROM	debian:bookworm
RUN	apt update -y && apt install nginx -y

RUN	apt install openssl -y
RUN	openssl genrsa -des3 -passout pass:$PWSSL -out ayakoubi.42.fr.key 2048
COPY	conf/csr_config.cnf .
RUN	openssl req -new -key ayakoubi.42.fr.key -passin pass:$PWSSL -out ayakoubi.42.fr.csr -config csr_config.cnf
RUN	cp ayakoubi.42.fr.key ayakoubi.42.fr.key.pw
RUN	openssl rsa -passin pass:$PWSSL -in ayakoubi.42.fr.key.pw -out ayakoubi.42.fr.key 
RUN	openssl x509 -req -passin pass:$PWSSL -in ayakoubi.42.fr.csr -signkey ayakoubi.42.fr.key -out ayakoubi.42.fr.crt

RUN	mkdir /etc/nginx/ssl \
	&& cp ayakoubi.42.fr.key ayakoubi.42.fr.crt /etc/nginx/ssl

COPY conf/default /etc/nginx/sites-available/default
COPY index.html /var/www/html

EXPOSE	443/tcp

RUN	service nginx restart

CMD	["/usr/sbin/nginx", "-g", "daemon off;"]
