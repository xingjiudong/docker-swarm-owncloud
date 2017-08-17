FROM owncloud

MAINTAINER xjd <25635680@qq.com>

RUN apt-get update && apt-get install -y gettext-base --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# SSL_CERTIFICATE information
ENV SSL_CERTIFICATE ssl_certificate_file
ENV SSL_CERTIFICATE_KEY ssl_certificate_key_file
ENV SSL_CERTIFICATE_CRT ssl_certificate_crt_file

# Copy configuration file
COPY setup.sh /setup.sh

CMD ["/setup.sh"]
