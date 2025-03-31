FROM openjdk:17-jdk-alpine
COPY target/poc-0.0.1-SNAPSHOT.jar poc.jar
CMD ["java","-jar","/poc.jar"]