package main

import "fmt"

func main() {
	// panic("PANIC")
	// str := recover() // this will never happen
	defer func() {
		str := recover()
		fmt.Println(str)
	}()

	panic("PANIC")
}
