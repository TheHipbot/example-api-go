package main

import (
	"github.com/TheHipbot/example-api-go/routes"
	"github.com/golang/glog"
	"net/http"
)

func main() {
	router := routes.NewRouter()

	glog.Fatalf("%s", http.ListenAndServe(":8080", router))
}
