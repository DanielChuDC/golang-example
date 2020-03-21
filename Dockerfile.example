# Take from https://medium.com/@uxioandrade/implementing-session-caching-in-go-with-gin-sessions-redis-and-docker-838608f6cca
# Last build size was 996MB, which having 809MB as golang:latest
FROM golang:latest

ENV GO111MODULE=on

WORKDIR /app

COPY ./go.mod .
COPY ./go.sum .

RUN go mod download

COPY . .
CMD ["go","run","main.go"]