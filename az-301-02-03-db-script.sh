#!/bin/sh
rpm -ivh https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
yum -y install mysql-community-server
systemctl start mysqld
systemctl enable mysqld
