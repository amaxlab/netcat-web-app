#!/bin/bash

/etc/init.d/sshd start
/etc/init.d/mysqld start

set -e

rm -f /var/run/httpd/httpd.pid

exec httpd -DFOREGROUND
