FROM adminer:standalone

USER root

RUN apk update
RUN apk add autoconf openssl-dev g++ make nano
RUN pecl install mongodb
RUN apk del --purge autoconf g++ make
RUN docker-php-ext-enable mongodb

# Store PHP Configs at /usr/local/etc/php/conf.d
RUN echo "upload_max_filesize = 500M" >> /usr/local/etc/php/conf.d/upload_large_dumps.ini \
    && echo "post_max_size = 500M"       >> /usr/local/etc/php/conf.d/upload_large_dumps.ini \
    && echo "memory_limit = -1"           >> /usr/local/etc/php/conf.d/upload_large_dumps.ini \
    && echo "max_execution_time = 0"      >> /usr/local/etc/php/conf.d/upload_large_dumps.ini


USER root
