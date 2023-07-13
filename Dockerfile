FROM  centos:latest
MAINTAINER gitaitsolutions@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/giftos.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip giftos.zip
RUN cp -rvf giftos-html/* .
RUN rm -rf giftos-html giftos.zip 
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
 
 
  
