#/bin/bash
docker build --pull --no-cache -t darkcheyenne/apache-php-custom:latest -t docker.pkg.github.com/darkcheyenne/apache-php-custom/base:latest .

docker push darkcheyenne/apache-php-custom:latest
docker push docker.pkg.github.com/darkcheyenne/apache-php-custom/base:latest
