FROM golang:1.17.0-alpine
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN go get ./ && go build && go mod download
EXPOSE 8090