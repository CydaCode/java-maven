# FROM eclipse-temurin:21-jre-alpine
# EXPOSE 9000
# COPY ./target/java-maven-app-*.jar /usr/app/
# WORKDIR /usr/app
# CMD java -jar java-maven-app-*.jar


# ---------- STAGE 1: Build the JAR ----------
FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /app

COPY . .
RUN ./mvnw clean package -DskipTests

# ---------- STAGE 2: Light Runtime ----------
# Option A (lightest Temurin JRE)
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/java-maven-app-*.jar app.jar

EXPOSE 9000
CMD ["java", "-jar", "app.jar"]
