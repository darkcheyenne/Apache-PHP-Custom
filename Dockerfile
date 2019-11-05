#####################################
# BASIS: Aktuellstes Ubuntu Linux
#####################################
FROM darkcheyenne/docker-rolling-updated:latest

#####################################
# Installation von Software
#####################################
RUN apt-get install -y software-properties-common \
&& apt-get install -y php-curl ftp zip unzip php-zip curl php-common s3cmd php-gd php-xml php-xml brotli memcached php-memcached nasm apache2 libapache2-mod-php php-mbstring php-mysql wget \
&& rm -R /var/www/html/* \
&& a2dismod cache && a2dismod cache_disk \
&& sed -i 's/LogFormat/#LogFormat/g' /etc/apache2/apache2.conf


COPY ./my-log.conf /etc/apache2/conf-available/log.conf

#####################################
# Anpassung: Anpassen von Configrations-Dateien von PHP-Interpreter
#####################################
RUN sed -i 's/memory_limit = .*/memory_limit = '256M'/' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/upload_max_filesize = .*/upload_max_filesize = '64M'/' /etc/php/7.3/apache2/php.ini \
&& sed -i 's/post_max_size = .*/post_max_size = '128M'/' /etc/php/7.3/apache2/php.ini \
&& cat /etc/php/7.3/apache2/php.ini | grep memory_limit && cat /etc/php/7.3/apache2/php.ini | grep upload_max_filesize && cat /etc/php/7.3/apache2/php.ini | grep post_max_size \
&& a2enconf log

#####################################
# Anpassung: Port-Freigaben
#####################################
EXPOSE 80 443

#####################################
# Anpassung: Commando bei Ausführung
#####################################
CMD ["apachectl", "-D", "FOREGROUND"]
