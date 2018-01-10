FROM vladkras/nginx-unit-base

RUN apk add --update --no-cache php7-dev php7-embed

WORKDIR /unit

RUN ./configure php --module=php71
RUN make install

COPY index.php /app/default/index.php
COPY config.json /config.json
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8300

CMD /entrypoint.sh
