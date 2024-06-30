#!/bin/bash

DMANME=$DOMAINE_NAME

openssl genrsa -des3 -passout pass:$PWSSL -out $(DMANME).key 2048
cp	conf/csr_config.cnf .
openssl req -new -key $(DMANME).key -passin pass:$PWSSL -out $(DMANME).csr -config csr_config.cnf
cp $(DMANME).key $(DMANME).key.pw
openssl rsa -passin pass:$PWSSL -in $(DMANME).key.pw -out $(DMANME).key 
openssl x509 -req -passin pass:$PWSSL -in $(DMANME).csr -signkey $(DMANME).key -out $(DMANME).crt

mkdir /etc/nginx/ssl \
	&& cp $(DMANME).key $(DMANME).crt /etc/nginx/ssl