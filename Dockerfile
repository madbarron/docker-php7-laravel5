FROM php:5.6-apache

RUN apt-get update && apt-get install -y \
		freetds-dev \
		freetds-bin \
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
		mssql \
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

# PDO -> PDO_DBLIB -> freetds
