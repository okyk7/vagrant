# package
yum update -y
yum install -y epel-release
yum install -y vim rsync wget htop finger git svn jq

# date
timedatectl set-timezone Asia/Tokyo
localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
localectl set-locale LANG=ja_JP.utf8
localectl set-keymap jp106

# security
sed -i "s/\(^SELINUX=\).*/\1disabled/" /etc/selinux/config

# alias
echo "alias vi='vim'" >> /etc/bashrc && source /etc/bashrc

# vim
mv vimrc /etc/
nkf -Lu --overwrite /etc/vimrc


# hostname
hostnamectl set-hostname local-vm-host.localdomain
echo "127.0.0.1   local-vm-host local-vm-host.localdomain" >> /etc/hosts
echo "::1         local-vm-host local-vm-host.localdomain" >> /etc/hosts

# docker
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce
systemctl start docker
systemctl enable docker
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose