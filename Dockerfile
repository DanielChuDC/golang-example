# https://blog.golang.org/docker
# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
# FROM s390x/golang:1.14-alpine
FROM golang:14

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/golang/example/outyet

# Fix the error cannot find package "golang.org/x/net/html" in any of:
# default: #10 0.286 	/usr/local/go/src/golang.org/x/net/html (from $GOROOT)
# default: #10 0.286 	/go/src/golang.org/x/net/html (from $GOPATH)
RUN go get -d -v golang.org/x/net/html 

# Build the outyet command inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)
RUN go install github.com/golang/example/outyet

# Run the outyet command by default when the container starts.
ENTRYPOINT /go/bin/outyet

# Document that the service listens on port 8080.
EXPOSE 8080