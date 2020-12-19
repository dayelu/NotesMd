package main

import "fmt"

// func f(x int) {
// 	fmt.Println(x)
// }

// func main() {
// 	x := 5
// 	f(x)
// }

// var x int = 5

// func f() {
// 	fmt.Println(x)
// }

func f1() int {
	return 100
}

func f2() (r int) {
	r = 1
	return
}

func f3() (int, int) {
	return 5, 6
}

func main() {
	x, y := f3()
	fmt.Println(x, y)
}

// func main() {
// 	// f()
// 	fmt.Println(f1())
// 	fmt.Println(f2())
// }
