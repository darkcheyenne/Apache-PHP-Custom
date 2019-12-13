#/bin/bash
logger Start von Erstellung von Docker Image Apache PHP Custom
docker build --pull -f Dockerfile.dockerhub -t darkcheyenne/apache-php-custom:latest . | grep 'built\|tagged' | logger
docker build --pull -f Dockerfile.github -t docker.pkg.github.com/darkcheyenne/apache-php-custom/apache-php-custom:latest . | grep 'built\|tagged' | logger

logger Upload von Apache PHP Custom zu Dockerhub
docker push darkcheyenne/apache-php-custom:latest
logger Upload von Apache PHP Custom zu Github
docker push docker.pkg.github.com/darkcheyenne/apache-php-custom/apache-php-custom:latest
