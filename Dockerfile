FROM php:7.0-apache

# Based on ganiutomo
# https://github.com/ganiutomo/docker-php-laravel/blob/master/5.6/apache/Dockerfile

RUN apt-get update && apt-get install -y \
	freetds-dev \
	freetds-bin \
	libicu-dev \
	libpq-dev \
	libmcrypt-dev \
	libldap2-dev \
	git \
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

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Symlink our ldap libraries together
RUN ln -fs /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/
RUN docker-php-ext-install ldap

COPY config/apache2.conf /etc/apache2/apache2.conf

RUN a2enmod rewrite ldap

COPY config/freetds/freetds.conf /etc/freetds/
COPY config/freetds/locales.conf /etc/freetds/

WORKDIR /var/www/laravel

Expose 80 443

CMD ["apache2", "-DFOREGROUND"]
