.PHONY: start

start: .env
	docker compose up --build

.env:
	cp .env.example .env
