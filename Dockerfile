FROM centos:latest

ENV USERNAME=admin \
    MYPASSWORD=password

RUN yum update -y

RUN yum -y install httpd

COPY index.html /var/www/html/

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
