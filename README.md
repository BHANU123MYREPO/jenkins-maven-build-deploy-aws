# Spring PetClinic Sample Application  
# Modified By PAVAN KUMAR GUDIPATI

[![Java CI with Maven](https://github.com/spring-petclinic/spring-framework-petclinic/actions/workflows/maven-build.yml/badge.svg)](https://github.com/spring-petclinic/spring-framework-petclinic/actions/workflows/maven-build.yml)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=spring-petclinic_spring-framework-petclinic&metric=alert_status)](https://sonarcloud.io/dashboard?id=spring-petclinic_spring-framework-petclinic)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=spring-petclinic_spring-framework-petclinic&metric=coverage)](https://sonarcloud.io/dashboard?id=spring-petclinic_spring-framework-petclinic)

This project allows the Spring community to maintain a Petclinic version with a plain old **Spring Framework configuration**
and with a **3-layer architecture** (i.e. presentation --> service --> repository).
The "canonical" implementation is now based on Spring Boot, Thymeleaf and [aggregate-oriented domain]([https://github.com/spring-projects/spring-petclinic/pull/200). 


## Understanding the Spring Petclinic application with a few diagrams

[See the presentation here](http://fr.slideshare.net/AntoineRey/spring-framework-petclinic-sample-application) (2017 update)

## Running petclinic locally

### With Maven command line
```
git clone https://github.com/pavankumarindian/maven-1.git
cd spring-framework-petclinic
./mvnw jetty:run-war
# For Windows : ./mvnw.cmd jetty:run-war
```

### With Docker
```
docker run -p 8080:8080 springcommunity/spring-framework-petclinic
```

You can then access petclinic here: [http://localhost:8080/](http://localhost:8080/)

<img width="1042" alt="petclinic-screenshot" src="https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png">
