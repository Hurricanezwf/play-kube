FROM debian:jessie

RUN set -x \
    && mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && { \ 
        echo 'deb http://mirrors.163.com/debian/ jessie main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib'; \
        echo 'deb-src http://mirrors.163.com/debian/ jessie main non-free contrib'; \
        echo 'deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib'; \
        echo 'deb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib'; \
        echo 'deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib'; \
        echo 'deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib'; \
    } | tee /etc/apt/sources.list \
    && apt update \
    && apt -y install gcc g++ make libxml2-dev libcurl4-openssl-dev pkg-config libssl-dev libpcre3-dev \
