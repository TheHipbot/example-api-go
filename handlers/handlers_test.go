package handlers

import (
	"encoding/json"
	"github.com/TheHipbot/example-api-go/models"
	"io/ioutil"
	"net/http/httptest"
	"testing"
)

func TestGetPerson(t *testing.T) {
	var p models.Person
	req := httptest.NewRequest("GET", "/person/123/", nil)
	w := httptest.NewRecorder()
	GetPerson(w, req)

	resp := w.Result()
	body, _ := ioutil.ReadAll(resp.Body)
	json.Unmarshal(body, &p)

	if p.ID != "1234" {
		t.Errorf("wrong ID, %s, for person", p.ID)
	}

	if p.FirstName != "Jeremy" {
		t.Errorf("wrong name, %s, for person", p.FirstName)
	}

	if p.LastName != "Chambers" {
		t.Errorf("wrong last name, %s, for person", p.LastName)
	}
}
