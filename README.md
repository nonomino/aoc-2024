# Advent of Code Template in Go

This is a template to put advent of code problems into a single executable. It
allows you to measure the execution time of each part of each problem, and to
ignore some of the boilerplate. Not sure if anyone else will be interested, but
I thought I would give it a try because I have seen a lot of templates like
this.

# Instructions

To start a new day, generate code from a template using the command:

```
go run ./start
```

It will default to adding code for the current day. You can specify a different
day with the `-d` flag. This will create a directory called `dayXXp1` where 
`XX` is replaced by the day number. Inside will be a file called `solution.go`
with a `Solve` function in which to put your solution, and a `solution_test.go`
file to write your tests. The `Solve` function takes an `io.Reader` argument
which is the input and returns a solution which can be any type.

To run the last code you worked on use the command:

```
make run
```

This will generate a `run.go` file and run the most recently modified code. You
can run all the days with the command:

```
make runall
```

Finally, you can do tests with the command:

```
make test
```
