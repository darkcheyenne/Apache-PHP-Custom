#/bin/bash
docker build --pull --no-cache -t darkcheyenne/apache-php-custom:20190510 .
docker build --pull --no-cache -t darkcheyenne/apache-php-custom:latest .

docker push darkcheyenne/apache-php-custom:20190510
docker push darkcheyenne/apache-php-custom:latest
