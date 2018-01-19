FROM tvial/docker-mailserver:latest

COPY ./config /tmp/docker-mailserver/

CMD supervisord -c /etc/supervisor/supervisord.conf
