# golang-example

This project enable you to build golang application

# Inspired by

[Golang Docker Official Images ](https://hub.docker.com/_/golang?tab=tags)

[Use multi-stage builds with Golang ](https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds)

[A OpenID / Keycloak Proxy service written in golang ](https://github.com/keycloak/keycloak-gatekeeper/blob/master/docs/building.md)

[Official Golang website: The Go Programming Language](https://go.googlesource.com/go)

[Create the smallest and secured golang docker image based on scratch](https://medium.com/@chemidy/create-the-smallest-and-secured-golang-docker-image-based-on-scratch-4752223b7324)

[Package build ](https://golang.org/pkg/go/build/)

### This project get soure code from

- [The Go blog:Deploying Go servers with Docker](https://blog.golang.org/docker)

### Possible direction

- https://github.com/icicimov/go-proxy-docker-multiarch/blob/master/Dockerfile

### Familiar with Go command

- https://golang.org/cmd/go/


### Branch

- keycloak-gatekeeper
  - Create docker image with [keycloak-gatekeeper](https://github.com/keycloak/keycloak-gatekeeper/blob/master/docs/building.md)
- go-kit
  - example of using go-kit
    - Install tools from
    - > Failed too. go-kit does not seem to support
      - https://github.com/go-kit/kit
      - https://github.com/GrantZheng/kit (A fork from github.com/kujtimiihoxha/kit) ([A medium article talk about this](https://medium.com/@kujtimii.h/creating-a-todo-app-using-gokit-cli-20f066a58e1) )
         - curl https://glide.sh/get | sh  (Using [A package manager for golang](https://github.com/Masterminds/glide))
         - glide init
         - 

   - > Failed, unmaintained project gokit-cli
      - go get github.com/kujtimiihoxha/kit (Unmaintain)
      - go get -u google.golang.org/grpc (if you want to utilise generation of gRPC service code)
      - go get -u github.com/golang/protobuf/protoc-gen-go (if you want to utilise generation of gRPC service code)
      - kit generate service users --dmw (--dmw creates default endpoint middleware, logging middleware.)

### Issue

1.

```
$ go get -u  github.com/go-kit/kit
package github.com/go-kit/kit: no Go files in /Users/danielchu/go/src/github.com/go-kit/kit
```

2.

```
$ kit help
ERRO[0000] The project must be in the $GOPATH/src folder for the generator to work.
```

3.

```
$ kit generate service notificator -t grpc --dmw
ERRO[0000] Please install protoc first and than rerun the command
INFO[0000] Install proto3 from source macOS only.
> brew install autoconf automake libtool
> git clone https://github.com/google/protobuf
> ./autogen.sh ; ./configure ; make ; make install

Update protoc Go bindings via
> go get -u github.com/golang/protobuf/{proto,protoc-gen-go}

See also
https://github.com/grpc/grpc-go/tree/master/examples


# Solution: In Mac OS, you need to build the protobuf yourself
https://medium.com/@erika_dike/installing-the-protobuf-compiler-on-a-mac-a0d397af46b8

$ git clone https://github.com/google/protobuf/
$ brew install autoconf && brew install automake && brew install libstool
$ ./autogen.sh && ./configure && make

At the end, using this to get the proto
https://www.ru-rocker.com/2017/02/24/micro-services-using-go-kit-grpc-endpoint/

# Need to export GOBIN
1. Download protocol buffer compiler from https://github.com/google/protobuf/releases. Extract and export bin folder into $PATH.

2. Write this into ~/.zshrc  or ~/.bashrc
#PROTOC
export PROTOC_HOME=~/opt/protoc-3.2.0-osx-x86_64
export PATH=${PATH}:$PROTOC_HOME/bin/

3. Execute this in terminal to get the proto binary
$ go get -u github.com/golang/protobuf/{proto,protoc-gen-go}

4. Remember to put your GOBIN under your PATH.
#GOPATH
export GOPATH=~/go
export GOBIN=$GOPATH/bin/
export PATH=${PATH}:$GOBIN


```
