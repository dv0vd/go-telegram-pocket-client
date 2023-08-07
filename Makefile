.PHONY: build

build:
	go build -o ./build/bot ./cmd/bot/main.go

run: build
	./build/bot

build-image: 
	docker build -t telegram-bot .

start-container: 
	docker run --name telegram-bot -p 80:80 --env-file .env -t telegram-bot 