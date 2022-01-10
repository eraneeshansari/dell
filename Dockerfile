FROM ubuntu:latest
ENV DEBIAN_FRONTEND nonineractive
RUN apt update && apt install apache2 -y
ADD web.tar.gz /var/www/html/ 
WORKDIR /var/www/html/
#RUN mkdir -p /var/run/apache2
#RUN chown -R www-data:www-data /var/run/apache2
#RUN chown -R www-data:www-data  /var/log/apache2/
#RUN chown -R www-data:www-data /var/log/apache2/
EXPOSE 80
#user www-data
ENTRYPOINT ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
