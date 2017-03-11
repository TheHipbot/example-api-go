package handlers

import (
	"encoding/json"
	"fmt"
	"github.com/TheHipbot/example-api-go/models"
	"github.com/golang/glog"
	"net/http"
)

func Index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Welcome!")
}

func GetPerson(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	// vars := mux.Vars(r)
	//	id := vars["id"]
	jeremy := models.Person{
		ID:        "1234",
		FirstName: "Jeremy",
		LastName:  "Chambers",
	}
	if err := json.NewEncoder(w).Encode(jeremy); err != nil {
		glog.Error("Failed to encode")
	}
}
