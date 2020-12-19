package main

import (
	"fmt"
	"math"
)

func main() {
	// c := make(Circle)
	// var c = Circle{}

	a := &Circle{7, 9, 5}
	// c = &a
	b := Circle{3, 2, 1}
	fmt.Println(a.x, a.y, a.r)
	fmt.Println(b.x, b.y, b.r)
	// fmt.Println(a)
	// fmt.Println(&a)
	b.area()
}

func (c *Circle) area() float64 {
	return math.Pi * c.r * c.r
}

type Circle struct {
	x, y, r float64
}
