#first
## extension php
ARG PHP_EXTENSIONS="pgsql pdo_pgsql zip"
FROM thecodingmachine/php:7.4-v4-apache as php_base
#ENV TEMPLATE_PHP_INI=production
ENV COMPOSER_MEMORY_LIMIT=-1 \
    APACHE_DOCUMENT_ROOT=public/
COPY --chown=docker:docker . /var/www/html
RUN composer update
# RUN composer install --quiet --optimize-autoloader --no-dev
RUN composer install
