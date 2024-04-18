# Use uma imagem base com suporte a Java
FROM adoptopenjdk/openjdk11:alpine-slim

# Diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o arquivo JAR do seu aplicativo para o contêiner
COPY target/your-app.jar /app/your-app.jar

# Comando para executar o aplicativo quando o contêiner iniciar
CMD ["java", "-jar", "your-app.jar"]