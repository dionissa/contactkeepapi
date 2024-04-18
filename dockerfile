# Use uma imagem base com suporte ao Maven
FROM maven:3.8.4-openjdk-11 AS build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos de configuração do Maven para o contêiner
COPY pom.xml .

# Baixa as dependências do Maven para que elas sejam armazenadas em cache
RUN mvn dependency:go-offline -B

# Copia o restante dos arquivos do projeto para o contêiner
COPY src ./src

# Compila o projeto e gera o arquivo JAR
RUN mvn package -DskipTests

# Use uma imagem base com suporte ao Java para executar o aplicativo
FROM adoptopenjdk/openjdk11:alpine-slim

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo JAR gerado a partir do estágio de construção anterior para este contêiner
COPY --from=build /app/target/your-app.jar .

# Comando para executar o aplicativo quando o contêiner iniciar
CMD ["java", "-jar", "your-app.jar"]
