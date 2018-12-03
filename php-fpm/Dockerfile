FROM alpine:3.8

RUN apk add --update \
    php7-apcu \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-fileinfo \
    php7-fpm \
    php7-gd \
    php7-iconv \
    php7-imagick \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqli \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-phar \
    php7-redis \
    php7-session \
    php7-simplexml \
    php7-sodium \
    php7-tokenizer \
    php7-xml \
    php7-zlib \
    composer \
    libsodium \
    make \
    curl \
    tzdata

RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime && echo "Europe/Paris" >  /etc/timezone && apk del tzdata
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*

RUN addgroup -g 1000 www-data && adduser -u 1000 -G www-data -D www-data

ADD files/symfony.ini /etc/php7/php-fpm.d/
ADD files/symfony.ini /etc/php7/cli/conf.d/
ADD files/symfony.pool.conf /etc/php7/php-fpm.d/
RUN rm -f /etc/php7/php-fpm.d/www.conf

CMD ["php-fpm7", "-F"]

WORKDIR /var/www
EXPOSE 9000
