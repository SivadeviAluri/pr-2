FROM openjdk:11
COPY target/java-app1.0.jar app.jar
CMD ["java", "-jar" "app.jar"]
