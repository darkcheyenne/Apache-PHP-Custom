#####################################
# BASIS: Aktuellstes Ubuntu Linux
#####################################
FROM darkcheyenne/docker-rolling-updated:latest

#####################################
# Installation von Software
#####################################
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:ondrej/apache2 && apt-get update && apt-get install -y php-curl ftp zip unzip php7.2-zip curl php7.2-common s3cmd php7.2-gd php-xml php-xml brotli memcached php-memcached nasm apache2 libapache2-mod-php7.2 php-fpm php7.2-mbstring php7.2-mysql wget && rm -rf /var/lib/apt/lists/* && rm -R /var/www/html/*

RUN a2dismod cache && a2dismod cache_disk


COPY ./my-log.conf /etc/apache2/conf-available/log.conf

#####################################
# Anpassung: Anpassen von Configrations-Dateien von PHP-Interpreter
#####################################
RUN sed -i 's/memory_limit = .*/memory_limit = '256M'/' /etc/php/7.2/apache2/php.ini
RUN sed -i 's/upload_max_filesize = .*/upload_max_filesize = '64M'/' /etc/php/7.2/apache2/php.ini
RUN sed -i 's/post_max_size = .*/post_max_size = '128M'/' /etc/php/7.2/apache2/php.ini
RUN cat /etc/php/7.2/apache2/php.ini | grep memory_limit && cat /etc/php/7.2/apache2/php.ini | grep upload_max_filesize && cat /etc/php/7.2/apache2/php.ini | grep post_max_size
RUN a2enconf log

#####################################
# Anpassung: Port-Freigaben
#####################################
EXPOSE 80
EXPOSE 443

#####################################
# Anpassung: Commando bei Ausführung
#####################################
CMD ["apachectl", "-D", "FOREGROUND"]
