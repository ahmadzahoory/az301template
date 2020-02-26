#!/bin/sh
yum -y update
yum install -y httpd
yum install -y unzip
yum install -y wget
service httpd start
systemctl enable httpd.service
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload
cd /var/www/html/
wget https://raw.githubusercontent.com/ahmadzahoory/az301template/master/website-code-M02-03.zip
unzip website-code-M02-03.zip

