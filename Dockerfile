FROM centos:6.6
MAINTAINER "Egor Zyuskin" <ezyuskin@amaxlab.ru>
RUN yum -y install httpd php mysql-server php-gd php-xml php-mysql php-mbstring curl wget openssh-server
RUN useradd www-data && usermod -a -G www-data apache
ADD ./home/ /home/
ADD ./root/ /root/
ADD ./etc/ /etc/
RUN chmod -R 700 /root/.ssh/ /etc/ssh/* /home/www-data/.ssh && chown -R apache:www-data /var/www/html && chown -R www-data:www-data /home/www-data
VOLUME ["/var/www/html", "/var/log/httpd", "/var/lib/mysql"]
EXPOSE 80 22
CMD ["/root/init.sh"]
