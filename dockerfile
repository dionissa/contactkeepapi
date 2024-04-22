FROM openjdk:17-slim AS build

RUN apt-get update && apt-get install maven -y

COPY . .

RUN mvn clean install

FROM openjdk:17-jdk-slim

EXPOSE 8080

COPY --from=build /target/deploy_render-1.0.0.jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]