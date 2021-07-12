FROM maven:3.8.1-openjdk-15-slim AS build
COPY src /spring-backend/src
COPY pom.xml /spring-backend/
RUN mvn -f /spring-backend/pom.xml clean package


FROM openjdk:14
COPY --from=build /spring-backend/target/spring-backend-0.0.1.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]