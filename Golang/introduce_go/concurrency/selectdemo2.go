package main

import (
	"fmt"
	"time"
)

func main() {
	ch := make(chan string)
	go func() {
		time.Sleep(time.Second * 2)
		ch <- "result"
	}()
	select {
	case res := <-ch:
		fmt.Println(res)
	case <-time.After(time.Second * 2):
		fmt.Println("timeout")
	}
	var inpit string
	fmt.Scanln(&inpit)
}
