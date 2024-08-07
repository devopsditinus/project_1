FROM httpd:2.4
RUN pip3 install opencv-python
COPY . /usr/local/apache2/htdocs/

