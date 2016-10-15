FROM ubuntu:16.04
MAINTAINER Henry Ruhs <info@redaxmedia.com>

VOLUME ["/var/www/html"]

RUN apt-get update
RUN apt-get install -y apache2 curl git zip
RUN apt-get install -y libapache2-mod-php php php-cli php-curl php-intl php-json php-mbstring php-mcrypt php-mysql php-pear php-pgsql php-sqlite3 php-tidy
RUN pear install -a net_smtp mail_mime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo

RUN a2enmod rewrite
RUN a2enmod headers

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
