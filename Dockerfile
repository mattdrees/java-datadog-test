FROM openjdk:8
COPY target/datadog-test-0-SNAPSHOT.jar /usr/datadog-test.jar
COPY target/lib/dd-java-agent-0.21.1.jar /usr/dd-java-agent.jar
COPY run.sh /usr/
WORKDIR /usr/
CMD ["./run.sh"]
