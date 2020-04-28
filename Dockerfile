FROM ubuntu:latest

RUN apt-get update && apt-get install -y openjdk-8-jdk maven wget gettext

RUN wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.7.0/credhub-linux-2.7.0.tgz && \
    tar xf credhub*.tgz -C /usr/local/bin && \
    chmod +x /usr/local/bin/credhub

COPY settings.xml /settings.xml

COPY task.sh /task.sh

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

ENTRYPOINT [ "/task.sh" ]