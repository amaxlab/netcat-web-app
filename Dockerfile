FROM centos:6.6
MAINTAINER "Egor Zyuskin" <ezyuskin@amaxlab.ru>
RUN yum -y install httpd php mysql-server php-gd php-xml php-mysql php-mbstring curl wget openssh-server
RUN mkdir /root/.ssh && useradd www-data && usermod -a -G www-data apache
ADD ./init.sh /root/
ADD ./etc/ssh/ /etc/ssh/
ADD ./etc/httpd/ /etc/httpd/
ADD ./etc/php.d/ /etc/php.d/
ADD ./etc/php.ini /etc/
ADD ./etc/my.cnf /etc/
ADD ./root/.ssh/authorized_keys /root/.ssh/
RUN chmod 700 /root/.ssh/ /etc/ssh/* && chown -R apache:www-data /var/www/html
VOLUME ["/var/www/html", "/var/log/httpd", "/var/lib/mysql"]
EXPOSE 80 22
CMD ["/root/init.sh"]
