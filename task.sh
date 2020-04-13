#!/bin/bash

credhub login --skip-tls-validation

export ARTIFACTORY_USERNAME="$(credhub get -q -n /concourse/${CONCOURSE_TEAM}/artifactory-username)"
export ARTIFACTORY_PASSWORD="$(credhub get -q -n /concourse/${CONCOURSE_TEAM}/artifactory-password)"

ls -l

ls ../ -l

envsubst < ../../_actions/smarsh/build-with-maven-action/development/settings.xml > temp.xml

rm settings.xml

mv temp.xml settings.xml

mvn clean test -s settings.xml