#install php && nginx && yaf
# TODO: replace copy pkg to download from remote

FROM lnmp:step1

# 不要写后缀,默认后缀都是.tar.gz
ENV PHP_PKG      php-5.6.22
ENV NGINX_PKG    nginx-1.10.3
ENV YAF_PKG      yaf

#ENV PHP_BUILD_DEPENDENCY="gcc-c++ wget curl curl-devel zlib-devel openssl-devel openssl openssh-server telnet perl cpio expat-devel gettext-devel autoconf pcre pcre-devel libxml libxml-devel unzip make libxml2 libxml2-devel mysql mysql-devel"
ENV PHP_BUILD_DEPENDENCY="gcc g++ make libxml2-dev libcurl4-openssl-dev pkg-config libssl-dev"
ENV PHP_BUILD_FLAG="--prefix=$PHP_INSTALL_PATH --with-freetype-dir --enable-mbstring --with-curl --enable-sockets --enable-zip --with-pcre-regex --with-mysql --with-pdo-mysql --with-mysqli --with-openssl --with-fpm-user=nobody --with-fpm-group=nobody --with-libdir=lib64 --enable-fpm"
ENV PHP_INSTALL_PATH="/usr/local/php"

ENV NGINX_BUILD_DEPENDENCY="libpcre3-dev"
ENV NGINX_INSTALL_PATH="/usr/local/nginx"


WORKDIR /mmtrix

COPY ./pkg/$PHP_PKG.tar.gz     ./
COPY ./pkg/$NGINX_PKG.tar.gz   ./
COPY ./pkg/$YAF_PKG.tar.gz     ./

COPY ./conf/nginx.conf         ./
COPY ./conf/supervisord.conf   ./

## replace default sources
#RUN set -x \
#    && mv /etc/apt/sources.list /etc/apt/sources.list.bak \
#    && { \
#        echo 'deb http://mirrors.163.com/debian/ jessie main non-free contrib'; \
#        echo 'deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib'; \
#        echo 'deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib'; \
#        echo 'deb-src http://mirrors.163.com/debian/ jessie main non-free contrib'; \
#        echo 'deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib'; \
#        echo 'deb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib'; \
#        echo 'deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib'; \
#        echo 'deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib'; \
#    } | tee /etc/apt/sources.list \
#    && apt update


## install php && nginx && yaf && supervisor
## warn: remove all cache if all was installed
RUN set -x \
    && apt -y --no-install-recommends --no-install-suggests install $PHP_BUILD_DEPENDENCY $NGINX_BUILD_DEPENDENCY \
    && tar -zxvf $PHP_PKG.tar.gz && cd $PHP_PKG && ./configure $PHP_BUILD_FLAG && make && make install && cd .. \
    && tar -zxvf $NGINX_PKG.tar.gz && cd $NGINX_PKG && ./configure --prefix=$NGINX_INSTALL_PATH && make && make install && cd .. \
    && tar -zxvf $YAF_PKG.tar.gz && cd $YAF_PKG && $PHP_INSTALL_PATH/bin/phpize && ./configure --with-php-config=$PHP_INSTALL_PATH/bin/php-config && make && make install \
    && apt -y install supervisor
#    && rm -rf /var/lib/apt/lists/*


#RUN set -x \
#    ## prepare php.ini
#    if [ ! -e $PHP_INSTALL_PATH/lib/php.ini ]; then \
#           [ -e ./$PHP_PKG/php.ini-development ] && cp ./$PHP_PKG/php.ini-development $PHP_INSTALL_PATH/lib/php.ini || : ; \
#    fi
#    ## prepare php-fpm.conf
#    && if [ ! -e $PHP_INSTALL_PATH/etc/php-fpm.conf ]; then \
#           [ -e $PHP_INSTALL_PATH/etc/php-fpm.conf.default ] && cp $PHP_INSTALL_PATH/etc/php-fpm.conf.default $PHP_INSTALL_PATH/etc/php-fpm.conf || : ; \
#       fi \
#    ## enable yaf extension
#    && [ -e $PHP_INSTALL_PATH/lib/php.ini ] && cp $PHP_INSTALL_PATH/lib/php.ini $PHP_INSTALL_PATH/lib/php.ini.bak || : ; && echo "extension=yaf.so" >> $PHP_INSTALL_PATH/lib/php.ini \
#    ## replace nginx's conf
#    && mv nginx.conf $NGINX_INSTALL_PATH/conf/nginx.conf \
#    ## modify supervisor's conf
#    && sed -i '/\[supervisord\]/a\nodaemon=true' /etc/supervisor/supervisord.conf \
#    && { \
#        echo '[nginx]'; \
#        echo 'command=$NGINX_INSTALL_PATH/sbin/nginx'; \
#        echo; \
#        echo '[php-fpm]'; \
#        echo 'command=$PHP_INSTALL_PATH/sbin/php-fpm'; \
#    } tee /etc/supervisor/conf.d/my.conf
#
#
#
#WORKDIR /
#RUN rm -rf /mmtrix
#
#
#EXPOSE 80 443



