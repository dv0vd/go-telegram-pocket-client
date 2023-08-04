.PHONY: build

build:
	go build -o ./build/bot ./cmd/bot/main.go

run: build
	./build/bot