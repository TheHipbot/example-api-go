# Environment info
GOCMD := govendor
SOURCEDIR=.
SOURCES := $(find $(SOURCEDIR) -name '*.go')

# Binary info
BINARY := main
PKG_NAME := example-api-go
PKG_PREFIX := "github.com/TheHipbot/${PKG_NAME}"

# Build info
VERSION := 1.0.0
BUILD := `git rev-parse --short HEAD`

.DEFAULT_GOAL: $(BINARY)

.PHONY: clean
clean:
	$(GOCMD) clean && if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi

.PHONY: lint
lint: 
	golint ./...

.PHONY: vet
vet:
	$(GOCMD) vet ./...

.PHONY: install
install:
	$(GOCMD) install

.PHONY: sync
sync:
	$(GOCMD) sync

build: sync $(SOURCES)
	CGO_ENABLED=0 $(GOCMD) build -a -installsuffix cgo -o ${BINARY}

.PHONY: docker-build
docker-build:
	docker build -t "thehipbot/${PKG_NAME}:${BUILD}" --build-arg PACKAGE=$(PKG_PREFIX) .
