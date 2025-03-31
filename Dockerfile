FROM maven:3.8.5-openjdk-17-slim AS builder
WORKDIR /cloudrun-app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /cloudrun-app
COPY --from=builder /cloudrun-app/target/*.jar cloudrun-app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","cloudrun-app.jar"]