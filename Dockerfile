FROM openjdk:17-jdk-slim
WORKDIR /ravi 
COPY . .
RUN javac demo.java
CMD ["java", "demo"]

