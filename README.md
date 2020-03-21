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

### Branch

- keycloak-gatekeeper
  - Create docker image with [keycloak-gatekeeper](https://github.com/keycloak/keycloak-gatekeeper/blob/master/docs/building.md)
- go-kit (Failed, do not use)
  - example of using go-kit
    - Install tools from
    - > Failed too. go-kit does not seem to support
      - https://github.com/go-kit/kit
      - https://github.com/GrantZheng/kit (A fork from github.com/kujtimiihoxha/kit) ([A medium article talk about this](https://medium.com/@kujtimii.h/creating-a-todo-app-using-gokit-cli-20f066a58e1) )
        - curl https://glide.sh/get | sh (Using [A package manager for golang](https://github.com/Masterminds/glide))
        - glide init
  - > Failed, unmaintained project gokit-cli
    - go get github.com/kujtimiihoxha/kit (Unmaintain)
    - go get -u google.golang.org/grpc (if you want to utilise generation of gRPC service code)
    - go get -u github.com/golang/protobuf/protoc-gen-go (if you want to utilise generation of gRPC service code)
    - kit generate service users --dmw (--dmw creates default endpoint middleware, logging middleware.)
- gin-and-gorm-rest-api (based on [project](https://blog.logrocket.com/how-to-build-a-rest-api-with-golang-using-gin-and-gorm/) )
  - Using [tableplus, GUI](https://tableplus.com/) and [SQLite3](https://flaviocopes.com/sqlite-how-to-install/)
  - Using sqlite3
  - [import mod from local path](https://stackoverflow.com/questions/35480623/how-to-import-local-packages-in-go)
  - using [go lang viper](https://github.com/spf13/viper) and [godotenv](https://github.com/joho/godotenv) and [go env var](https://towardsdatascience.com/use-environment-variable-in-your-next-golang-project-39e17c3aaa66) from [medium](https://medium.com/@bnprashanth256/reading-configuration-files-and-environment-variables-in-go-golang-c2607f912b63)
  - Need to [remove the volume](https://stackoverflow.com/questions/56657683/postgres-docker-image-is-not-creating-database-with-custom-name) by `docker volume ls` and `docker volume rm <uuid>`
  - The Gorm seem faulty, need to add the key words: `sslmode:disable`, [see more info](https://www.calhoun.io/connecting-to-a-postgresql-database-with-gos-database-sql-package/)
  - Great help from [here](https://www.reddit.com/r/docker/comments/8szjw0/how_to_connect_to_postgresql_using_dockercompose/)

  - Start project
    - go mod init
    - go mod vendor
    - go run main.go
