FROM eclipse-temurin:21-jre-alpine
EXPOSE 9000
COPY ./target/java-maven-app-*.jar /usr/app/
WORKDIR /usr/app
CMD java -jar java-maven-app-*.jar

