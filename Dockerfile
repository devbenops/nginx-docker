FROM alpine:3.8

LABEL Maintainer="Nithin <nithinbenny444@gmail.com>"

RUN apk update \
    && apk add --no-cache nginx

ADD nginx-app/nginx.conf /etc/nginx/nginx.conf
ADD nginx-app/vhost.conf /etc/nginx/conf.d/default.conf


WORKDIR /var/www



ADD nginx-app/nginx-common/ /etc/nginx/common/
ADD nginx-app/error/ /usr/share/nginx/html/

COPY nginx-app/start.sh /opt/start.sh

RUN chown -R nobody:nobody /var/tmp/ \
     && chmod 755 /opt/start.sh

EXPOSE 80

ENTRYPOINT ["/opt/start.sh"]
