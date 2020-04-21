#!/bin/bash

credhub login --skip-tls-validation

export ARTIFACTORY_USERNAME="$(credhub get -q -n /concourse/${CONCOURSE_TEAM}/artifactory-username)"
export ARTIFACTORY_PASSWORD="$(credhub get -q -n /concourse/${CONCOURSE_TEAM}/artifactory-password)"

envsubst < ../../settings.xml > temp.xml

mv temp.xml settings.xml

export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=128m"
mvn clean test -s settings.xml
