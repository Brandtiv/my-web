FROM ubuntu:latest

# Set timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Apache and PHP
RUN apt-get update && apt-get install -y apache2 && apt-get install -y php libapache2-mod-php

# Install MySQL client and server
# RUN apt-get install -y mysql-server mysql-client

# Install PHP extensions
RUN apt-get install -y \
    php-curl \
    php-gd \
    php-intl \
    php-mbstring \
    #php-mysql \
    php-soap \
    php-xml \
    php-zip

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy dist directory to web root
COPY dist /var/www/html

# Expose Apache port
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

