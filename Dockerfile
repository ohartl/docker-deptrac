FROM php:7.3-alpine

LABEL maintainer="ohartl <hello@ohartl.de>"

ARG DEPTRAC_VERSION=0.6.0

RUN apk add --update --no-cache gnupg graphviz ttf-freefont \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/* \
    && cd /tmp \
    && curl -LS https://github.com/sensiolabs-de/deptrac/releases/download/$DEPTRAC_VERSION/deptrac.phar -o deptrac.phar \
    && curl -LS https://github.com/sensiolabs-de/deptrac/releases/download/$DEPTRAC_VERSION/deptrac.phar.asc -o deptrac.phar.asc \
    && gpg --keyserver pool.sks-keyservers.net --recv-keys 088B72897980555C6E4EF6693C52E7DED5E2D9EE \
    && gpg --verify deptrac.phar.asc deptrac.phar \
    && mv deptrac.phar /usr/local/bin/deptrac \
    && chmod +x /usr/local/bin/deptrac \
    && rm -rf deptrac.phar.asc /tmp/*

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["deptrac"]
CMD ["analyze"]
