package main

import (
	"fmt"
	"math"
)

type Shape interface {
	area() float64
	preimeter() float64
}

type Rectangle struct {
	x1, y1, x2, y2 float64
}

type Circle struct {
	x, y, r float64
}

func distance(x1, y1, x2, y2 float64) float64 {
	a := x2 - x1
	b := y2 - y1
	return math.Sqrt(a*a + b*b)
}

func (r *Rectangle) area() float64 {
	l := distance(r.x1, r.y1, r.x1, r.y2)
	w := distance(r.x1, r.y1, r.x2, r.y1)
	return l * w
}

func (r *Rectangle) preimeter() float64 {
	l := distance(r.x1, r.y1, r.x1, r.y2)
	w := distance(r.x1, r.y1, r.x2, r.y1)
	return 2 * (l + w)
}

func (c *Circle) area() float64 {
	return math.Pi * c.r * c.r
}

func (c *Circle) preimeter() float64 {
	return math.Pi * 2 * c.r
}

func (c *Circle) diameter() float64 {
	return 2 * c.r
}

type MultiShape struct {
	shapes []Shape
}

type SingleShape struct {
	singleShapes Shape
}

func (m *MultiShape) totalArea() float64 {
	var area float64
	for _, s := range m.shapes {
		area += s.area()
	}
	return area
}

func main() {

	c := Circle{0, 0, 5}
	r := Rectangle{0, 0, 10, 10}

	multiShape := MultiShape{
		shapes: []Shape{
			&c,
			&r,
			// &Circle{0, 0, 5},
			// &Rectangle{0, 0, 10, 10},
		},
	}

	total := multiShape.totalArea()

	fmt.Println(total)

}
