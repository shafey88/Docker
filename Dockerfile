FROM ubuntu:16.04
RUN apt-get update && apt-get install -y git default-jdk maven tomcat8 
RUN mkdir /home/boxfuse
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/boxfuse
WORKDIR /home/boxfuse/
RUN mvn package && cp /home/boxfuse/target/hello-1.0.war /var/lib/tomcat8/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]
