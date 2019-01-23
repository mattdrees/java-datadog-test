#!/bin/bash

# note: DD_AGENT_HOST should be passed via docker args;
# otherwise they default to localhost
export DD_SERVICE_NAME="java-datadog-test"
export DD_TRACE_GLOBAL_TAGS="env:$ENVIRONMENT,container-hostname:$(hostname)"
export DD_JMXFETCH_ENABLED="true"
export DD_JMXFETCH_STATSD_HOST="/var/run/datadog/dsd.socket"
export DD_JMXFETCH_STATSD_PORT=0

echo "ENV for datadog:"
env | grep DD_

echo "datadog statsd unix domain socket:"
ls -la /var/run/datadog/dsd.socket

echo "id:"
id

exec java \
 -javaagent:/usr/dd-java-agent.jar \
 -jar datadog-test.jar;
