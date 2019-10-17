#!/bin/sh
sudo yum -y update
sudo yum install -y httpd
sudo service httpd start
sudo systemctl enable httpd.service
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload