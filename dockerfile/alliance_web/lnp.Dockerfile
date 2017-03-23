##install php && nginx && yaf

FROM debian:jessie

## 不要写后缀,默认后缀都是.tar.gz
ENV PHP_PKG      php-5.6.22
ENV NGINX_PKG    nginx-1.10.3
ENV YAF_PKG      yaf

ENV PHP_BUILD_TOOL="gcc g++ make pkg-config autoconf"
ENV PHP_INSTALL_PATH="/usr/local/php"
ENV PHP_INI_DIR="$PHP_INSTALL_PATH/etc"

ENV NGINX_BUILD_DEPENDENCY="libpcre3-dev"
ENV NGINX_INSTALL_PATH="/usr/local/nginx"


WORKDIR /mmtrix

COPY ./pkg/$PHP_PKG.tar.gz     ./
COPY ./pkg/$NGINX_PKG.tar.gz   ./
COPY ./pkg/$YAF_PKG.tar.gz     ./

COPY ./conf/nginx.conf         ./

## replace default sources
RUN set -x \
    && mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && { \
        echo 'deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib'; \
        echo 'deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib'; \
        echo 'deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib'; \
        echo 'deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib'; \
    } | tee /etc/apt/sources.list



## install php
RUN set -x \
    && apt-get update \
    && apt-get install -y $PHP_BUILD_TOOL libxml2-dev libcurl4-openssl-dev libssl-dev \
    && rm -rf /var/lib/apt/lists/* \
    \
    && tar -zxvf $PHP_PKG.tar.gz \
    && cd $PHP_PKG \
    && ./configure \
           --prefix="$PHP_INSTALL_PATH" \
           --with-config-file-path="$PHP_INI_DIR" \
           --with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
           --with-freetype-dir \
           --with-curl \
           --with-pcre-regex \
           --with-mysql \
           --with-pdo-mysql \
           --with-mysqli \
           --with-openssl \
           --with-fpm-user=www \
           --with-fpm-group=www \
           --with-libdir=lib64 \
           --enable-fpm \
           --enable-zip \
           --enable-sockets \
           --enable-mbstring \
    && make -j "$(nproc)" \
    && make install \
    \
    && groupadd www \
    && useradd -g www www



RUN set -x; \
    if [ ! -e "$PHP_INI_DIR/php.ini" ]; then \
        cp "./$PHP_PKG/php.ini-development" "$PHP_INI_DIR/php.ini"; \
    fi; \
    \
    if [ ! -e "$PHP_INI_DIR/php-fpm.conf" ]; then \
        cp "$PHP_INI_DIR/php-fpm.conf.default" "$PHP_INI_DIR/php-fpm.conf"; \
    fi



## install yaf extension
 RUN set -x; \
     tar -zxvf $YAF_PKG.tar.gz; \
     cd $YAF_PKG; \
     $PHP_INSTALL_PATH/bin/phpize; \
     ./configure --with-php-config="$PHP_INSTALL_PATH/bin/php-config"; \
     make -j "$(nproc)"; \
     make install; \
     \
     if [ -e $PHP_INI_DIR/php.ini ]; then \
         echo -e "\n\n\n[yaf]" >> $PHP_INI_DIR/php.ini; \
         echo -e "extension=yaf.so" >> $PHP_INI_DIR/php.ini; \
         echo -e "yaf.environ=develop" >> $PHP_INI_DIR/php.ini; \
     fi;



## install nginx
RUN set -x \
     && apt-get update \
     && apt-get -y install "$NGINX_BUILD_DEPENDENCY" \
     && rm -rf /var/lib/apt/lists/* \
     && tar -zxvf $NGINX_PKG.tar.gz \
     && cd "$NGINX_PKG" \
     && ./configure --prefix="$NGINX_INSTALL_PATH" \
     && make -j "$(nproc)" \
     && make install \
     && cd .. \
     && mv nginx.conf $NGINX_INSTALL_PATH/conf/nginx.conf \
     && echo "Hello, the LNP environment is ready for you(^_^)" > $NGINX_INSTALL_PATH/html/hello.php


## erase pkg
RUN set -x \
    && apt-get purge -y $PHP_BUILD_TOOL


WORKDIR /

RUN rm -rf /mmtrix

COPY ./entrypoint.sh /usr/local/bin/

EXPOSE 80 443

ENTRYPOINT ["entrypoint.sh"]
