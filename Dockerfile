FROM nginx:stable-alpine

RUN mkdir -p /var/log/nc/ /usr/share/nginx/nc/ && \
    ln -sf /dev/stdout /var/log/nc/access.log

COPY nc-server.sh /nc-server.sh

CMD [ "/bin/sh", "/nc-server.sh" ]
