FROM httpd:alpine
COPY . /usr/local/apache2/htdocs/

RUN set -xe \
    && apt-get update \
    && apt-get install python3-pip
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

