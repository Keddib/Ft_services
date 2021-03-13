FROM alpine

EXPOSE 80

RUN apk update && apk add nginx

WORKDIR /src

COPY ./src/* .

RUN ./conf.sh

ENTRYPOINT ["nginx"]
