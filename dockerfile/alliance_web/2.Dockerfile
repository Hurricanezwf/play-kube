##install php && nginx && yaf
## TODO: replace copy pkg to download from remote

FROM debian:jessie

## 不要写后缀,默认后缀都是.tar.gz
ENV PHP_PKG      php-5.6.22
ENV NGINX_PKG    nginx-1.10.3
ENV YAF_PKG      yaf

ENV PHP_BUILD_DEPENDENCY="gcc g++ make libxml2-dev libcurl4-openssl-dev pkg-config libssl-dev autoconf"
ENV PHP_BUILD_FLAG="--with-freetype-dir --enable-mbstring --with-curl --enable-sockets --enable-zip --with-pcre-regex --with-mysql --with-pdo-mysql --with-mysqli --with-openssl --with-fpm-user=www --with-fpm-group=www --with-libdir=lib64 --enable-fpm"
ENV PHP_INSTALL_PATH="/usr/local/php"
ENV PHP_INI_DIR="$PHP_INSTALL_PATH/etc"
ENV PHP_SCAN_DIR="$PHP_INI_DIR/conf.d"

ENV NGINX_BUILD_DEPENDENCY="libpcre3-dev"
ENV NGINX_INSTALL_PATH="/usr/local/nginx"

ENV EXTRA_INSTALL_PROGRAM="supervisor"

WORKDIR /mmtrix

COPY ./pkg/$PHP_PKG.tar.gz     ./
COPY ./pkg/$NGINX_PKG.tar.gz   ./
COPY ./pkg/$YAF_PKG.tar.gz     ./

COPY ./conf/nginx.conf         ./
COPY ./conf/supervisord.conf   ./

## replace default sources
RUN set -x \
    && mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && { \
        echo 'deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib'; \
        echo 'deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib'; \
        echo 'deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib'; \
        echo 'deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib'; \
    } | tee /etc/apt/sources.list \
    && apt-get  update \
## install php && nginx && yaf && supervisor
    && apt-get install -y $PHP_BUILD_DEPENDENCY $NGINX_BUILD_DEPENDENCY $EXTRA_INSTALL_PROGRAM \
    && rm -rf /var/lib/apt/lists/* \
    && tar -zxvf $PHP_PKG.tar.gz && cd $PHP_PKG && ./configure --prefix=$PHP_INSTALL_PATH $PHP_BUILD_FLAG && make && make install && cd .. \
    && tar -zxvf $NGINX_PKG.tar.gz && cd $NGINX_PKG && ./configure --prefix=$NGINX_INSTALL_PATH && make && make install && cd .. \
    && tar -zxvf $YAF_PKG.tar.gz && cd $YAF_PKG && $PHP_INSTALL_PATH/bin/phpize && ./configure --with-php-config=$PHP_INSTALL_PATH/bin/php-config && make && make install


RUN set -x; \
    ## prepare php.ini
    if [ ! -e $PHP_INSTALL_PATH/lib/php.ini ]; then \
        if [ -e ./$PHP_PKG/php.ini-development ]; then \
            cp ./$PHP_PKG/php.ini-development $PHP_INSTALL_PATH/lib/php.ini; \
        fi; \
    fi; \
    \
    ## prepare php-fpm.conf
    if [ ! -e $PHP_INSTALL_PATH/etc/php-fpm.conf ]; then \
        if [ -e $PHP_INSTALL_PATH/etc/php-fpm.conf.default ]; then \
            cp $PHP_INSTALL_PATH/etc/php-fpm.conf.default $PHP_INSTALL_PATH/etc/php-fpm.conf; \
        fi; \
    fi; \
    \
    ## enable yaf extension
    if [ -e $PHP_INSTALL_PATH/lib/php.ini ]; then \
        cp $PHP_INSTALL_PATH/lib/php.ini $PHP_INSTALL_PATH/lib/php.ini.bak; \
    fi; \
    echo "extension=yaf.so" >> $PHP_INSTALL_PATH/lib/php.ini; \
    \
    ## replace nginx's conf
    mv nginx.conf $NGINX_INSTALL_PATH/conf/nginx.conf; \
    \
    ## prepare supervisor conf
    sed -i '/\[supervisord\]/a\nodaemon=true' /etc/supervisor/supervisord.conf; \
    { \
        echo "[nginx]"; \
        echo "command=$NGINX_INSTALL_PATH/sbin/nginx"; \
        echo; \
        echo "[php-fpm]"; \
        echo "command=$PHP_INSTALL_PATH/sbin/php-fpm"; \
    } | tee /etc/supervisor/conf.d/my.conf;





WORKDIR /
#RUN rm -rf /mmtrix
#
#
EXPOSE 80 443
#
CMD ["/usr/bin/supervisord"]
