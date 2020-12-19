package main

import (
	"fmt"
	"io"
	"os"
)

func main() {
	var buff [16]byte
	// // 键盘终端输入
	os.Stdin.Read(buff[:])
	// // 标准输出
	os.Stdout.WriteString(string(buff[:]))

	file, err := os.Open("./test.txt")

	if err != nil {
		fmt.Println("open file err: ", err)
		return
	}

	defer file.Close()

	// 读取文件缓冲区
	var buf [128]byte
	// 文件内容字节数组
	var content []byte

	for {
		n, err := file.Read(buf[:])
		if err == io.EOF {
			// 文件读取完毕
			break
		}

		if err != nil {
			fmt.Println("read file err: ", err)
			return
		}

		content = append(content, buf[:n]...)
	}

	fmt.Println(string(content))
}
