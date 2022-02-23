ENTRYPOINT ["/bin/bash"]
RUN apt update -y
RUN apt-get install openjdk-8-jdk -y
RUN java -version
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58.tar.gz /home/
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat/

RUN mv /home/apache-tomcat-9.0.58.* /opt/tomcat/
RUN mv apache-tomcat-9.0.58.* apache-tomcat
RUN tar -xvf apache-tomcat

WORKDIR /opt/tomcat/apache-tomcat-9.0.58/
RUN ls
COPY /var/jenkins_home/workspace/k8s-pipeline-job@2/target/*.war /opt/tomcat/apache-tomcat-9.0.58/webapps/

EXPOSE 8090
CMD ["/opt/tomcat/apache-tomcat-9.0.58/bin/catalina.sh","run"]
