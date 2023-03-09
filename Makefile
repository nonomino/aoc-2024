GOFILES := $(filter-out run.go, $(wildcard **/*.go))
TEMPLATES := $(wildcard templates/*.tmpl)
.PHONY: run runall test build clean start help

run.go: $(GOFILES) $(TEMPLATES)
	go generate

run: main.go run.go ## run the most recently edited day
	go run .

runall: main.go run.go ## Run all days
	go run . -a

test: ## Run all tests
	go test -cover ./day*
	go test -cover ./utils

aoc_run: main.go run.go
	go build -o aoc_run .

build: aoc_run ## Build binary executable aoc_run

clean: ## Clean run.go and aoc_run
	rm run.go || true
	rm aoc_run || true

help: ## Show this help
	@echo "These are the make commands for the solutions to this Advent of Code repository.\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

day%p1:
	go run ./start -d $(shell echo $* | sed 's/^0*//')

start: day$(shell date +%d)p1  ## Start today
