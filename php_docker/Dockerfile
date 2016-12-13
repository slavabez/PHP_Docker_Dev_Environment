FROM php:5.6-apache
RUN docker-php-ext-install mysqli
RUN usermod -u 1000 www-data
RUN usermod -G staff www-data
RUN a2enmod rewrite
RUN a2enmod ssl
RUN chown -R www-data:www-data /var/www/html