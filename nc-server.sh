#!/usr/bin/env sh

NC_ACCESS_LOG_PATH=/var/log/nc/access.log
NC_INDEX_PATH=/usr/share/nginx/nc/index.html

echo "$(hostname) is living" > ${NC_INDEX_PATH}

while true; do
    printf 'HTTP/1.1 200 OK\n\n%s\n' "1111 $(cat ${NC_INDEX_PATH})" | nc -l -p 1111 >> ${NC_ACCESS_LOG_PATH};
done &

while true; do
    printf 'HTTP/1.1 200 OK\n\n%s\n' "2222 $(cat ${NC_INDEX_PATH})" | nc -l -p 2222 >> ${NC_ACCESS_LOG_PATH};
done &

while true; do
    printf 'HTTP/1.1 200 OK\n\n%s\n' "3333 $(cat ${NC_INDEX_PATH})" | nc -l -p 3333 >> ${NC_ACCESS_LOG_PATH};
done &

nginx -g 'daemon off;'


# while true; do curl http://localhost && sleep 0.5; done;