FROM zenika/alpine-maven:3-jdk8

RUN apk update --no-cache && apk add gettext bash

COPY task.sh .

CMD ["sh", "task.sh"]