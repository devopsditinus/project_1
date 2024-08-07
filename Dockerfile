FROM httpd:alpine
RUN pip install opencv-python
COPY . /usr/local/apache2/htdocs/

