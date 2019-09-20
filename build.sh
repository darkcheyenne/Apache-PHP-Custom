#/bin/bash
docker build --pull --no-cache -f Dockerfile -t docker.pkg.github.com/darkcheyenne/apache-php-custom/base:latest -t darkcheyenne/apache-php-custom:latest .

docker push darkcheyenne/apache-php-custom:latest
docker push docker.pkg.github.com/darkcheyenne/apache-php-custom/base:latest
