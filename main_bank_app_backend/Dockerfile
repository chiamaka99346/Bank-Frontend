# Use the khipu/openjdk17-alpine base image
FROM khipu/openjdk17-alpine

# Set the working directory inside the container.
WORKDIR /app

# Copy the pom.xml and any other necessary files for building the application
COPY pom.xml /app/pom.xml

# Copy the source code into the container
COPY src /app/src

# Install Maven (if not already included in the base image)
RUN apk add --no-cache maven

# Package the application using Maven
RUN mvn clean package -DskipTests

# Run the application
CMD ["java", "-jar", "target/online-banking-system-0.0.1-SNAPSHOT.jar"]
