FROM eclipse-temurin:17-jre
COPY target/java-ci-cd-demo-1.0.0.jar /app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]
