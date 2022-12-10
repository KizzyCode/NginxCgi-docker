FROM alpine:latest

RUN apk add --no-cache fcgiwrap nginx shadow supervisor
RUN adduser -S -H -D -u 1000 -s /sbin/nologin www-data

RUN rm -rf /etc/nginx/*
COPY ./files/mime.types /etc/nginx/mime.types
COPY ./files/nginx.conf /etc/nginx/nginx.conf
COPY ./files/fastcgi.conf /etc/nginx/fastcgi.conf
COPY ./files/supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
