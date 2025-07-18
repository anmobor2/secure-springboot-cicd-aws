# Use a base image with Java 17
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven build output
COPY target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]