#!/bin/sh
#--------------------FileInfo---------------------
# Author : CasYang
# E-mail :
# Desc   : install php 7.x version from REMI yum repo
# Create : 20210625
# Update : 20210625
# Version: 1.0.0
#-------------------------------------------------

#--------replace basic repo to aliyun mirror--------
#--------remove the comments below to enable--------
# mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
# wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
# yum clean all
# yum makecache

#--------install epel, remi, yum-utils--------
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y yum-utils

#--------install basic system components--------
$ yum install -y ntp make gcc gcc-c++ glibc glibc-devel curl curl-devel
# OpenSSL 在php中使用HTTPS流封装协议时需要使用这个库
$ yum install -y openssl openssl-devel
# Discuz 文档
$ yum install -y pcre pcre-devel libpng libpng-devel libtiff-devel libjpeg libjpeg-devel libjpeg-6b libjpeg-devel-6b freetype freetype-devel fontconfig-devel zlib zlib-devel libevent-devel flex bison bzip2 bzip2-devel libXpm libXpm-devel ncurses ncurses-devel libmcrypt libmcrypt-devel imake autoconf automake screen sysstat compat-libstdc++-33
# 图像处理需要GD，JPEG，PNG和其他与图像有关的系统库
$ yum install -y gd gd-devel
# libxml2库，PHP中XML相关的函数会用到这个库
$ yum install -y libxml2 libxml2-devel

#--------enable remi php repo with specified version--------
yum-config-manager --enable remi-php74
yum install -y php74 php74-php-bcmath php74-php-cli php74-php-fpm php74-php-gd php74-php-json php74-php-mbstring php74-php-mysqlnd php74-php-intl php74-php-pdo
systemctl restart php74-php-fpm
systemctl enable php74-php-fpm