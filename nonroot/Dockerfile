FROM golang:1.10-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN mkdir -p /go/src/app
WORKDIR /go/src/app

COPY build.sh /usr/local/bin/build

RUN chmod +x /usr/local/bin/build \
  && go get github.com/Masterminds/glide \
  && echo "nobody:x:1:1:nobody:/:/bin/sh" >> /etc/passwd \
  && echo "nobody:x:1:" >> /etc/group

USER nobody
