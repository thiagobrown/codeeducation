FROM golang:alpine as build

WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" main.go

FROM scratch

COPY --from=build /go/src/app .

CMD ["/main"]