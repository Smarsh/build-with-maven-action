FROM alpine:latest

RUN apk update --no-cache && apk add wget gettext bash 

COPY credhub /usr/bin/

RUN chmod +x /usr/bin/credhub

COPY settings.xml /settings.xml

COPY task.sh /task.sh

CMD ["sh", "/task.sh"]