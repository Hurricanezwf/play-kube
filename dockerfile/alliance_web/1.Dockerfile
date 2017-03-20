FROM debian:jessie

RUN set -x \
    && mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && { \ 
        echo 'deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib'; \
        echo 'deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib'; \
        echo 'deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib'; \
        echo 'deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib'; \
    } | tee /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y gcc g++ make autoconf libxml2-dev libcurl4-openssl-dev pkg-config libssl-dev libpcre3-dev --no-install-recommends \
