FROM alpine:3.9
MAINTAINER Henry Ruhs <info@redaxmedia.com>

WORKDIR /var/www/html

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories

RUN apk update
RUN apk add bash chromium composer curl fontforge git g++ gcc make nodejs nodejs-npm ssmtp
RUN apk add php php-cli php-curl php-ctype php-dom php-gd php-session php-tokenizer php-opcache php-pdo_sqlite php-pdo_mysql php-pdo_pgsql php-simplexml php-xml php-xmlwriter php-zip

RUN composer global require hirak/prestissimo
RUN npm install grunt-cli --global

COPY ssmtp.conf /etc/ssmtp/ssmtp.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
