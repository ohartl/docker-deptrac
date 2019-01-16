FROM php:7.3-alpine

LABEL maintainer="ohartl <hello@ohartl.de>"

ARG DEPTRAC_VERSION=0.4.0

RUN apk add --update --no-cache graphviz ttf-freefont \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/* \
    && cd /tmp \
    && curl -LS https://github.com/sensiolabs-de/deptrac/releases/download/$DEPTRAC_VERSION/deptrac.phar -o deptrac.phar \
    && curl -LS https://github.com/sensiolabs-de/deptrac/releases/download/$DEPTRAC_VERSION/deptrac.version -o deptrac.version \
    && sha1sum -cs deptrac.version \
    && mv deptrac.phar /usr/local/bin/deptrac \
    && chmod +x /usr/local/bin/deptrac \
    && rm -rf /tmp/*

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["deptrac"]
CMD ["analyze"]