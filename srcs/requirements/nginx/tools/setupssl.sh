#!/bin/bash

CND=/CN=${DOMAINE_NAME}

mkdir -p /etc/nginx/ssl 
openssl req -x509 -new -out /etc/nginx/ssl/${DOMAINE_NAME}.crt -keyout /etc/nginx/ssl/${DOMAINE_NAME}.key -days 365 -newkey rsa:4096 -sha256 -nodes -subj "${CND}"

# openssl genrsa -des3 -passout pass:$PWSSL -out ${DOMAINE_NAME}.key 2048
# echo "CN = ${DOMAINE_NAME}" >> csr_config.cnf 
# openssl req -new -key ${DOMAINE_NAME}.key -passin pass:$PWSSL -out ${DOMAINE_NAME}.csr -config csr_config.cnf
# cp ${DOMAINE_NAME}.key ${DOMAINE_NAME}.key.pw
# openssl rsa -passin pass:$PWSSL -in ${DOMAINE_NAME}.key.pw -out ${DOMAINE_NAME}.key 
# openssl x509 -req -passin pass:$PWSSL -in ${DOMAINE_NAME}.csr -signkey ${DOMAINE_NAME}.key -out ${DOMAINE_NAME}.crt

# mkdir /etc/nginx/ssl \
# 	&& cp ${DOMAINE_NAME}.key ${DOMAINE_NAME}.crt /etc/nginx/ssl
