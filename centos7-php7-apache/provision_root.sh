# php
rpm --import http://rpms.remirepo.net/RPM-GPG-KEY-remi && \
rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 && \
yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
yum install -y epel-release && \
yum install -y yum-utils && \
yum-config-manager --enable remi-php71 && \
yum update -y && \
yum install -y \
php71-php.x86_64 \
php71-php-bcmath.x86_64 \
php71-php-cli.x86_64 \
php71-php-common.x86_64 \
php71-php-devel.x86_64 \
php71-php-gd.x86_64 \
php71-php-intl.x86_64 \
php71-php-json.x86_64 \
php71-php-ldap.x86_64 \
php71-php-mbstring.x86_64 \
php71-php-mcrypt.x86_64 \
php71-php-mysqlnd.x86_64 \
php71-php-pdo.x86_64 \
php71-php-pear.noarch \
php71-php-xml.x86_64 \
php71-php-ast.x86_64 \
php71-php-opcache.x86_64 \
php71-php-pecl-zip.x86_64 \
php71-php-pecl-memcached.x86_64 \
php71-php-pdo.x86_64 \
php71-php-pgsql.x86_64 \
php71-php-pear.noarch \
php71-php-pecl-xdebug.x86_64 && \
ln -s /usr/bin/php71 /usr/bin/php && \
ln -s /etc/opt/remi/php71/php.ini /etc/php.ini && \
ln -s /etc/opt/remi/php71/php.d /etc/php.d && \
ln -s /etc/opt/remi/php71/pear.conf /etc/pear.conf && \
ln -s /etc/opt/remi/php71/pear /etc/pear

# util
yum install -y httpd-devel.x86_64 wget git unzip vim rsync htop finger jq zip

# composer
curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# date
timedatectl set-timezone Asia/Tokyo
localectl set-locale LANG=ja_JP.utf8
localectl set-keymap jp106

# security
sed -i "s/\(^SELINUX=\).*/\1disabled/" /etc/selinux/config

# alias
echo "alias vi='vim'" >> /etc/bashrc && source /etc/bashrc

# vim
mv vimrc /etc/

# hostname
hostnamectl set-hostname local-vm-php7-apache.localdomain
echo "127.0.0.1   local-vm-host local-vm-php7-apache.localdomain" >> /etc/hosts
echo "::1         local-vm-host local-vm-php7-apache.localdomain" >> /etc/hosts

# add develop
useradd develop
echo 'develop' | passwd develop --stdin