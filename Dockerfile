FROM golang:alpine AS builder

WORKDIR /study/app

COPY . .

RUN go build -ldflags '-s -w' main.go

FROM scratch

WORKDIR /project

COPY --from=builder /study/app /project/

CMD ["./main"]