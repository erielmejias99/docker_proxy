FROM nginx:latest

COPY ./includes/ /etc/nginx/includes/

COPY ./ssl/ /etc/ssl/certs/nginx/

COPY ./pages/ /var/www/html/

COPY ./default.conf /etc/nginx/conf.d/default.conf