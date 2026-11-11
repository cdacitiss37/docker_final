FROM eclipse-temurin:21-jdk
WORKDIR /ravi 
COPY . .
RUN javac demo.java
CMD ["java", "demo"]

