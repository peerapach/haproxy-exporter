FROM golang:1.8

WORKDIR /go/src/app
COPY . .
RUN  go get -d -v  && go build

FROM ubuntu:xenial
WORKDIR /go
COPY --from=0 /go/src/app/app .
CMD ["./app"]
