#!/bin/sh
/opt/unit/sbin/unitd --control unix:/var/run/control.unit.sock --modules /opt/unit/build

curl -X PUT -d @/config.json --unix-socket /run/control.unit.sock http://localhost/

tail -f /var/log/unitd.log
