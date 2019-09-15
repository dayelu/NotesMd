1.关于 hash 加密算法之一 **md5**加密算法

​	在探索式学习中发现，同一个字符串在被 **md5 **加密算法加密之后其值是固定不变的，例如 字符串 "**0000**" ,在经过 **md5 **算法加密之后永远是  **4a7d1ed414474e4033ac29ccb8653d9b**。所以说，虽然说 hash 算法是目前世界上最安的加密算法，但是这种非动态特性，想要破解也不是不可能的。

​	另外，还有一件有趣的事，似乎所有的编程语言把字符串经过一种特定的hash 算法之后得到的值也是相同的。如下例，python3 和 PHP 7 中，代码如下：

*python*

```python
import hashlib

def get_token(in_str):
    md5str = in_str
    m1 = hashlib.md5()
    m1.update(md5str.encode("utf-8"))
    token = m1.hexdigest()
    return token

in_str = "0000"
print(get_token(in_str))
```

*运行结果：*

```
4a7d1ed414474e4033ac29ccb8653d9b

```



*php:*

```php
<?php
$str = "0000";
echo md5($str);
?>
```

*运行结果：*

```
4a7d1ed414474e4033ac29ccb8653d9b
```

