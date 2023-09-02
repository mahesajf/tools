FROM golang:1.17-alpine
RUN mkdir /app   
COPY . /app   
WORKDIR /app   
RUN go get -x ./ && go build && go mod download
EXPOSE 5000
CMD ["go", "run", "main.go"]
