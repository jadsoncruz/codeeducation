FROM golang:1.15-alpine as builder
WORKDIR /src
COPY *.go .
RUN go mod init desafio && \
    go build && \
    go install

FROM scratch as final
WORKDIR /app
COPY --from=builder /go/bin/desafio .
CMD [ "./desafio" ]