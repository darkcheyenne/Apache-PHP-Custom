#/bin/bash
echo 🚀 Start von Erstellung von Docker Image Apache PHP Custom
echo "  🔧 Baue Image für Docker-Hub"
docker build --no-cache --pull -f Dockerfile.dockerhub -t darkcheyenne/apache-php-custom:latest .
echo "  🔧 Baue Image für GitHub"
docker build --no-cache --pull -f Dockerfile.github -t docker.pkg.github.com/darkcheyenne/apache-php-custom/apache-php-custom:latest .

echo "  🛰 Upload von Apache PHP Custom zu Dockerhub"
docker push darkcheyenne/apache-php-custom:latest
echo "  🛰 Upload von Apache PHP Custom zu Github"
docker push docker.pkg.github.com/darkcheyenne/apache-php-custom/apache-php-custom:latest
