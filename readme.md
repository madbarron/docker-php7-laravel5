Laravel 5 Environment
=====================

> Image to run Laravel 5 apps under Apache 2 and PHP 5.6

How to build
------------

`docker build -t laravel5 .`

How to run
----------

```
docker run -itP -v ~/<project path>:/var/www/laravel laravel5 /bin/bash
apache2
```

Open Kitematic, find the mapped port
Open browser to your docker IP and the correct port, e.g. `http://192.168.99.100:32769/`

To quit and shut down, `exit`

To set up a new project directory
---------------------------------

To install a new laravel instance onto your file system folder, mount a volume and then run:
`composer.phar create-project laravel/laravel /var/www/laravel --prefer-dist`
