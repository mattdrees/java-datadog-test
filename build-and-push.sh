#!/bin/bash

mvn package;
docker build -t java-datadog-test .
docker tag java-datadog-test 056154071827.dkr.ecr.us-east-1.amazonaws.com/java-datadog-test
docker push 056154071827.dkr.ecr.us-east-1.amazonaws.com/java-datadog-test
