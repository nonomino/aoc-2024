GOFILES := $(filter-out run.go, $(wildcard **/*.go))
TEMPLATES := $(wildcard templates/*.tmpl)
.PHONY: run runall test

run.go: $(GOFILES) $(TEMPLATES)
	go generate

run: main.go run.go
	go run .

runall: main.go run.go
	go run . -a

test:
	go test ./day*
	go test ./utils

build: main.go run.go
	go build -o aoc_run .
