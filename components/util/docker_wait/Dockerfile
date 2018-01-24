FROM alpine:latest

USER root

RUN apk add --no-cache bash
RUN apk add --no-cache openrc
RUN apk add --no-cache docker \
    && rc-update add docker boot

COPY wait-for-it.sh /tmp

RUN chmod +x /tmp/wait-for-it.sh
