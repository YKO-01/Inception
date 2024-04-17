FROM	debian
RUN	apt update -y && apt install nginx -y

RUN	apt install openssl -y
RUN	openssl genrsa -des3 -passout pass:$PWSSL -out $DMNAME.key 2048
COPY	conf/csr_config.cnf .
RUN	openssl req -new -key $DMNAME.key -passin pass:$PWSSL -out $DMNAME.csr -config csr_config.cnf
RUN	cp $DMNAME.key $DMNAME.key.pw
RUN	openssl rsa -passin pass:$PWSSL -in $DMNAME.key.pw -out $DMNAME.key 
RUN	openssl x509 -req -passin pass:$PWSSL -in $DMNAME.csr -signkey $DMNAME.key -out $DMNAME.crt

RUN	mkdir /etc/nginx/ssl \
	&& cp $DMNAME.key $DMNAME.crt /etc/nginx/ssl

COPY conf/default /etc/nginx/sites-available/default
COPY index.html /var/www/html

EXPOSE	443/tcp

#RUN	service nginx restart

CMD	["/usr/sbin/nginx", "-g", "daemon off;"]
