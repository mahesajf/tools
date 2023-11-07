from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from prometheus_fastapi_instrumentator import PrometheusFastApiInstrumentator
from prometheus_fastapi_instrumentator import Instrumentator
import random
import asyncio


STATUS = ['00','99']
TIMEOUT = [0, 1, 2]


app = FastAPI()
Instrumentator().instrument(app).expose(app)


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/api/report/summary")
async def root():
    status = random.choice(STATUS)
    timeout = random.choice(TIMEOUT)
    await asyncio.sleep(timeout)

    if status == "00": 
        return {
            "code": "A1X", 
            "exchange": "IDR",
            "date": "2023-08-23",
            "transaction_date": "2023-08-23",
            "transaction_amount": 300000,
            "transaction_fee": 1000,
            "transaction_code": "PYR",
            "message": "summary transaction",
            "status": status,
            }        

    return JSONResponse(status_code=500, content={"message": "request failed", "status": status})
