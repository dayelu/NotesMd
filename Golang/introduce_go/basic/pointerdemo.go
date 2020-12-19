package main

import (
	"fmt"
)

type Person struct {
	name string
	age  int
}

func (p *Person) getAge() int {
	p.age++
	return p.age
}

func (p Person) getName() string {
	p.name += " jing"
	return p.name
}

func main() {

	person := Person{"li", 18}

	fmt.Println(person.getAge())
	fmt.Println(person.age)
	fmt.Println(person.getName())
	fmt.Println(person.name)

	fmt.Println()

	ptrPerson := &person
	fmt.Println(ptrPerson.getAge())
	fmt.Println(ptrPerson.age)
	fmt.Println(ptrPerson.getName())
	fmt.Println(ptrPerson.name)

}
