FROM php:8.0-alpine

LABEL maintainer="ohartl <hello@ohartl.de>"

ARG DEPTRAC_VERSION=0.12.0
ARG DEPTRAC_GPG_KEY=ED42E9154E81A416E7FBA19F4F2AB4D11A9A65F7
ARG GPG_KEY_SERVER=hkps://keys.openpgp.org

RUN apk add --update --no-cache gnupg graphviz ttf-freefont \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/* \
    && cd /tmp \
    && curl -LS https://github.com/qossmic/deptrac/releases/download/$DEPTRAC_VERSION/deptrac.phar -o deptrac.phar \
    && curl -LS https://github.com/qossmic/deptrac/releases/download/$DEPTRAC_VERSION/deptrac.phar.asc -o deptrac.phar.asc \
    && gpg --keyserver $GPG_KEY_SERVER --recv-keys $DEPTRAC_GPG_KEY \
    && gpg --verify deptrac.phar.asc deptrac.phar \
    && mv deptrac.phar /usr/local/bin/deptrac \
    && chmod +x /usr/local/bin/deptrac \
    && rm -rf deptrac.phar.asc /tmp/*

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["deptrac"]
CMD ["analyze"]
