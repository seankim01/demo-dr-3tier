#!/bin/bash
yum install -y httpd
systemctl start httpd
cp /usr/share/httpd/noindex/index.html /var/www/html/index.html