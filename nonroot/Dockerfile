FROM golang:1.7

COPY build.sh /usr/local/bin/build

RUN chmod +x /usr/local/bin/build \
  && go get github.com/Masterminds/glide \
  && echo "nobody:x:1:1:nobody:/:/bin/sh" >> /etc/passwd \
  && echo "nobody:x:1:" >> /etc/group
