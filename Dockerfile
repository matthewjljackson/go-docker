FROM golang:1.20-alpine AS build

WORKDIR /src

COPY go.mod .
RUN go mod download

COPY . .

RUN go build -o app

FROM scratch

WORKDIR /

COPY --from=build src/app .

EXPOSE 8080

CMD ["./app"]