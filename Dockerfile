# Minimize Footprint: Multistage
FROM golang:alpine as builder
RUN mkdir /build 
ADD . /build/
WORKDIR /build 

# If we can compile a Golang app to a single binary, of which is statically-linked to its dependencies, 
# we can leverage a 0KB container to run this application. 
# This is a special base image provided by Docker called "scratch": FROM scratch
FROM scratch
COPY --from=builder /build/main /app/
WORKDIR /app
CMD ["./main"]


