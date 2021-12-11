FROM php:8.1-fpm-alpine3.14

#--------------------------------------------------------------------------
# Dependencies
#--------------------------------------------------------------------------

RUN apk add curl git make shadow openssh

#--------------------------------------------------------------------------
# PHP Extension manager
#--------------------------------------------------------------------------

RUN curl -sSLf \
        -o /usr/local/bin/install-php-extensions \
        https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions

RUN install-php-extensions @composer bcmath gd imagick pdo_mysql xdebug zip

#--------------------------------------------------------------------------
# User & Group setup
#--------------------------------------------------------------------------

RUN groupadd --gid 1000 developer \
    && useradd --uid 1000 --gid developer --shell /bin/sh --create-home developer


USER developer

RUN mkdir -m 700 /home/developer/.ssh
