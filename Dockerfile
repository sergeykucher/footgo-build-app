FROM maven:3.6.3-jdk-8
COPY ./pom.xml /footgo/
WORKDIR /footgo
ENV MAVEN_OPTS -Xmx512m
RUN mvn clean package
