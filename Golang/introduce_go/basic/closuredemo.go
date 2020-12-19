package main

import "fmt"

// func main() {
// 	add := func(x, y int) int {
// 		return x + y
// 	}
// 	fmt.Println(add(1, 1))
// }

// func main() {
// 	x := 0
// 	increment := func() int {
// 		x++
// 		return x
// 	}
// 	fmt.Println(increment())
// 	fmt.Println(increment())
// }

func makeEvenGenerator() func() uint {
	i := uint(0)
	return func() (ret uint) {
		ret = i
		i += 2
		return
	}
}

func main() {
	nextEven := makeEvenGenerator()
	fmt.Println(nextEven()) // 0
	fmt.Println(nextEven()) // 2
	fmt.Println(nextEven()) // 4
}
