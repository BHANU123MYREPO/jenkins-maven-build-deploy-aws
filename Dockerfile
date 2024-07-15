
# Use an official Apache Maven image as a base for building the WAR file
FROM maven:3.8.1-jdk-11-slim AS build

# Copy the Maven project into the container
COPY . /build

# Set the working directory to the Maven project directory
WORKDIR /build

# Build the Maven project (assuming 'pom.xml' is present in the root directory)
RUN mvn clean package

# Use an official Apache Tomcat image as a base for runtime
FROM tomcat:8.5-jre8-alpine

# Copy the built WAR file from the Maven build stage to Tomcat's webapps directory
COPY --from=build /build/target/petclinic.war /usr/local/tomcat/webapps/

# Expose port 8080 (Tomcat's default port)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

