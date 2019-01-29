FROM ubuntu:18.04
MAINTAINER Henry Ruhs <info@redaxmedia.com>

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /var/www/html

RUN apt-get update
RUN apt-get install apache2 apt-transport-https curl fontforge git ssmtp sqlite3 wget zip --yes
RUN apt-get install libapache2-mod-php php php-cli php-curl php-dev php-intl php-json php-mbstring php-mysql php-pear php-pgsql php-sqlite3 php-tidy php-xdebug php-zip --yes

RUN curl https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install nodejs --yes

RUN curl https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo
RUN npm install --global grunt-cli

RUN a2enmod deflate
RUN a2enmod headers
RUN a2enmod rewrite

COPY ssmtp.conf /etc/ssmtp/ssmtp.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
