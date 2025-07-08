ARG PHP_VERSION 8.4

FROM wordpress:cli-php${PHP_VERSION}

USER root

RUN apk add --no-cache less

COPY --chown=root:root ./php-conf.d/* /usr/local/etc/php/conf.d/
COPY --chown=root:root ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh
RUN chmod a+wx /usr/local/etc/php/conf.d/

ENV HOME=/tmp
USER 33:33
