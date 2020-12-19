package main

import "fmt"

func first() {
	fmt.Println("1st")
}

func second() {
	fmt.Println("2nd")
}

func third() {
	fmt.Println("3nd")
}

func main() {
	// defer second()
	// first()
	defer first()
	defer second()
	// defer third()
}
