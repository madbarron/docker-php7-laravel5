FROM ganiutomo/docker-php-laravel:5.6-apache

COPY apache2.conf /etc/apache2/apache2.conf

RUN a2enmod rewrite

COPY freetds/freetds.conf /etc/freetds/
COPY freetds/locales.conf /etc/freetds/

Expose 80 443

# tsql -H Ulysses -U artisan -P C0d3-beautifu11y -D Hub

CMD ["apache2", "-DFOREGROUND"]
