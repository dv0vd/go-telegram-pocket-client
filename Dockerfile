FROM golang:alpine

RUN go version

COPY . /app
WORKDIR /app

RUN go mod download
RUN go build -o ./build/bot ./cmd/bot/main.go
# RUN GOOS=linux go build -o ./build/bot ./cmd/bot/main.go

FROM alpine

WORKDIR /app

COPY --from=0 /app/build/bot .
COPY --from=0 /app/configs ./configs

EXPOSE 80

CMD ["./bot"]




# FROM golang:alpine AS builder

# RUN go version

# COPY . /gitlab.qsoft.ru/grade/v.davydov_telegram_bot/
# WORKDIR /gitlab.qsoft.ru/grade/v.davydov_telegram_bot/

# # RUN go mod download
# RUN go build -o ./build/bot ./cmd/bot/main.go
# # RUN GOOS=linux go build -o ./build/bot ./cmd/bot/main.go

# FROM alpine:latest

# WORKDIR /root/

# COPY --from=0 /gitlab.qsoft.ru/grade/v.davydov_telegram_bot/build/bot .
# COPY --from=0 /gitlab.qsoft.ru/grade/v.davydov_telegram_bot/configs configs/

# EXPOSE 80

# CMD ["./bot"]