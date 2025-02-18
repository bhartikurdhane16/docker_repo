FROM ubuntu
RUN apt update -y
RUN apt install default-jre -y
RUN apt install openjdk-11-jdk -y
RUN echo "hello world" > /tmp/testfile
RUN apt install nginx -y



#ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz /opt
#RUN tar -xvzf apache-tomcat-9.0.91.tar.gz -C /opt
#WORKDIR /opt/apache-tomcat-9.0.91 /bin/
#ENV name="jarvis"
#EXPOSE 8080
#CMD ["/catalina.sh", "run"]



##commands to run docker file
#docker build -t <imagename> .  ------to build docker image
# ex.  docker build -t testimage .
#docker images 
#docker run -d -P --name=<containername> testimage   OR  docker run -it --name <container name> testimage 
#docker ps -a
#docker attach container name------insert in container
#docker diff container name ------see the changes made in that container
#docker commit containername ------create 








