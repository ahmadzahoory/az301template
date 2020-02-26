#!/bin/sh
yum install -y wget
wget https://repo.mysql.com/mysql80-community-release-el8-1.noarch.rpm
yum localinstall mysql80-community-release-el8-1.noarch.rpm
yum install mysql-server
systemctl start mysqld
systemctl enable mysqld
