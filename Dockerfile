FROM golang:1.8-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN mkdir -p /go/src/app
WORKDIR /go/src/app

COPY build.sh /usr/local/bin/build

RUN chmod +x /usr/local/bin/build \
  && go get github.com/Masterminds/glide
