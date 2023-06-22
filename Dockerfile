FROM golang:latest AS builder
WORKDIR /go/src/app
COPY . .
RUN go build -o /main main.go

FROM scratch
WORKDIR /
COPY --from=builder /main /main
EXPOSE 8080
ENTRYPOINT ["/main"]