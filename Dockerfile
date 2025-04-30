FROM alpine:latest

RUN apk add --no-cache openconnect tinyproxy

COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]