FROM debian:jessie
MAINTAINER Sam Minnee <sam@silverstripe.com>

### SET UP

RUN apt-get -qq update

RUN apt-get -qqy install sudo wget lynx telnet nano curl make git-core locales bzip2

RUN echo "LANG=en_US.UTF-8\n" > /etc/default/locale && \
	echo "en_US.UTF-8 UTF-8\n" > /etc/locale.gen && \
	locale-gen

# Known hosts
ADD known_hosts /root/.ssh/known_hosts

# APACHE, MYSQL, PHP & SUPPORT TOOLS
RUN DEBIAN_FRONTEND=noninteractive apt-get -qqy install apache2 mysql-server \
	php5-cli libapache2-mod-php5 php5-mysqlnd php5-mcrypt php5-tidy php5-curl php5-gd php-pear

#  - Phpunit, Composer, Phing
RUN wget https://phar.phpunit.de/phpunit-3.7.37.phar && \
	chmod +x phpunit-3.7.37.phar && \
	mv phpunit-3.7.37.phar /usr/local/bin/phpunit && \
	wget https://getcomposer.org/composer.phar && \
	chmod +x composer.phar && \
	mv composer.phar /usr/local/bin/composer && \
	pear channel-discover pear.phing.info && \
	pear install phing/phing

# SilverStripe Apache Configuration
RUN a2enmod rewrite && \
	rm -r /var/www/html && \
	echo "date.timezone = Europe/London" > /etc/php5/apache2/conf.d/timezone.ini && \
	echo "date.timezone = Europe/London" > /etc/php5/cli/conf.d/timezone.ini

ADD apache-foreground /usr/local/bin/apache-foreground
ADD apache-default-vhost /etc/apache2/sites-available/000-default.conf
ADD _ss_environment.php /var/_ss_environment.php


## Commands and ports	
EXPOSE 80

# Run apache in foreground mode, because Docker needs a foreground
WORKDIR /var/www
CMD ["/usr/local/bin/apache-foreground"]

ENV LANG en_US.UTF-8
