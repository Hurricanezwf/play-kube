#!/bin/bash

# 脚本说明:
# - 通过easyrsa的方式自动生成证书
# - 填写好MASTER_IP和CERTIFICATE_SAVE_PATH后, 直接运行脚本即可


MASTER_IP=""							# 自行填写kubernetes master的IP
CERTIFICATE_SAVE_PATH=""				# 自定填写证书的保存位置(注意:脚本会先删除目录然后新建)

DEBUG=${DEBUG:-false}

set -e

set -o errexit

if [ "$DEBUG"x = "true"x ]; then
	set -x
fi

# 查找是否存在目标目录是否存在
if [ ! -e "./easy-rsa-master" ]; then
	if [ ! -e "./easy-rsa.tar.gz" ]; then
		echo -e "\033[33m[Warn]: You have no easy-rsa.tar.gz, so we will download from google, please be ensure you have break through GFW, or it'll download failed.\033[0m"
		while [ "$choice"x != "y"x -a "$choice"x != "n"x ]; do
			printf "Do you continue? (y/n): "
			read -n 1 choice
			printf "\n"
			if [ "$choice" = "n" ]; then
				exit
		    fi
	    done
		curl -L -O https://storage.googleapis.com/kubernetes-release/easy-rsa/easy-rsa.tar.gz
	fi
	tar -zxvf "./easy-rsa.tar.gz"
fi

# 使用easyrsa生成证书
if [ ! $MASTER_IP ]; then
	echo -e "\033[31mMASTER_IP is empty!\033[0m"
	exit
fi

cd ./easy-rsa-master/easyrsa3/
./easyrsa init-pki
./easyrsa --batch "--req-cn=${MASTER_IP}@`date +%s`" build-ca nopass
./easyrsa --subject-alt-name="IP:${MASTER_IP}" build-server-full kubernetes-master nopass


# 拷贝到指定目录
if [ ! $CERTIFICATE_SAVE_PATH ]; then
	echo -e "\033[31mCERTIFICATE_SAVE_PATH is empty!\033[0m"
	exit
fi

rm -rf $CERTIFICATE_SAVE_PATH
mkdir -p $CERTIFICATE_SAVE_PATH

cp pki/ca.crt $CERTIFICATE_SAVE_PATH
cp pki/issued/kubernetes-master.crt $CERTIFICATE_SAVE_PATH
cp pki/private/kubernetes-master.key $CERTIFICATE_SAVE_PATH

echo -e "\033[32mGenerate certificats to $CERTIFICATE_SAVE_PATH SUCCESS!\033[0m"
echo -e "Next, You may need to add parameters to restart kube-apiserver:"
echo -e "    --client-ca-file=${CERTIFICATE_SAVE_PATH}/ca.crt"
echo -e "    --ctls-cert-file=${CERTIFICATE_SAVE_PATH}/server.crt"
echo -e "    --tls-private-key-file=${CERTIFICATE_SAVE_PATH}/server.key"
echo -e "\n"
