[root@techlama002 containers]# cat Dockerfile 
FROM centos:centos7
RUN yum install java -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.65.tar.gz
RUN mv apache-tomcat-9.0.65/* /opt/tomcat
EXPOSE 8080
COPY ./webapp.war /opt/tomcat/webapps
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
[root@techlama002 containers]# 


Buil Docker image with above Dockerfile.
 $ cd /containers; docker build -t mytomcat .

OR with full path of dockerfile : 
  $ cd /containers; docker build -t mytmcat -f <full path> .

run docker conatainer with the above image:
 $ docker run -d --name demo-container -p 8081:8080 mytomcat

open port 8080 if this is being run on cloud platform.
