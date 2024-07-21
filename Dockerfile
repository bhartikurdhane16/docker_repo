FROM nginx
RUN yum update -y
RUN echo "hello world" > /tmp/testfile
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip



