FROM golang:1.21.6-alpine AS build

WORKDIR /usr/src/app

RUN go mod init desafio/full-cycle

COPY desafio.go ./

RUN go build desafio.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/desafio .

ENTRYPOINT ["./desafio"]
