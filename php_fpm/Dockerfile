FROM php:8.2-fpm

# RUN apt-get update && \
#     apt-get install -y libonig-dev && \
#     docker-php-ext-install mbstring

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

COPY settings/php.ini /usr/local/etc/php/conf.d/php.ini
COPY settings/www.conf /usr/local/etc/php-fpm.d/www.conf