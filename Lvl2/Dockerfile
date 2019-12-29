FROM alpine:3.7
RUN apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/main/ nodejs=8.9.3-r1
RUN apk add --update nodejs nodejs-npm
RUN apk add chromium xvfb
ADD scripts/xvfb-chrome /usr/bin/xvfb-chrome
ADD package.json /tmp/package.json
RUN ln -sf /usr/bin/xvfb-chrome /usr/bin/google-chrome \
    && npm install /tmp
ENV CHROME_BIN /usr/bin/google-chrome

USER root