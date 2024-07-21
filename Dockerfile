FROM nginx
RUN yum update -y
RUN echo "hello world" > /tmp/testfile
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz /opt
RUN tar -xvzf apache-tomcat-9.0.91.tar.gz -C /opt
WORKDIR /opt/apache-tomcat-9.0.91 /bin/
ENV name="jarvis"
EXPOSE 8080
CMD ["//catalina.sh", "run"]



##commands to run docker file
#docker build -t




