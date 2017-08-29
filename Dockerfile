# Build stage
FROM golang:1.8 as build
RUN mkdir -p /go/src/app && \
    go get -u github.com/kardianos/govendor
ARG PACKAGE=github.com/TheHipbot/example-api-go
WORKDIR /go/src/${PACKAGE}
COPY . /go/src/${PACKAGE}
RUN make build

# App stage
FROM alpine
EXPOSE 8080
USER nobody
ARG PACKAGE=github.com/TheHipbot/example-api-go

COPY --from=build /go/src/${PACKAGE}/main /app/

CMD ["/app/main"]
