FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk curl -y  # Install curl and openjdk

# Download the PostgreSQL JDBC driver
RUN curl -L https://jdbc.postgresql.org/download/postgresql-42.3.6.jar -o /usr/share/java/postgresql-jdbc.jar

COPY . .

RUN apt-get install maven -y
RUN mvn clean install 

FROM openjdk:17-jdk-slim

EXPOSE 8080

COPY --from=build /target/deploy_render-1.0.0.jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]
