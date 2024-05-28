FROM maven:3.8.3-openjdk-17-slim AS builder

WORKDIR /app


RUN mvn dependency:go-offline

COPY . /target

RUN mvn packag

FROM openjdk:17-slim



CMD ["java", "-jar", "/app/app.jar"]
