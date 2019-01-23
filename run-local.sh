#!/bin/bash
export ENVIRONMENT=localhost

export DD_AGENT_HOST="datadog-apm.aws.cru.org"
export DD_SERVICE_NAME="java-datadog-test"
export DD_TRACE_GLOBAL_TAGS="env:$ENVIRONMENT,container-hostname:$(hostname)"
export DD_JMXFETCH_ENABLED="true"
export DD_JMXFETCH_STATSD_HOST="localhost"
export DD_JMXFETCH_STATSD_PORT=8125

echo "ENV for datadog:"
env | grep DD_

#echo "datadog statsd unix domain socket:"
#ls -la /var/run/datadog/dsd.socket

echo "id:"
id

exec java \
 -javaagent:target/lib/dd-java-agent-0.21.1.jar \
 -jar target/datadog-test-0-SNAPSHOT.jar;
