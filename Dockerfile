FROM golang:1.7

COPY build.sh /usr/local/bin/build

RUN chmod +x /usr/local/bin/build \
  && go get github.com/Masterminds/glide
