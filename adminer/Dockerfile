# https://raw.githubusercontent.com/soedomoto/sqlsrv-php-oauth2-server/master/adminer-sqlsrv/Dockerfile

FROM php:7.0

RUN apt update && apt install -y apt-transport-https git

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/8/prod.list > \
        /etc/apt/sources.list.d/mssql-release.list

RUN apt update && apt install -y \
        freetds-bin \
        freetds-dev \
        freetds-common \
        libct4 \
        libsybdb5 \
        tdsodbc \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libldap2-dev \
        zlib1g-dev \
        libc-client-dev

ENV ACCEPT_EULA Y
RUN apt install -y msodbcsql mssql-tools unixodbc unixodbc-dev

RUN ln -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/

RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_dblib
RUN apt install -y libpq-dev
RUN docker-php-ext-install pdo_pgsql

RUN pecl install sqlsrv
RUN echo "extension=sqlsrv.so" >> /usr/local/etc/php/conf.d/sqlsrv.ini
RUN pecl install pdo_sqlsrv
RUN echo "extension=pdo_sqlsrv.so" >> /usr/local/etc/php/conf.d/pdo_sqlsrv.ini

RUN apt install -y locales
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen

# RUN	addgroup adminer \
# &&	adduser --system --group adminer adminer \
# &&	mkdir -p /var/www/html \
# &&	mkdir -p /var/www/html/plugins-enabled \
# &&	chown -R adminer:adminer /var/www/html

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

COPY	*.php /var/www/html/

ENV	ADMINER_VERSION 4.6.2
ENV	ADMINER_DOWNLOAD_SHA256 8c68ecabff07ea2207a9a8a634966cf0da8c20ab8299148329b0bff44d6174d7
ENV	ADMINER_SRC_DOWNLOAD_SHA256 ecd89a033d8561ffa65edd305cd18eec7538d8632e82dcec32cb9e2b05572f58

RUN	set -x \
&&	curl -fsSL https://github.com/vrana/adminer/releases/download/v$ADMINER_VERSION/adminer-$ADMINER_VERSION-en.php -o adminer.php \
  #&&	echo "$ADMINER_DOWNLOAD_SHA256  adminer.php" |sha256sum -c - \
&&	curl -fsSL https://github.com/vrana/adminer/archive/v$ADMINER_VERSION.tar.gz -o source.tar.gz \
  #&&	echo "$ADMINER_SRC_DOWNLOAD_SHA256  source.tar.gz" |sha256sum -c - \
&&	tar xzf source.tar.gz --strip-components=1 "adminer-$ADMINER_VERSION/designs/" "adminer-$ADMINER_VERSION/plugins/" \
&&	rm source.tar.gz

# COPY	entrypoint.sh /usr/local/bin/
# ENTRYPOINT	[ "entrypoint.sh", "docker-php-entrypoint" ]

# RUN a2enmod rewrite

# USER adminer
CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www/html" ]
