FROM	debian:bookworm
RUN	apt update -y && apt install nginx -y

RUN	apt install openssl -y

COPY conf/csr_config.cnf /etc/ssl/csr_config.cnf.template
RUN envsubst < /etc/ssl/csr_config.cnf.template > /etc/ssl/csr_config.cnf

RUN	openssl genrsa -des3 -passout pass:$PWSSL -out $(DOMAINE_NAME).key 2048
RUN	openssl req -new -key $(DOMAINE_NAME).key -passin pass:$PWSSL -out $(DOMAINE_NAME).csr -config etc/ssl/csr_config.cnf
RUN	cp $(DOMAINE_NAME).key $(DOMAINE_NAME).key.pw
RUN	openssl rsa -passin pass:$PWSSL -in $(DOMAINE_NAME).key.pw -out $(DOMAINE_NAME).key 
RUN	openssl x509 -req -passin pass:$PWSSL -in $(DOMAINE_NAME).csr -signkey $(DOMAINE_NAME).key -out $(DOMAINE_NAME).crt

RUN	mkdir /etc/nginx/ssl \
	&& cp $(DOMAINE_NAME).key $(DOMAINE_NAME).crt /etc/nginx/ssl

# COPY ./tools/setupssl.sh .

# RUN chmod +x setupssl.sh && ./setupssl.sh

COPY conf/default /etc/nginx/sites-available/default
COPY index.html /var/www/html

EXPOSE	443/tcp

RUN	service nginx restart

CMD	["/usr/sbin/nginx", "-g", "daemon off;"]
