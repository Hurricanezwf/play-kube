#!/bin/bash

# download php
if [ ! -e "php-5.6.22.tar.gz" ]; then
    wget http://cn2.php.net/get/php-5.6.22.tar.gz/from/this/mirror -O php-5.6.22.tar.gz
    md5sum -c php.md5
    if [ $? -ne 0 ]; then
        echo -e "\033[31mDownload php5.6 failed!\033[0m"
        exit
    fi
else
    echo -e "\033[32mFound php-5.6.22.tar.gz, no need to download\033[0m"
fi



# download nginx
if [ ! -e "nginx-1.10.3.tar.gz" ]; then
    wget http://nginx.org/download/nginx-1.10.3.tar.gz -O nginx-1.10.3.tar.gz
    md5sum -c nginx.md5
    if [ $? -ne 0 ]; then
        echo -e "\033[31mDownload nginx failed!\033[0m"
        exit
    fi
else
    echo -e "\033[32mFound nginx-1.10.3.tar.gz, no need to download\033[0m"
fi


# download yaf
if [ ! -e "yaf.tar.gz" ]; then
    wget https://github.com/laruence/yaf/archive/php5.zip && unzip php5.zip && mv yaf-php5 yaf && tar zcvf yaf.tar.gz yaf && rm -rf yaf/ php5.zip
    if [ $? -ne 0 ]; then
        echo -e "\033[31mDownload yaf failed!\033[0m"
        exit
    fi
else
    echo -e "\033[32mFound yaf.tar.gz, no need to download\033[0m"
fi

echo -e "\033[32mPackage prepare OK!\033[0m"
