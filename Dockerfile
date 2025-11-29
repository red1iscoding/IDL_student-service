# Use OpenJDK 17
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the JAR file (we'll build it first)
COPY target/studentservice-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8081
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]