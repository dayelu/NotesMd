package main

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

	person := Person{"wang", 18}

	var pinfo PersonInfo
	pinfo = &person
	pinfo.age
	pinfo.getAge()

}
