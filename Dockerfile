FROM golang:1.15-alpine as builder
WORKDIR /src
COPY *.go .
RUN go get -d -v ./...
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/desafio

FROM scratch as final
WORKDIR /app
COPY --from=builder /go/bin/desafio .
CMD [ "./desafio" ]