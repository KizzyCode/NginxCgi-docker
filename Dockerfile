FROM alpine:latest

RUN apk add --no-cache fcgiwrap nginx shadow supervisor
RUN adduser -S -H -D -u 1000 -s /sbin/nologin www-data

RUN rm -rf /etc/nginx/*
COPY ./files/mime.types /etc/nginx/mime.types
COPY ./files/nginx.conf /etc/nginx/nginx.conf
COPY ./files/fastcgi.conf /etc/nginx/fastcgi.conf
COPY ./files/supervisord.conf /etc/supervisord.conf

RUN mkdir -p /var/sock/www-data \
    && chown -R www-data /var/sock/www-data

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
