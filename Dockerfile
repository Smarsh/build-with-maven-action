FROM alpine:latest

RUN apk update --no-cache && apk add gettext bash openjdk8 maven

COPY task.sh /task.sh

CMD ["sh", "/task.sh"]