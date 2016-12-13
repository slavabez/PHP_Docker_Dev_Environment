FROM php:5.6-apache
RUN docker-php-ext-install mysqli
RUN apt-get update && apt-get install -y git libpq-dev mysql-client zip unzip
RUN usermod -u 1000 www-data
RUN usermod -G staff www-data
RUN a2enmod rewrite
RUN a2enmod ssl
RUN chown -R www-data:www-data /var/www/html

#Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

# Test Composer
RUN php composer.phar --version

# Install SilverStripe
RUN php composer.phar create-project silverstripe/installer /var/www/html/silverstripe