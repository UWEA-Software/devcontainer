FROM php:8.1-fpm-alpine3.14

RUN apk add curl git make shadow

# [ Ext installer --->
RUN curl -sSLf \
        -o /usr/local/bin/install-php-extensions \
        https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions
# ---> Ext installer

RUN install-php-extensions @composer bcmath gd imagick pdo_mysql xdebug zip

RUN groupadd --gid 1000 developer \
    && useradd --uid 1000 --gid developer --shell /bin/sh --create-home developer

RUN apk add openssh

USER developer

RUN mkdir /home/developer/.ssh && chmod 700 /home/developer/.ssh