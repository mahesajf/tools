FROM python:3.10-alpine
WORKDIR /app
RUN pip install fastapi
RUN pip install prometheus-fastapi-instrumentator
RUN pip install uvicorn
COPY . .
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0"]