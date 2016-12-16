FROM php:5.6-apache
RUN docker-php-ext-install mysqli
RUN DEBIAN_FRONTEND=noninteractive apt-get update -q \
        && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y \
            libfreetype6-dev \
            libjpeg62-turbo-dev \
            libmcrypt-dev \
            libpng12-dev \
            libcurl4-nss-dev \
        && docker-php-ext-install iconv mcrypt \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install gd \
        && docker-php-ext-install curl \
        && docker-php-ext-install mysqli \
        && docker-php-ext-install pdo \
        && docker-php-ext-install mbstring \
        && docker-php-ext-install json

RUN groupmod -g 1000 www-data

RUN a2enmod rewrite



