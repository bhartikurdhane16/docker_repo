## Docker commands.

 -  docker run nginx                                   #it will run container in forground & we can not access in terminal 
  - docker run -d nginx                                #it will run the command in detach mode from background
  - docker ps                                     #it shows all running containers
  - docker ps -a                                  #Show all containers with state
  - docker inspect <container id>                 #shows detail information of container in jeson formate
  - docker inspect <container ip>                 #it host application on terminal(get ip fron json file).

## Container is running on isolated network , so we are unable to get application on external public network ie over internet 
## To run container on public network need to map port.
## By default container use bridge network.

## [map -p HOST_PORT:CONTAINER_PORT]   
here map port & need to whitlist port in security group of server

- docker run -d -p 8080:80 nginx                  #here we map container port 80 to host port 8080   
- hit <public_ip>:8080                                 # now nginx accessed over public network

 #-p : option use to map customized host port
 #-P : capital "P" automatically ramdom host port

- docker run -d -P httpd                           # -P assigin auto host port , whitelist port in SG 
- hit <public_ip>:<new_port>                            # accessable over public network 

  
 - docker images                                      #shows all images list
  
  ## create container
  syntax: docker run -d -p <host_port>:<>
 -  docker run -d -p 8081:80 --name=container1 nginx   #create container from nginx image with - customized port 8081

 - sudo docker run -d -P --name=container2 nginx    ---------------------------  create container with randome port

 - sudo docker exec -it <containerid/container name> <command>    ---------------- it exicute commands in container without enter in container

 -it: interactive mode
 exec : exicution 

 Ex.
 sudo docker exec -it e277bd3db71d ls


 - sudo docker exec -it <containerid/container_name> /bin/bash    ------------------ it enter in container

 Ex.
 sudo docker exec -it e277bd3db71d /bin/bash

 curl localhost     --------------- run current runing application inside container

 exit     ----------------------- to exit container & go on host terminal


 docker start/stop <container id>    # start /stop container , we can also start exited(0) containers

 docker ps -q   # shows only running container id

 docker kill <container_id>    # stop running container forcefully  with exit code (137)  , we can restrat using start command 

docker kill 'docker ps -q'   # it kill/terminalte all running containers ----not refered to use this command in real time  ----we can not retrive/start killed containers 

docker rm <container_id>  # remove process from deamon as well , we can not start container again  # cant apply on running containr , need to stop container first

docker logs <container_id>    # shows container logs

docker top <container_id>      # shows processess of running container

## we can also copy the deployment file from local host m/c to container

#copy file/directory from local host to container
suntax: docker cp <option><file path><container_id>:<destination path>
Ex. docker cp /home/ubuntu/test.txt b1ba3fc515c2:/home/test.txt     # here we copy file from local system to container 

#copy file/directory from  container to local system
suntax: docker cp <option> <container_id>:<source_path> <destination_path>

Ex. docker cp b1ba3fc515c2:/home/123.txt /home/ubuntu/123.txt

















  


 



