FROM golang:1.16.6-stretch AS build

WORKDIR /go/src/app
COPY . .
ENV PATH="/go/bin:${PATH}"

RUN go build main.go

FROM scratch

COPY --from=build /go/src/app/main .

ENTRYPOINT ["./main"]