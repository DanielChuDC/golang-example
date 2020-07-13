# https://blog.golang.org/docker
# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
# FROM s390x/golang:1.14-alpine

############################
# STEP 1 build executable binary
############################
# golang alpine 1.13.5
FROM golang@sha256:0991060a1447cf648bab7f6bb60335d1243930e38420bee8fec3db1267b84cfa as builder

ENV GO111MODULE=on

# Install git + SSL ca certificates.
# Git is required for fetching the dependencies.
# Ca-certificates is required to call HTTPS endpoints.
# Else you will get error => local error: tls: bad record MAC 
RUN apk update && apk add --no-cache git ca-certificates tzdata && update-ca-certificates


# Create appuser
ENV USER=appuser
ENV UID=10001

# Install git + SSL ca certificates.
# Git is required for fetching the dependencies.
# Ca-certificates is required to call HTTPS endpoints.
# RUN apk update && apk add --no-cache git ca-certificates tzdata && update-ca-certificates


# See https://stackoverflow.com/a/55757473/12429735
RUN adduser \
   --disabled-password \
   --gecos "" \
   --home "/nonexistent" \
   --shell "/sbin/nologin" \
   --no-create-home \
   --uid "${UID}" \
   "${USER}"
WORKDIR $GOPATH/src/mypackage/myapp/
COPY . .

# Fix the error cannot find package "golang.org/x/net/html" in any of:
# default: #10 0.286 	/usr/local/go/src/golang.org/x/net/html (from $GOROOT)
# default: #10 0.286 	/go/src/golang.org/x/net/html (from $GOPATH)
RUN go mod vendor


RUN ls

# Build the binary
# RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o /go/bin/hello main.go 

# -mod vendor 
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o /go/bin/hello -mod vendor main.go 


############################
# STEP 2 build a small image
############################
FROM scratch

# Import from builder.
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

# Copy our static executable
COPY --from=builder /go/bin/hello /go/bin/hello

# Use an unprivileged user.
USER appuser:appuser

# Run the hello binary.
ENTRYPOINT ["/go/bin/hello"]

# Run the outyet command by default when the container starts.
# ENTRYPOINT /go/bin/outyet

# Document that the service listens on port 8080.
EXPOSE 8080
