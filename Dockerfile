FROM alpine:latest

RUN apk update --no-cache && apk add wget gettext bash openjdk8 maven

COPY credhub /usr/bin/

RUN chmod +x /usr/bin/credhub

COPY task.sh /task.sh

CMD ["sh", "/task.sh"]