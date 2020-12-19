package main

import "fmt"

type Person struct {
	name string
	age  int
}

func (p *Person) getName() string {
	return p.name
}

func (p Person) getAge() int {
	return p.age
}

func main() {
	p := Person{"wang jiu", 18}
	q := &p
	fmt.Println(p.getName())
	fmt.Println(q.getName())
	fmt.Println(p.getAge())
	fmt.Println(q.getAge())
}
