FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y maven
RUN apt-get install -y tomcat8
RUN apt-get install -y default-jdk
RUN mkdir /home/boxfuse
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/boxfuse
RUN cd /home/boxfuse/ && mvn package && cp /home/boxfuse/target/hello-1.0.war /var/lib/tomcat8/webapps
EXPOSE 8080
CMD ["tomcat8","run", "daemon off;"]
