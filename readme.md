Laravel 5 Environment
=====================

> Image to run Laravel 5 apps under Apache 2 and PHP 5.6. Also include NPM and a few tools to help build our JS app.

Included
--------

Works with LDAP
Works with MSSQL via freetds and pdo_dblib

PHP 5.6 with modules:
- intl
- mbstring
- mcrypt
- pcntl
- pdo_dblib
- pdo_mysql
- pdo_pgsql
- pgsql
- zip
- opcache
- ldap

nodejs with global npm modules:
- bower
- gulp
- protractor
- jscs
- jshint
- typings
- typescript

How to build
------------

`docker build -t bquinn/apache-php7-laravel5 .`

How to run
----------

You should have your website code in a subdirectory of your user dir, like ~/docker/my-site

```
docker run -itP -v ~/<project path>:/var/www/laravel bquinn/apache-php7-laravel5
```

Open Kitematic, find the mapped port
Open browser to your docker IP and the correct port, e.g. `http://192.168.99.100:32769/`

To set up a new Laravel project directory
---------------------------------

To install a new laravel instance onto your file system folder, mount a volume and then run:
`composer create-project laravel/laravel /var/www/laravel --prefer-dist`

To test database connection in container
----------------------------------------

`tsql -H <hostname> -U <username> -P <password> -D <database name>`
