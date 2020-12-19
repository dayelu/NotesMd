package main

import (
	"fmt"
)

type Person struct {
	name string
	age  int
}

type PersonInfo interface {
	getAge() int
	getName() string
}

func (p *Person) getAge() int {
	p.age++
	return p.age
}

func (p *Person) getName() string {
	p.name += " erxiao"
	return p.name
}

func main() {
	// var pinfo PersonInfo
	person := Person{"wang", 18}
	ptrPerson := &person
	// pinfo = &person
	fmt.Println(person.getAge())
	fmt.Println(person.age)
	// fmt.Println(person.getName())
	// fmt.Println(person.name)

	fmt.Println()

	fmt.Println(ptrPerson.getAge())
	fmt.Println(ptrPerson.age)
	// fmt.Println(ptrPerson.getName())
	// fmt.Println(ptrPerson.name)

	// fmt.Println()

	// fmt.Println(pinfo.getAge())
	// fmt.Println(person.age)
	person.age = 100
	fmt.Println(person.age)
	ptrPerson.age = 200
	fmt.Println(person.age)
}
