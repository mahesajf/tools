package handler

import "net/http"

type Request struct {
	AccountNumber string `json:"account_number" validate:"required"`
	Amount        int    `json:"amount"   validate:"required,gte=1000,lte=10000000000"`
	TrxType       string `json:"trx_type" validate:"required"`
	Email         string `json:"email" validate:"omitempty,email"`
}

var (
	responseGenerator = []map[string]interface{}{
		{
			"data": map[string]interface{}{
				"status":        "success",
				"response_msg":  "transaksi berhasil",
				"response_code": "00",
			},
			"status_code": http.StatusOK,
		},
		{
			"data": map[string]interface{}{
				"status":        "failed",
				"response_msg":  "request invalid",
				"response_code": "98",
			},
			"status_code": http.StatusBadRequest,
		},
		{
			"data": map[string]interface{}{
				"status":        "failed",
				"response_msg":  "transaksi gagal",
				"response_code": "99",
			},
			"status_code": http.StatusInternalServerError,
		},
	}
)
