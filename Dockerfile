FROM ubuntu                                ###FROM alpine----multi-stage build
RUN apt update -y
RUN apt install nginx -y
RUN echo "hello world" > /var/testfile
ENV name="test"
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz /opt
RUN tar -xvzf apache-tomcat-9.0.91.tar.gz -C /opt
WORKDIR /opt/apache-tomcat-9.0.91 /bin/
ENV name="jarvis"
EXPOSE 8080
CMD ["/catalina.sh", "run"]       #start Apache Tomcat, argument to run tomcat in forground
 













#Multistage build
# Stage 1: Build
FROM node:18 AS builder   #node module as image builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Stage 2: Final
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html


# Step3 : combine run command to minimize layer
# Bad
RUN apt-get update
RUN apt-get install -y curl

# Better
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*



#remove unused files
RUN apt-get update && apt-get install -y \
    curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


 
#FROM ubuntu       
#RUN apt update -y
#RUN apt install default-jre -y
#RUN apt install openjdk-11-jdk -y
#RUN echo "hello world" > /tmp/testfile
#RUN apt install nginx -y
#ENV name="test"







#Create docker volume
VOLUME ["/myvolume"]
#sudo docker run -it --name container2 --privileged=true --volumes-from mynewcont ubuntu /bin/bash -----here we created container2 with shared volume from mynewcontainer, ie my newcont already have volume and container2 is able to check /update data in that volume


##commands to run docker file
#docker build -t <imagename> .  ------to build docker image
# ex.  docker build -t testimage .
#docker images 
#docker run -d -P --name=<containername> testimage   OR  docker run -it --name <container name> testimage 
#docker ps -a
#docker attach container name------insert in container
#docker diff container name ------see the changes made in that container
#docker commit containername imagename ------create image from docker container








