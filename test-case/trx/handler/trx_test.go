package handler

import (
	"bytes"
	"encoding/json"
	"io/ioutil"
	"log"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestTrx(t *testing.T) {

	request, err := json.Marshal(map[string]interface{}{
		"account_number": "111001",
		"amount":         100,
		"trx_type":       "DEP",
	})
	if err != nil {
		log.Println("Unable to encode JSON")
	}

	reader := bytes.NewReader(request)

	req := httptest.NewRequest(http.MethodPost, "/upper?word=abc", reader)
	w := httptest.NewRecorder()
	Trx(w, req)
	res := w.Result()
	defer res.Body.Close()
	data, err := ioutil.ReadAll(res.Body)
	if err != nil {
		t.Errorf("expected error to be nil got %v", err)
	}
	if string(data) != `{"error":"Key: 'Request.Amount' Error:Field validation for 'Amount' failed on the 'gte' tag"}` {
		t.Errorf(" got %v", string(data))
	}
	if res.StatusCode != http.StatusBadRequest {
		t.Errorf(" got %v", res.StatusCode)
	}
}
