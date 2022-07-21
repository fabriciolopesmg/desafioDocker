FROM golang:alpine3.15 as builder

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -o /server



FROM scratch

WORKDIR /

COPY --from=builder /server /server

EXPOSE 8080

ENTRYPOINT ["/server"]