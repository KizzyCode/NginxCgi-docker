FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive
ENV PACKAGES fcgiwrap nginx supervisor
RUN apt-get update \
    && apt-get upgrade --yes \
    && apt-get install --yes --no-install-recommends ${PACKAGES} \
    && apt-get autoremove --yes

RUN usermod --uid=1000 www-data

RUN rm -rf /etc/nginx/*
COPY ./files/mime.types /etc/nginx/mime.types
COPY ./files/nginx.conf /etc/nginx/nginx.conf
COPY ./files/fastcgi.conf /etc/nginx/fastcgi.conf
COPY ./files/supervisord.conf /etc/supervisord.conf

RUN mkdir -p /var/sock/www-data \
    && chown -R www-data /var/sock/www-data

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
