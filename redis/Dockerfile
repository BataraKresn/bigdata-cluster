FROM redis

LABEL Description="This is the redis DB used for bigdata cluster frameworks;E.g:Celery Backend etc.." \
      Author="Semesta Arus <bigdata0124@gmail.com>"

COPY healthcheck.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/healthcheck.sh


HEALTHCHECK CMD ["healthcheck.sh"]