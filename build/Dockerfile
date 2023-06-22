ARG PHP_VERSION 7.4

FROM wordpress:cli-php${PHP_VERSION}

ENV HOME /tmp
USER 33:33
COPY --chown=root:root ./php-conf.d/* /usr/local/etc/php/conf.d/
