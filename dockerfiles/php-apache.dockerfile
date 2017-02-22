# Use 5.6 php image with apache
FROM php:5.6-apache

# Install mysqli PHP drivers
RUN docker-php-ext-install mysqli

# Install a collection of useful plugins
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

# Make sure the www-data permissions work
RUN groupmod -g 1000 www-data

# Install Tidy (Advised for Silverstripe)
RUN apt-get -y install libtidy-dev \
    	&& docker-php-ext-install tidy

# Making sure permissions are ok
RUN usermod -u 1000 www-data
RUN usermod -G staff www-data

# Copy the php.ini file
COPY apache_files/php.ini /usr/local/etc/php/