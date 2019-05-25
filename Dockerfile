FROM vladkras/nginx-unit-base:latest

RUN apk add --update --no-cache php7-dev php7-embed

WORKDIR /unit

RUN ./configure php --module=php71
RUN make install

COPY index.php /app/default/index.php
COPY config.json /config.json

RUN mkdir -p state/certs/

EXPOSE 8300

CMD ["/opt/unit/sbin/unitd", "--no-daemon", "--control", "unix:/var/run/control.unit.sock", "--modules", "/opt/unit/modules"]
