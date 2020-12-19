package main

import "fmt"

func main() {
	var a int
	b := new(int)
	var c *int
	prt := &a
	b = &a
	c = &a
	fmt.Println(a)
	fmt.Println(prt)
	fmt.Println(b)
	fmt.Println(c)
}
