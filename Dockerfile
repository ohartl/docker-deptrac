FROM php:7.2-alpine

MAINTAINER ohartl <hello@ohartl.de>

RUN curl -L http://get.sensiolabs.de/deptrac.phar -o /usr/local/bin/deptrac \
    && chmod +x /usr/local/bin/deptrac \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["deptrac"]
CMD ["analyze"]