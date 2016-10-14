FROM ubuntu:16.04

VOLUME ["/var/www/html"]

RUN apt-get update && apt-get install -y apache2 php php-cli libapache2-mod-php php-json php-mysql php-sqlite3 php-curl php-tidy php-intl php-mcrypt php-pear git curl zip

RUN pear install -a net_smtp mail_mime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo

RUN a2enmod rewrite
RUN a2enmod headers

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh

EXPOSE 80
ENTRYPOINT ["docker-entrypoint.sh"]
