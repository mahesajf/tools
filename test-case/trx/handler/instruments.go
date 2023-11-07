package handler

import "github.com/prometheus/client_golang/prometheus"

var PingCounter = prometheus.NewCounter(
	prometheus.CounterOpts{
		Name: "ping_request_count",
		Help: "No of request handled by Ping handler",
	},
)

var TrxCounter = prometheus.NewCounter(
	prometheus.CounterOpts{
		Name: "trx_request_count",
		Help: "No of request handled by Trx handler",
	},
)

var TrxStatusCodeCounter = prometheus.NewCounterVec(
	prometheus.CounterOpts{
		Name: "trx_status_code_count",
		Help: "No of statuscode handled by Trx handler",
	},
	[]string{"status_code"},
)

var TrxTypeCounter = prometheus.NewCounterVec(
	prometheus.CounterOpts{
		Name: "trx_type_count",
		Help: "No of trx_type handled by Trx handler",
	},
	[]string{"trx_type"},
)

var TrxHistogram = prometheus.NewHistogram(
	prometheus.HistogramOpts{
		Name: "trx_request_latency",
		Help: "No of request latency handled by Trx handler",
	},
)
