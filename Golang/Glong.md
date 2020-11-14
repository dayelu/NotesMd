*Introducing Go* 一书笔记

# 1. Hello,world!

老规矩，先看看一个编程语言最简单的程序 `Hello,wold!`，如何编辑到运行。看

**程序1.1**：`hello.go`

```go
package main
import "fmt"
// this is a comment
func main(){
	fmt.Println("Hello,World!")
}
```

- 运行方式一，直接运行源程序：

```
go run hello.go
Hello,World!
```

- 运行方式二，编译再运行：

```
go build hello.go 
./hello 
```

- 解析：

`line 1` : `package main`

 这是 Go 中 包的声明，**每个 Go 程序都必须从这行代码开始**。

关于 Go 语言的包：包 是 Go语言组织和复用代码的方式。

`line 2` : `import "fmt"` 

跟 python 类似，**`import`** 关键字用来引入其他包。

Go 也可以对包使用 **别名**，语法为 `import alias ”packagename"` ，比如如下 **程序 1.2**

注意，**导入包时，包命要用双引号**。

`fmt` 包是个实现了标准输入输出的包，所以接下来会很常见。

`line 3` : `// this is a comment` 

注释，没有什么好说的。Go 的注释和 C 语言一样支持 单行（**//**）和 多行（**/\*\*\*/**）注释。

`line 4` ：`func main(){` 

函数声明，名为 `main` 无参无返的函数；

 **`func `** 关键字，用来定义函数；

**`main`** 函数，和 C 语言一样，程序的入口，最先被执行的函数；

值得注意的是这行末尾的 **左花括号 `{`**，这个符号在函数声明时，**只能处于 函数名 所在行的末尾**，而不**能另起一行**！否则则不会通过运行。如下

 **程序1.2**：

```go
package main
import f "fmt"
func main()		// error 或括号必须位于此行末，不能另起一行。
{
	f.Println("Hello,World!")
}
```

结果：

```
# command-line-arguments
./hello.go:3:6: missing function body
./hello.go:4:1: syntax error: unexpected semicolon or newline before {
```

`line 5` ：`fmt.Println("Hello,World!")`

打印输出 "Hello,World!" 。注意以下两点：

1. `Println` 函数首字母大写。在 Go 中，变量和字母的命名规则：名称**首字母大写表示公有**，相当Java 的 `public` 关键字，**首字母小写表示私有**，相当Java 的 `public` 关键字。Go 语言更提倡使用驼峰命名法，此处简要说明，更多更详细更准确的 命名规则看官方文档去。
2. 和其他编译型语言不一样，Go 语言 语句 **不需要用 分号 `;` 结尾！**



# 2. 数据类型

## 2.1 整型

> 内容修改自 菜鸟教程 [Go 语言数据类型](https://www.runoob.com/go/go-data-types.html)

Go 也有基于架构的类型，例如：`int`、`uint` 和 `uintptr`。

| 标识符 | 类型 | 范围 |
| :---: | :--: | :--: |
| `uint8` | 无符号 8 位整型 | 0 到 255 |
| `uint16` | 无符号 16 位整型 | 0 到 65535 |
| `uint32` | 无符号 32 位整型 | 0 到 4294967295 |
| `uint64` | 无符号 64 位整型 | 0 到 18446744073709551615 |
| `int8` | 有符号 8 位整型 | -128 到 127 |
| `int16` | 有符号 16 位整型 | -32768 到 32767 |
| `int32` | 有符号 32 位整型 | -2147483648 到 2147483647 |
| `int64` | 有符号 64 位整型 | -9223372036854775808 到 9223372036854775807 |

一般整型的话就使用 `int` 类型就OK .

## 2.2 浮点型

有两种：单精度 （**`float32`**） 和 双精度（**`float64`**）.

还有一种 **复数** 类型，也分两种：`complex64` and
`complex128`. 

 顺便提一下，Go 也有类似 `None` 表示啥都没有的意思，是为 **`nil`**,更多详细信息，请。。。

附表一张：[Go 语言的各种数据类型的默认零值](https://www.jianshu.com/p/cc1eb93b2f6c)

| Type           | 默认值                  |
| -------------- | ----------------------- |
| Interger       | 0                       |
| Float          | 0                       |
| Complex Number | 实数部分：0 虚数部分：0 |
| Byte           | 0                       |
| Rune           | 0                       |
| String         | ""                      |
| Bool           | false                   |
| Array          | 元素的默认值            |
| Slice          | nil                     |
| Map            | nil                     |
| Channel        | nil                     |
| Interface      | nil                     |
| Struct         | 字段类型的默认值        |
| Pointer        | nil                     |
| Function       | nil                     |

- 四种基本算术运行类型：

加（**+**），减（**-**），乘（*****），除（**/**），求余（**%**）。



来看个程序：**程序 2.1**

```go
package main

import f "fmt"

func main(){

	var x float64 = 1
	var y int = 1
	f.Println("Hello,World!")
    // statement
}
```

以上是主程序，至于最后一条语句，分三种执行看看会有什么不同的结果：

- ` case 1`：

```
	// f.Println("x + y = ", x + y)	
```

对，你没看错，唯一一个语句还被注释掉了，就是以上程序，啥都不加，运行看看会有什么结果：

```
x declared but not used
y declared but not used
```

是的，在 Go 中，**不允许变量声明了却不使用。**

- `case 2`：

```go
	f.Println("x + y = ", x + y)	
```

运行结果：

```
invalid operation: x + y (mismatched types float64 and int)
```

是的，**不同的数据类型不能用来做基础算术运算。**

- `case 3`：

```
	f.Println("x + y = ", x + float64(y))
```

运行结果：

```
Hello,World!
x +y =  2
```

发现没有，`float64(y))`，**强制数据类型转换** 的方式跟 Python 很像，数据类型作为函数名，被转数据做参数，返回结果为需要的数据类型。



## 2.3 字符串

> Go语言的字符串是一个用 UTF-8 编码的变宽字符序列，它的每一个字符都用一个或多个字节表示。

1. 双引号

```go
"Hello,world!"
```

2. 获得字符串的第 **`n + 1`** 个字符

```go
"Hello,world!"[1]	// e 序号从零开始
```

3. 获得**字符串长度**

```go
len("Hello,world!")
```

4. 连接字符串

```go
"Hello," + "world!"
```

跟 Python 一模一样。



还有一点：

```go
Println(`I
                  love
                            you.`)
```

打印结果：

```
I
					love
							you.
```

这个 **反引号 ``** 是不是跟 Python 的 **三引号** （**`'''`** 或 **`"""`**） 效果一样的 ？



## 2.4 布尔类型

两个：`true` 和 `false`

**程序 2.2**

```go
func main() {
    fmt.Println(true && true)
    fmt.Println(true && false)
    fmt.Println(true || true)
    fmt.Println(true || false)
    fmt.Println(!true)
}
```

运行结果：

```
true
false
true
true
false
```



# 3. 变量

- **变量的类型声明与赋值**

变量的类型声明与赋值可以不同时进行，可以只进行类型声明不赋值，甚至可以不进行类型声明，直接赋值。

1. 先类型声明，后赋值：

```go
var x string
x = "hello,world!"
```

2. 类型声明，同时赋值

```go
var x string = "hello,world!"
```

3. 只进行类型声明，不赋值

```go
var x float64
```

4. 不进行类型声明，直接赋值

```go
var x = "hello,world"
y := "你好，世界"
```

- 总结一下：

由以上的例子，我们可知。在 Go 语言中，对变量的赋值可大致分为三种情况：

1. **不赋值**，这种情况下**必须声明变量类型**。声明之后，Go 会给它一个默认的初始零值。**2.2 节** 有一张表，可参考各种数据类型的默认零值。

2. 声明类型，并且赋值。类型声明和赋值可以一步到位，也可以分开进行。Go 语言变量声明语法：

   **`var`**关键字	***变量名***	***数据类型标识符***

   这与 C 语言数据类型声明的语法**完全相反**。记住是完全相反。比如，数组的定义：

   ```
   // C 语言
   int a[5] = {1,2,3,4};
   // Go 语言
   x := [5]float64{ 98, 93, 77, 82, 83 }
   ```

3. 不声明类型，直接赋值。此种情况由编译器进行 类型推导。语法有两种，一种继续使用 `var` 关键字，另一种不使用，而是使用更简单的  **`:=`** 操作符。

   由于后一种语法更简洁新颖，因此，大多数人使用这种方式赋值。



- 命名：

通常以字母开头，除首字母之外，其他字母可以是 数字，字母，下划线。

习惯用驼峰命名法，`camelCase`.



- **作用域**（**Scope**）：

**程序 3.1**：

```go
package main
import "fmt"

var x string = "Hello, World"

func main() {
    var y string = "你好，世界。"
	fmt.Println(x)
    f()
    fmt.Println(y)
}

func f() {
	fmt.Println(x)
    // fmt.Println(y)	// #1 error : undefined: y
}
```

- 解析：

变量 `x` 处于所有函数最外层，所以所有函数都能访问到它。

变量 `y` 处于 `main` 函数内部，作用域也再此。所以只有在函数内部才能访问到它。

简单来说，**变量的作用域**就处于**离它最近**的**花括号`{}`之内**。



- **常量**

**程序 3.2**：

```go
package main
import "fmt"
func main() {
	const x string = "Hello, World"
    const y = "你好，世界"	// 注意这里是 “=”，不是 “:=”
    y = "再见，世界"	// error 常量值不允许改变
	fmt.Println(x)
    fmt.Println(y)
}
```

- 运行结果

```
Hello, World
你好，世界
```

- 解析：

1. 和其他语言一样，常量是不可以被改变的。

2. 和变量一样，常量的定义也可以不声明数据类型，让编译器去进行 类型推导，其格式如下：

   **`const`**关键字	***变量名***	**等于号 `=`**	变量值

   记住，是 **等于号**，不是 **`:=`**



- **多重赋值**

```go
var (
    a = 5
    b = 10
    c = 15
)
```

了解一个程序：**程序 3.3**：

```go
package main
import "fmt"
func main() {
    fmt.Print("Enter a number: ")
    var input float64
    fmt.Scanf("%f", &input)
    
    output := input * 2
    
    fmt.Println(output)
}
```

`fmt` 标准库的又一个函数，`Sacnf` ,看着形式，跟 C 语言的 `scanf` 有什么区别？



# 4. 控制结构

## 4.1 循环语句

Go 语言语法上做了诸多创新，例如 `for` 关键字就是一例。

*以下内容参考自* [Go 语言 for 循环](https://www.runoob.com/go/go-for-loop.html)

在 Go 语言中，**循环**结构**只有**一个关键字，那就是 **`for`** 关键字。也就是说，一个  **`for`** 关键字 相当于

1. C 语言的 `for` 关键字：语法格式为：

   **`for init; condition; post { }` **

如下例：

```go
func main() {
    for i := 1; i <= 10; i++ {
        fmt.Println(i)
	}
}
```

*Go 语言也支持 自增（++），自减（--）运算符*

2.  C 语言的 `while` 关键字，语法格式为：

    **`for condition { }`**,

如下例：

```go
func main() {
    i := 1
    for i <= 10 {
        fmt.Println(i)
        i = i + 1
    }
}
```

3.  C 语言的 `for(;;)` ,Rust 的 `loop`，语法格式为：

   **`for { }`**，如下例：

```go
func main() {
        sum := 0
        for {
            sum++ // 无限循环下去
        }
        fmt.Println(sum) // 无法输出
}
```

- **init**： 一般为赋值表达式，给控制变量赋初值；*
- **condition**： 关系表达式或逻辑表达式，循环控制条件；*
- **post**： 一般为赋值表达式，给控制变量增量或减量。*



当然，除此之外，Go 还支持 `for item in  array` 语法的循环迭代，如下例：**程序 4.1**

```go
package main
import "fmt"

func main() {
        strings := []string{"google", "runoob"}
        for i, s := range strings {
                fmt.Println(i, s)
        }


        numbers := [6]int{1, 2, 3, 5}
        for i,x:= range numbers {
                fmt.Printf("第 %d 位 x 的值 = %d\n", i,x)
```



## 4.2 `if` 语句

和其他语言的 `if`语句差别不大，且看 **程序 4.2** :

```go
if i % 2 == 0 {
    // divisible by 2
} else if i % 3 == 0 {
    // divisible by 3
} else if i % 4 == 0 {
    // divisible by 4
}else{
    fmt.Println("nothing")
}
```

需要说明的是，`if` 表达式 **只会执行 第一个** 条件表达示**（condition）** 计算结果为 **`true`** 的关联代码块，跳过其他 条件分支。

例如本例，若 `i=6` 时，就只会执行与 `if i % 2 == 0 ` 相关联的语句块，而不会判断任何其他条件分支。



## 4.3 `switch` 语句

与 C 语言类似，`case` 关键字后面接条件表达式，`default` 关键字用来执行任何条件都不满足的情况。

除了老生常谈的语句末尾不用分号以外，还**不需要**用 **`break`** 跳出，以防止 匹配到满足条件的分支之后仍然会向下执行的问题。看下例：

```go
switch i {
	case 0: fmt.Println("Zero")
	case 1: fmt.Println("One")
	case 2: fmt.Println("Two")
	case 3: fmt.Println("Three")
	case 4: fmt.Println("Four")
	case 5: fmt.Println("Five")
	default: fmt.Println("Unknown Number")
}
```

和 `if` 语句一样，`switch` 语句也只会执行第一满足条件的关联代码块。



# 5. 数组，切片 和 Map

## 5.1 数组

- 定义：一系列 **相同数据类型** 的集合。

  数组包含的每个数据被称为 数组 **元素**（element）.

  数组包含的 **元素个数** 被称为 数组的 **长度**。

  

- 声明方法：

  ```go
  var x [5]int
  var x []float64	// 长度为 0 的数组
  ```

  代码示例 1：

  ```go
  package main
  import "fmt"
  func main(){
      var x [5]int
      x[4] = 100
      fmt.Println(x)
  }
  ```

  运行结果：

  ```
  [0 0 0 0 100]
  ```

  解析：

  和 C 语言一样，下标从零开始，另外

  和 C 语言不一样，在 Go 语言中**未被初始化数组元的素会被自动赋值为 0**，而不是像 C 语言那样赋予一个随机值。

  

- 特点：

  Go 语言中，数组 **长度在定义后就不可更改**。

  声明长度时可以是一个常量 或 常量表达式（常量表达式是指在 **编译期间** 即可计算结果的表达式）。

  **数组长度** 是该数组的一个内置常量，**可**以使用 **内置函数 `len()` 来获取**。

  代码示例 2：

  ```go
  package main
  
  import "fmt"
  
  func main() {
  	var x [5]float64
  	x[0] = 98
  	x[1] = 93
  	x[2] = 77
  	x[3] = 82
  	x[4] = 83
  	var total float64 = 0
  	for i := 0; i < len(x); i++ {
  		total += x[i]
  	}
  	fmt.Println(total / float64(len(x)))
  }
  ```

  运行结果：

  ```
  86.6
  ```

  解析：

  由于 `total` 是 `float64` 类型，`len(x)` 是 `int` 类型，所以类型不匹配。

  和 C 语言又不一样，Go 语言不支持自动类型转换，所以，

  为了保留数据精度，所以需要用 `float64()` 方法把 `int` 类型强制转换为 `float64` 类型。

  

- 数组的另一种遍历方式

  对于数组这种 可迭代变量（iterator  variable），可以用一种特殊格式的循环，代码示例 3 如下：

  ```go
  var total float64 = 0
  for i, value := range x {
  	total += value
  }
  fmt.Println(total / float64(len(x)))
  ```

  上面的 `i` 是元素的下标，`value` 是元素的值。

  这跟 `python` 的 `for k,v in enumerate(array)` 是不是一模一样？

  但其实，上面的代码语法是由问题的，前面讲到过：

  在 Go 中，**不允许变量声明了却不使用。**

  这里也是一样，变量 `i` 一次都未被使用过，因此这里 `for` 循环正确的写法应该是：

  ```go
  for _, value := range x {
  	total += value
  }
  ```

  没错，就是 下划线（**`_`**）用来告诉编译器，不需要使用这个可迭代的变量。

  

- 数组创建的另一种方式：

  前面例子创建数组的方式：

  ```go
  var x [5]float64
  x[0] = 98
  x[1] = 93
  x[2] = 77
  x[3] = 82
  x[4] = 83
  ```

  真是又丑又长，有没有更简单的方式呢？当然有，示例如下：

  ```go
  x := [5]float{98, 93, 77, 82, 83}
  ```

  还可以这样，在花括号内添加注释：

  ```go
  y := [5]float64{
      98,
      93,
      77,
      82,
      // 83,
  }
  ```

  还有一种，更灵活的方式：

  ```go
  arr := [...]int{1,2,3}
  ```

  **`...`**  会让编译器根据实际情况来分配空间。

  

## 5.2 切片

前面讲到了数组的长度是固定的，一旦被创建，就不可改变。

这样的话，对数组进行元素插入删除的操作就很不方便，有鉴于此，切片就诞生了。Go 语言中，直接操作数组很少，基本上都是使用其切片。

- 概念：

  和 `python` 一样，Go 语言中的切片指的也是数组的一部分。

  和数组类似，切片也有索引（下标）和 长度，不同的是，切片的长度是可变的。

- 切片的创建：

  切片的创建要使用内置函数 **`make()`**，代码示例：

  ```go
  // 创建一个长度不大于5的 float64 类型数组相关的切片
  x := make([]float64, 5)
  // 第三个参数表示，切片的最大容量
  x := make([]float64, 5, 10)
  ```

  

  - [ ] 关于切片的长度和容量，有什么关系和区别？

  

  切片通常关联一个数组，可以看作是数组的引用，其长度不大于其关联的数组长度。

  ---

  以上是创建一个空切片的方法，创建切片还有另一种方法，

  **`[low : high]`** 表达式，跟 `python` 一样，从 **`low`** 开始，至 **`high`** 之前一个元素结束，是的不包含 **`high`**.

  ，示例如下：

  ```go
  arr := [5]float64{1,2,3,4,5}
  x := arr[0:5]
  ```

  支持以下方式：

  ```go
  arr[:]		// 包含关联数组的所有元素，等价于 arr[0:len(arr)]
  arr[:4]		// 包含从下标零开始到指定下标之前的关联数组的所有元素,等价于 arr[0:4]
  arr[3:]		// 包含从指定下标开始到关联数组的最后一个元素，等价于 arr[3:len(arr)]
  ```



- 切片操作的内置函数：

  - **`append`**

    如果切片容量充足，将新元素直接插入切片的末尾位置，切片长度相应增加；

    如果容量不足，将新建一个数组，所有元素被复制过去，新元素被插入末尾位置，返回一个新的切片。

    用法示例如下：

    ```go
    func main() {
    	slice1 := []int{1, 2, 3}
    	slice2 := append(slice1, 4, 5)
    	fmt.Println(slice1, slice2)
    }
    ```

    运行结果：

    ```
    [1 2 3] [1 2 3 4 5]
    ```

    和 `python` 不一样，第一个参数是切片。

  
  - **`copy`**

    **`copy(dst,src)`** 函数有两个参数，**`dst`** 和 **`src`**，**`src`** 中所有元素将被复制到 **`dst`** 中。如果两个切片长度不一致，将取较短一方的长度。

    **`copy`** 只能操作同类型的切片。

    代码示例如下：

    ```go
    func main() {
    	slice3 := []int{1, 2, 3}
    	slice4 := make([]int, 2)
    	slice5 := make([]int, 8)
    	copy(slice4, slice3)
    	copy(slice5, slice3)
    	fmt.Println(slice3, slice4, slice5)
    }
    ```

    运行结果如下：

    ```
    [1 2 3] [1 2] [1 2 3 0 0 0 0 0]
    ```



## 5.3 Map

**`Map`** 是一个键值对组成的无序集合，有时候也被称为 关联数组，哈希表，或者字典。

定义示例如下：

```go
var x map[string]int
var x map[int]int
```

鉴于与 python 的字典高度相似，废话就不多说了，继续上栗子：

示例一：

```go
var x map[string]int
x["key"] = 10
fmt.Println(x)		// error
fmt.Println(x["key"])		// pass
```

示例二：删除元素（**`delete() 方法`**）

```go
x := make(map[int]int)
x[1] = 10
fmt.Println(x[1])
delete(x, 1)
```



示例三：查找 `Map` 中不存在的元素

```go
package main

import "fmt"

func main() {
	elements := make(map[string]string)
	elements["H"] = "Hydrogen"
	elements["He"] = "Helium"
	elements["Li"] = "Lithium"
	elements["Be"] = "Beryllium"
	elements["B"] = "Boron"
	elements["C"] = "Carbon"
	elements["N"] = "Nitrogen"
	elements["O"] = "Oxygen"
	elements["F"] = "Fluorine"
	elements["Ne"] = "Neon"
	// fmt.Println(elements["Li"])

	if name, ok := elements["Un"]; ok {
		fmt.Println(name, ok)
	}

	name, ok := elements["Un"]

	fmt.Printf("the value of name is \"%s\", type is %T.\n", name, name)
	fmt.Printf("the value of ok is \"%t\", type is %T.\n", ok, ok)
}
```

运行结果：

```
the value of name is "", type is string.
the value of ok is "false", type is bool.
```

解析：

`elements` 是一个几个化学元素的 `Map`，

```go
name, ok := elements["Un"]
```

查找一个不存在的元素，`name` 是其查找的结果，`ok` 告诉是否查找成功，是一个布尔值。



```go
fmt.Printf("the value of name is \"%s\", type is %T.\n", name, name)
fmt.Printf("the value of ok is \"%t\", type is %T.\n", ok, ok)
```

打印他们的值和类型，`Printf` 和 C 语言中的同名函数很类似，不同的是，

`"%t"` 表示的是布尔值，`"%T"` 表示的是数据类型。



```go
if name, ok := elements["Un"]; ok {
    fmt.Println(name, ok)
}
```

这是 Go 语言特有的语法和机制，python3.8 引进的海象运算符应该是受其启发。

`name, ok := elements["Un"];` 语句后面的 `ok` 是 `if` 的判断条件。

需要注意的是，这种格式下，`name` 和 `ok` 都是临时变量，也就是说离开 `if` 之后就会被释放，这也是这段代码后面再次添加一个 `name, ok := elements["Un"]` 的原因。

---

再来看一个更复杂的 `Map` 类型：

```go
func main() {
	elements := map[string]map[string]string{
		"H": map[string]string{
			"name":  "Hydrogen",
			"state": "gas",
		},
		"He": map[string]string{
			"name":  "Helium",
			"state": "gas",
		},
		"Li": map[string]string{
			"name":  "Lithium",
			"state": "solid",
		},
		"Be": map[string]string{
			"name":  "Beryllium",
			"state": "solid",
		},
		"B": map[string]string{
			"name":  "Boron",
			"state": "solid",
		},
		"C": map[string]string{
			"name":  "Carbon",
			"state": "solid",
		},
		"N": map[string]string{
			"name":  "Nitrogen",
			"state": "gas",
		},
		"O": map[string]string{
			"name":  "Oxygen",
			"state": "gas",
		},
		"F": map[string]string{
			"name":  "Fluorine",
			"state": "gas",
		},
		"Ne": map[string]string{
			"name":  "Neon",
			"state": "gas",
		},
	}
	if el, ok := elements["Li"]; ok {
		fmt.Println(el["name"], el["state"])
	}
}
```

看看就行，不打算深究了，不懂等着慢慢懂吧。



# 6. 函数









