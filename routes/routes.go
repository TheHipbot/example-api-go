package routes

import (
	"github.com/TheHipbot/example-api-go/handlers"
	"net/http"
)

type Route struct {
	Name        string
	Method      string
	Pattern     string
	HandlerFunc http.HandlerFunc
}

type Routes []Route

var routes = Routes{
	Route{
		"Index",
		"GET",
		"/",
		handlers.Index,
	},
	Route{
		"GetPerson",
		"GET",
		"/person/{id}",
		handlers.GetPerson,
	},
}
