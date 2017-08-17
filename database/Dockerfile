FROM nginx

MAINTAINER xjd <25635680@qq.com>

RUN apt-get update 

ENV SERVER_NAME localhost
ENV SERVER_A serverip
ENV SERVER_B serverip
ENV SERVER_C serverip
ENV SERVER_PORT 8443
ENV SSL_CERTIFICATE ssl_certificate_file  
ENV SSL_CERTIFICATE_KEY ssl_certificate_key_file 

# Copy configuration file
COPY mysite.template /etc/nginx/conf.d
COPY setup.sh /setup.sh

CMD ["/setup.sh"]

