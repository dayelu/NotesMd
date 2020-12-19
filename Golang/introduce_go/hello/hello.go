package main

import (
	"fmt"
	"example.com/greetings"
)

func main(){
	message:=greetings.Hello("Wang Erxiao")
	fmt.Println(message)
}
