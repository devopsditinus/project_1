FROM httpd:alpine
COPY . /usr/local/apache2/htdocs/

RUN set -xe \
    && apt-get update -y \
    && apt-get install -y python3-pip

