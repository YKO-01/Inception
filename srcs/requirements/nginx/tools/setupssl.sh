#!/bin/bash

mkdir -p /etc/nginx/ssl 
openssl req -x509 -new -out /etc/nginx/ssl/${DOMAINE_NAME}.crt -keyout /etc/nginx/ssl/${DOMAINE_NAME}.key -days 365 -newkey rsa:4096 -sha256 -nodes -subj "/CN=${DOMAINE_NAME}"
sleep 1
envsubst '$DOMAINE_NAME' < /etc/nginx/sites-available/nginx.conf > /etc/nginx/sites-available/default

nginx -g "daemon off;"
