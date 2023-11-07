package handler

import (
	"encoding/json"
	"log"
	"math/rand"
	"net/http"
	"strconv"
	"time"

	"github.com/go-playground/validator/v10"
	"github.com/prometheus/client_golang/prometheus"
)

var (
	validate *validator.Validate
)

func Ping(w http.ResponseWriter, req *http.Request) {

	PingCounter.Inc()

	responseMessage := map[string]interface{}{
		"response_msg":  "pong",
		"response_code": "00",
	}

	statusCode := http.StatusOK

	response, err := json.Marshal(responseMessage)
	if err != nil {
		log.Println("Unable to encode JSON")
	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(statusCode)
	w.Write(response)
}

func Trx(w http.ResponseWriter, r *http.Request) {
	timer := prometheus.NewTimer(TrxHistogram)
	begin := time.Now()

	var request Request
	decoder := json.NewDecoder(r.Body)
	if err := decoder.Decode(&request); err != nil {
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	validate = validator.New()
	err := validate.Struct(request)
	if err != nil {

		// translate all error at once
		errs := err.(validator.ValidationErrors)

		response, err := json.Marshal(map[string]interface{}{
			"error": errs.Error(),
		})
		if err != nil {
			log.Println("Unable to encode JSON")
		}

		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusBadRequest)
		w.Write(response)
		return
	}
	rand.Seed(time.Now().UnixNano())
	n := rand.Intn(len(responseGenerator))

	responseMessage := responseGenerator[n]["data"]
	statusCode := responseGenerator[n]["status_code"].(int)

	response, err := json.Marshal(responseMessage)
	if err != nil {
		log.Println("Unable to encode JSON")
	}

	time.Sleep(time.Duration(n) * time.Second)

	// metric
	TrxCounter.Inc()
	TrxStatusCodeCounter.WithLabelValues(strconv.Itoa(statusCode)).Inc()
	TrxTypeCounter.WithLabelValues(request.TrxType).Inc()
	timer.ObserveDuration()

	// log
	log.Printf("trx with trx_type %v took %v \n", request.TrxType, time.Since(begin))

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(statusCode)
	w.Write(response)
}
