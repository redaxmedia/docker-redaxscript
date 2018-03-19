FROM ubuntu:16.04
MAINTAINER Henry Ruhs <info@redaxmedia.com>

VOLUME ["/var/www/html"]
WORKDIR /var/www/html

RUN apt-get --yes update
RUN apt-get --yes install apache2 apt-transport-https curl fontforge git npm ssmtp sqlite3 unixodbc-dev wget zip
RUN apt-get --yes install libapache2-mod-php php php-cli php-curl php-dev php-intl php-json php-mbstring php-mcrypt php-mysql php-pear php-pgsql php-sqlite3 php-tidy php-xdebug

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get --yes update
RUN ACCEPT_EULA=Y apt-get --yes install msodbcsql

RUN pecl install pdo_sqlsrv
RUN echo "extension=pdo_sqlsrv.so" >> /etc/php/7.0/apache2/php.ini
RUN echo "extension=pdo_sqlsrv.so" >> /etc/php/7.0/cli/php.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo
RUN npm install --global grunt-cli

RUN a2enmod rewrite
RUN a2enmod headers

COPY ssmtp.conf /etc/ssmtp/ssmtp.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/bin/nodejs /usr/bin/node

ENTRYPOINT ["docker-entrypoint.sh"]
