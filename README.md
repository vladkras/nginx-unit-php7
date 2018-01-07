## Docker NGINX Unit + PHP 7

### What is this?
Docker image with NGINX Unit and PHP 7 module installed.

### Features
* Ready to use - just run container and copy your files.
* Small - based on [alpine](https://hub.docker.com/_/alpine/) Linux it's smaller then images built from CentOS, Ubuntu and Debian.
* Extensible - only a few lines of code to start powerful php7 applications.

### Usage
Start it with

`docker run -d -p 80:8300 vladkras/nginx-unit-php7`

and open [http://localhost](http://localhost) - you'll see phpinfo(). To try your own files stop previous container and type:

`docker run -d --rm -p 80:8300 -v "/path/to/your/code:/app/default" vladkras/nginx-unit-php7`

`default` - is the name of this default app, so files are stored in `/app/default`. Check config.json and [official docs](https://unit.nginx.org/configuration/#configuration) for more info.

### Documentation
This image uses [vladkras/nginx-unit-base](https://hub.docker.com/r/vladkras/nginx-unit-base/) that already has git, curl and NGINX Unit installed from source. Dockerfile along with entrypoint.sh undergo these steps:

1. PHP is installed
2. Source code is located in `/unit` dir, that's why `WORKDIR` is changed first
3. PHP module is configured and installed for NGINX unit
4. unitd is launched with path to modules = $DESTDIR + "build"
5. config.json with default app is sent to control socket

### License
This package is licensed under [MIT License](https://github.com/vladkras/nginx-unit-php7/blob/master/LICENSE) and contains [NGINX Unit](https://www.nginx.com/products/nginx-unit/) licensed under [Apache License 2.0](https://github.com/nginx/unit/blob/master/LICENSE)
