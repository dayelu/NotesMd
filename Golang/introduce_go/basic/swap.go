package main

import (
	"fmt"
)

func main() {
	a := 3
	b := 4

	fmt.Printf("Before handling swap function \n a is %d , b is %d.\n", a, b)
	swap(3, 4)
	fmt.Printf("After handling swap function \n a is %d , b is %d.\n\n", a, b)

	fmt.Printf("Before handling swap function \n a is %d , b is %d.\n", a, b)
	swap_ptr(&a, &b)
	fmt.Printf("After handling swap function \n a is %d , b is %d.\n", a, b)
	var nptr *int
	if nptr == nil {
		fmt.Println("nptr is empty.")
	}
}

func swap(a int, b int) {
	a, b = b, a
}

func swap_ptr(ptr_a *int, prt_b *int) {
	*ptr_a, *prt_b = *prt_b, *ptr_a
}
