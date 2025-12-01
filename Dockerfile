# Stage 1: Build stage
FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Runtime stage
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the built JAR from builder stage
COPY --from=builder /app/target/studentservice-0.0.1-SNAPSHOT.jar app.jar

# Expose port (Render will override this)
EXPOSE 8080

# Run the application with dynamic port support
ENTRYPOINT ["java", "-jar", "app.jar", "--server.port=${PORT:8080}"]