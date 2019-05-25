## Docker NGINX Unit + PHP 7

### What is this?
Docker image with NGINX Unit and PHP 7 module installed.

### Features
* Ready to use - just run container and copy your files.
* Small - based on [alpine](https://hub.docker.com/_/alpine/) Linux it's smaller then images built from CentOS, Ubuntu and Debian.
* Extensible - only a few lines of code to start powerful php7 applications.

### Usage
1. Start it with

```
$ docker run -dit -p 80:8300 --name unit vladkras/nginx-unit-php7
```
2. Configure php
```
$ docker exec unit curl -X PUT -d @/config.json --unix-socket /run/control.unit.sock http://localhost/config/

```

and open [http://localhost](http://localhost) - you'll see phpinfo(). To try your own files add:

`-v "/path/to/your/code:/app/default"`

`default` - is the name of this default app, so files are stored in `/app/default`. Check config.json and [official docs](https://unit.nginx.org/configuration/#configuration) for more info.

### Build

```
$ git clone https://github.com/vladkras/nginx-unit-php7.git
$ cd nginx-unit-php7
$ docker pull vladkras/nginx-unit-base:latest
```
now modify config.json and

```
$ docker build -t vladkras/nginx-unit-php7 .
```
Don't forget to send [config.json](https://github.com/vladkras/nginx-unit-php7/blob/master/config.json) to [Unit’s control API](https://unit.nginx.org/configuration/)

### Documentation
This image uses [vladkras/nginx-unit-base](https://hub.docker.com/r/vladkras/nginx-unit-base/) that already has git, curl and NGINX Unit installed from source. Dockerfile along with entrypoint.sh undergo these steps:

1. PHP is installed
2. Source code is located in `/unit` dir, that's why `WORKDIR` is changed first
3. PHP module is configured and installed for NGINX unit
4. unitd is launched with path to modules = [$DESTDIR](https://github.com/vladkras/nginx-unit-base/blob/master/Dockerfile#L3) + "modules"


### License
This package is licensed under [MIT License](https://github.com/vladkras/nginx-unit-php7/blob/master/LICENSE) and contains [NGINX Unit](https://www.nginx.com/products/nginx-unit/) licensed under [Apache License 2.0](https://github.com/nginx/unit/blob/master/LICENSE)
