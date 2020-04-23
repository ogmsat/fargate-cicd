FROM amazonlinux:latest

ENV PHPMYADMIN_VERSION 5.0.1

# PHP 7.2 package dependency installation
RUN amazon-linux-extras install nginx1=latest

# Copy our nginx config
RUN rm -Rf /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/nginx.conf

# nginx site conf
RUN rm -Rf /var/www/* && \
mkdir -p /var/www/html/
ADD index.html /var/www/html/

RUN mkdir /shared
WORKDIR /shared
CMD nginx -g "daemon off;"