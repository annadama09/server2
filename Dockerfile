FROM php:7.0-apache

RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	&& docker-php-ext-install -j$(nproc) iconv mcrypt pdo pdo_mysql \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install zip \
	&& docker-php-ext-install -j$(nproc) gd \
	&& apt-get -y clean \
	&& apt-get autoremove
