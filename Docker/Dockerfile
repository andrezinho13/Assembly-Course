FROM jenkins/jenkins

USER root
RUN apt-get update && apt-get -y install lsb-release
RUN apt -y install lsb-release apt-transport-https ca-certificates
RUN apt-get install apache2 php libapache2-mod-php
RUN apt-get install php-soap php-xml php-curl php-opcache php-gd php-sqlite3 php-mbstring
RUN apt install composer
RUN apt-get update && apt-get upgrade

