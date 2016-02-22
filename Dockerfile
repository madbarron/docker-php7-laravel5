FROM php:7.0-apache

# Based on ganiutomo
# https://github.com/ganiutomo/docker-php-laravel/blob/master/5.6/apache/Dockerfile

RUN apt-get update && apt-get install -y \
	freetds-dev \
	libicu-dev \
	libpq-dev \
	libmcrypt-dev \
	&& rm -r /var/lib/apt/lists/* \
	&& cp -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/ \
	&& docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
	&& docker-php-ext-install \
	intl \
	mbstring \
	mcrypt \
	pcntl \
	pdo_dblib \
	pdo_mysql \
	pdo_pgsql \
	pgsql \
	zip \
	opcache \
 && cd /usr/src/php \
 && make clean

COPY apache2.conf /etc/apache2/apache2.conf

RUN a2enmod rewrite

COPY freetds/freetds.conf /etc/freetds/
COPY freetds/locales.conf /etc/freetds/

Expose 80 443

# tsql -H Ulysses -U artisan -P C0d3-beautifu11y -D Hub

CMD ["apache2", "-DFOREGROUND"]
