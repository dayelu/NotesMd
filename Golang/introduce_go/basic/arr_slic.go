package main

import "fmt"

func main() {
	// var a [5]int
	a := []int{1, 2, 3, 4, 5}
	b := a
	c := a[:3]
	fmt.Println(a, b, c)

	b[2] = 7
	fmt.Println(a, b, c)
	double(a)
	fmt.Println(a, b, c)
	double(c)
	fmt.Println(a, b, c)
}

func double(num []int) {
	for index, element := range num {
		num[index] = 2 * element
	}
}

// package main

// import "fmt"

// func main() {
// 	var a [5]int
// 	b := a
// 	c := a[:3]

// 	fmt.Println(a, b, c) // prints [0 0 0 0 0] [0 0 7 0 0]
// 	b[2] = 7
// 	fmt.Println(a, b, c) // prints [0 0 0 0 0] [0 0 7 0 0]
// }

