FROM nginx:1.15-alpine

EXPOSE 80 443


ENV SOURCE_HOST=localhost TARGET_HOST=localhost

STOPSIGNAL SIGTERM

CMD ["/docker.sh"]

RUN apk add --update openssl

COPY default-ssl.conf.tpl /tmp/default-ssl.conf.tpl
COPY docker.sh /docker.sh