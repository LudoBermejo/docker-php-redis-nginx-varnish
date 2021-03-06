FROM alpine:latest
MAINTAINER Ludo Bermejo <LudoBermejo@gmail.com>, domainer

# NGINX
RUN apk add --update nginx=1.10.1-r1 && \
    rm -rf /var/cache/apk/* && \
    rm -rf /etc/nginx/nginx.conf

ADD nginx_dev_conf/nginx.conf /etc/nginx/

ENV php_conf /etc/php7/php.ini
ENV fpm_conf /etc/php7/php-fpm.d/www.conf

RUN mkdir -p /var/run/php-fpm

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update --no-cache bash \
    openssh-client \
    nodejs \
    wget \
    supervisor \
    curl \
    nano \
    php7-fpm \
    php7-zlib \
    php7-zip \
    php7-xml \
    php7-curl \
    php7-json \
    php7-phar \
    php7-session \
    php7-openssl \
    php7-dom \
    php7-mbstring \
    php7-ctype \
    php7-redis

# WARNING: PHP REDIS is not a stable package so I need to put specific data in here
#RUN apk add --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/  phpredis
#RUN cp ./usr/lib/php/modules/redis.so ./usr/lib/php7/modules/
#RUN echo "extension=redis.so" > /etc/php7/conf.d/redis.ini

# install redis as session handler
RUN sed -i 's/session.save_handler = files/session.save_handler = redis/g' ${php_conf} && \
    sed -i 's/;     session.save_path = "N;\/path"/session.save_path = "tcp:\/\/redis:6379"/g'  ${php_conf}

RUN sed -i 's/listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm\/php7-fpm.sock/g' ${fpm_conf} && \
    sed -i 's/;listen.owner = nobody/listen.owner = nginx/g' ${fpm_conf} && \
    sed -i 's/;listen.group = nobody/listen.group = nginx/g' ${fpm_conf} && \
    sed -i 's/apache/nginx/g' ${fpm_conf} && \
    sed -i 's/;listen.mode = 0660/listen.mode = 0660/g' ${fpm_conf} && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" ${fpm_conf} && \
    ln -s /etc/php7/php.ini /etc/php7/conf.d/php.ini && \
    find /etc/php7/conf.d/ -name "*.ini" -exec sed -i -re 's/^(\s*)#(.*)/\1;\2/g' {} \;


RUN rm -rf /var/www/html

#

EXPOSE 9050

ADD etc /etc

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
