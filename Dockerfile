FROM openjdk:8
WORKDIR /usr/
COPY target/lib/dd-java-agent-0.21.1.jar /usr/dd-java-agent.jar
COPY run.sh /usr/
CMD ["./run.sh"]
COPY target/datadog-test-0-SNAPSHOT.jar /usr/datadog-test.jar
