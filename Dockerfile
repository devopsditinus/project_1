FROM httpd:alpine
pip install opencv-python
COPY . /usr/local/apache2/htdocs/

