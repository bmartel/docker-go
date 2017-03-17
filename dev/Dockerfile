FROM golang:1.8-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN mkdir -p /go/src/app
WORKDIR /go/src/app

RUN go get github.com/codegangsta/gin && go get github.com/Masterminds/glide

ENV PORT 8080
EXPOSE 3000

CMD gin run
