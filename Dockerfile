# Multi-stage Dockerfile: build with Maven, run on a slim JRE
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /workspace

# copy pom and sources
COPY pom.xml ./
COPY src ./src

# build the jar (skip tests to keep image quick)
RUN mvn -B -DskipTests package

# Runtime image
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy jar from build stage (assumes single jar in target)
COPY --from=build /workspace/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
