FROM golang:alpine3.17 as builder
WORKDIR /src

COPY ./fullcyclerocks .
RUN go build fullcyclerocks.go

FROM scratch
COPY --from=builder /src /src
WORKDIR /src

CMD ["./fullcyclerocks"]
