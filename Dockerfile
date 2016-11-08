FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y php5
RUN apt-get install -y libapache2-mod-php5
RUN apt-get install -y git nano
RUN git clone https://github.com/tozo07/retwis /var/www/html/retwis
RUN apt-get install -y php5-redis
RUN sed -i -e 's/127.0.0.1/redis/g' /var/www/html/retwis/Predis/Connection/ConnectionParameters.php

VOLUME /var/www/html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]