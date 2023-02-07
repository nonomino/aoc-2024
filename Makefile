GOFILES := $(filter-out run.go, $(wildcard **/*.go))
TEMPLATES := $(wildcard templates/*.tmpl)
.PHONY: run runall test

run.go: $(GOFILES) $(TEMPLATES)
	go generate

run: run.go
	go run .

runall: run.go
	go run . -a

test:
	go test ./day*
	go test ./utils


