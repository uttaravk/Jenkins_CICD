FROM openjdk:8
ADD WebApp.jar WebApp2.jar
EXPOSE 8085
CMD ["java", "-jar", "WebApp2.jar"]
