#                  [     Golang IO操作        ](https://www.cnblogs.com/zhichaoma/p/12509984.html)             

## 输入输出的底层原理[#](https://www.cnblogs.com/zhichaoma/p/12509984.html#1276311004)

**终端其实是一个文件，相关实例如下**

- os.Stdin：标准输入的文件实例，类型为*File
- os.Stdout：标准输出的文件实例，类型为*File
- os.Stderr：标准错误输出的文件实例，类型为*File

**以文件的方式操作终端**

```go
Copypackage main

import (
	"os"
)

func main() {
	var buf [16]byte
	// 终端输入
	os.Stdin.Read(buf[:])
	// 标准输出
	os.Stdout.WriteString(string(buf[:]))
}
```

## 文件操作相关 API[#](https://www.cnblogs.com/zhichaoma/p/12509984.html#3228625057)

- 根据提供的文件名创建新的文件，返回一个文件对象，默认权限是 0666

```
func Create(name string) (file *File, err Error)
```

- 根据文件描述符创建相应的文件，返回一个文件对象

```
func NewFile(fd uintptr, name string) *File
```

- 只读方式打开一个名称为 name 的文件

```
func Open(name string) (file *File, err Error)
```

- 打开名称为 name 的文件，flag 是打开的方式，只读、读写等，perm 是权限

```
func OpenFile(name string, flag int, perm uint32) (file *File, err Error)
```

- 写入 byte 类型的信息到文件

```
func (file *File) Write(b []byte) (n int, err Error)
```

- 在指定位置开始写入 byte 类型的信息

```
func (file *File) WriteAt(b []byte, off int64) (n int, err Error)
```

- 写入 string 信息到文件

```
func (file *File) WriteString(s string) (ret int, err Error)
```

- 读取数据到 b 中

```
func (file *File) Read(b []byte) (n int, err Error)
```

- 从 off 开始读取数据到 b 中

```
func (file *File) ReadAt(b []byte, off int64) (n int, err Error)
```

- 删除文件名为 name 的文件

```
func Remove(name string) Error
```

## 写文件[#](https://www.cnblogs.com/zhichaoma/p/12509984.html#3543308845)

```go
Copypackage main

import (
	"fmt"
	"os"
)

func main() {
	file, err := os.Create("./test.txt")
	if err != nil {
		fmt.Println("create file error: ", err)
		return
	}

	defer file.Close()

	for i:=0;i<5;i++ {
		file.WriteString("hello\n")
		file.Write([]byte("world\n"))
	}
}
```

## 读文件[#](https://www.cnblogs.com/zhichaoma/p/12509984.html#148024988)

**文件读取可以使用`file.Read()`和`file.ReadAt()`方法， 读到文件末尾会返回`io.EOF`的错误**

```go
Copypackage main

import (
	"fmt"
	"io"
	"os"
)

func main() {
	file, err := os.Open("./test.txt")

	if err != nil {
		fmt.Println("open file err: ", err)
		return
	}

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
```

## 文件拷贝[#](https://www.cnblogs.com/zhichaoma/p/12509984.html#2871039026)

流程是将源文件读取出来，再将内容写入到一个新文件中

```go
Copypackage main

import (
	"errors"
	"fmt"
	"io"
	"os"
)

// 文件拷贝

func readFile(filename string) (fileBodyByte []byte, err error) {
	file, err := os.Open(filename)
	if err != nil {
		return
	}
	defer file.Close()

	var buf [128]byte
	for {
		n, err := file.Read(buf[:])
		if err == io.EOF {
			break
		}

		if err != nil {
			err = errors.New("读取文件失败")
		}

		fileBodyByte = append(fileBodyByte, buf[:n]...)
	}
	return

}

func writeFile(filename string, context []byte) (status bool, err error) {
	file, err := os.Create(filename)
	if err != nil {
		return
	}
	defer file.Close()
	_, err = file.Write(context)
	if err != nil {
		return
	}
	return true, err
}

func copyFile(src string, dest string) (status bool, err error) {
	fileBodyByte, err := readFile(src)
	if err != nil {
		return
	}

	status, err = writeFile(dest, fileBodyByte)
	if err != nil {
		return
	}
	return

}

func main() {
	status, err := copyFile("./test.txt", "./hello.txt")
	if err != nil {
		fmt.Println(err)
	}
	if status {
		fmt.Println("文件拷贝成功")
	}
}
```

## bufio[#](https://www.cnblogs.com/zhichaoma/p/12509984.html#3313878157)

- bufio 包实现了带缓冲区的读写，是对文件读写的封装
- bufio 缓冲写数据
  - os.O_WRONLY：只写
  - os.O_CREATE：创建文件
  - os.O_RDONLY：只读
  - os.O_RDWR：读写
  - os.O_TRUNC：清空
  - os.O_APPEND：追加
- bufio 读写数据

```go
Copypackage main

import (
	"bufio"
	"fmt"
	"io"
	"os"
)

func wr() {
	file, err := os.OpenFile("./test.txt", os.O_CREATE|os.O_WRONLY, 0666)
	if err != nil {
		fmt.Println(err)
		return
	}
	defer file.Close()

	bufWriter := bufio.NewWriter(file)
	for i :=0; i<10; i++ {
		bufWriter.Write([]byte("123\n"))
		// 刷新缓冲区，强制写出
		bufWriter.Flush()
	}
}

func re() {
	file, err := os.Open("./test.txt")
	if err != nil {
		fmt.Println(err)
		return
	}

	defer file.Close()

	readBufio := bufio.NewReader(file)

	for {
		line, _, err := readBufio.ReadLine()
		if err == io.EOF {
			break
		}

		if err != nil {
			fmt.Println(err)
			return
		}
		fmt.Print(string(line))
	}
}

func main() {
	//wr()
	re()
}
```

## ioutil 工具包[#](https://www.cnblogs.com/zhichaoma/p/12509984.html#1462519668)

这个工具包提供了非常方便的文件读写方法

```go
Copypackage main

import (
	"fmt"
	"io/ioutil"
)

func wr() {
	err := ioutil.WriteFile("./test123", []byte("hello world\n"), 0666)
	if err != nil {
		fmt.Println(err)
		return
	}
}

func re() {
	content, err := ioutil.ReadFile("./test123")
	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println(string(content))
}

func main() {
	//wr()
	re()
}
```

作者：            ZhiChao&        

出处：https://www.cnblogs.com/zhichaoma/p/12509984.html

版权：本文采用「[署名-非商业性使用-相同方式共享 4.0 国际](https://creativecommons.org/licenses/by-nc-sa/4.0/)」知识共享许可协议进行许可。



​    分类:             [golang](https://www.cnblogs.com/zhichaoma/category/1334187.html)

​    标签:             [golang](https://www.cnblogs.com/zhichaoma/tag/golang/)