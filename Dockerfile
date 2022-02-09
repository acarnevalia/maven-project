FROM tomcat:latest

# Nel Tomcat9 aggiungo il war generato da Jenkins. Ci troviamo sotto il path: C:\Users\a.carnevali\.jenkins\workspace\PreDocker
ADD ./webapp/target/*.war /usr/local/tomcat/webapps/

# Port of Tomcat within the Docker Image. It is not the port of the Host.
EXPOSE 8080

CMD ["catalina.sh", "run"]
