FROM golang:latest as builder

WORKDIR $GOPATH/src

COPY ./src/ .

RUN go mod init helderwmarcos/docker-golang && go build -o /go/bin/docker-golang
FROM scratch

COPY --from=builder /go/bin/docker-golang /go/bin/docker-golang

ENTRYPOINT [ "/go/bin/docker-golang" ]