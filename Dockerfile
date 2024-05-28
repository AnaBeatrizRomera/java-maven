FROM maven:3.8.3-openjdk-17-slim AS builder

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn package

FROM openjdk:17-slim

COPY --from=builder /app/target/jarRepositories.xml /app/app.jar

CMD ["java", "-jar", "/app/app.jar"]
