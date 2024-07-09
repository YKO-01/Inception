FROM	debian:bookworm
RUN	apt update -y && apt install nginx -y

RUN	apt install openssl -y

#COPY	./conf/csr_config.cnf .

# ENV DMNAME=${DOMAINE_NAME}

# RUN mkdir -p /etc/nginx/ssl 
# RUN openssl req -x509 -new -out /etc/nginx/ssl/${DOMAINE_NAME}.crt -keyout /etc/nginx/ssl/${DOMAINE_NAME}.key -days 365 -newkey rsa:4096 -sha256 -nodes -subj /CN=${DOMAINE_NAME}

# RUN	apt install openssl -y
# RUN	openssl genrsa -des3 -passout pass:$PWSSL -out ayakoubi.42.fr.key 2048
# COPY	conf/csr_config.cnf .
# RUN	openssl req -new -key ayakoubi.42.fr.key -passin pass:$PWSSL -out ayakoubi.42.fr.csr -config csr_config.cnf
# RUN	cp ayakoubi.42.fr.key ayakoubi.42.fr.key.pw
# RUN	openssl rsa -passin pass:$PWSSL -in ayakoubi.42.fr.key.pw -out ayakoubi.42.fr.key 
# RUN	openssl x509 -req -passin pass:$PWSSL -in ayakoubi.42.fr.csr -signkey ayakoubi.42.fr.key -out ayakoubi.42.fr.crt


COPY ./tools/setupssl.sh .
RUN chmod +x setupssl.sh

COPY conf/default /etc/nginx/sites-available/default
# COPY index.html /var/www/html

EXPOSE	443/tcp

# RUN	service nginx restart
ENTRYPOINT ["./setupssl.sh"]
# RUN ./setupssl.sh

#  CMD	["nginx", "-g", "daemon off;"]
# CMD tail -f
