[linux-Centos7安装python3并与python2共存](https://www.cnblogs.com/JahanGu/p/7452527.html)

> 内容来自以上博客，有删改

# 1. 查看是否已经安装Python

CentOS 7.2 默认安装了python2.7.5 因为一些命令要用它比如yum 它使用的是python2.7.5。

使用 `python -V` 命令查看一下是否安装Python

然后使用命令 `which python` 查看一下Python可执行文件的位置

![img](https://images2017.cnblogs.com/blog/1226698/201708/1226698-20170830120844358-1686107415.png)

可见执行文件在**/usr/bin/** 目录下，切换到该目录下执行 `ll python*` 命令查看 

![img](https://images2017.cnblogs.com/blog/1226698/201708/1226698-20170830121355483-715442589.png)

python 指向的是python2.7

# 2. 备份python软连接和安装相关依赖包

因为我们要安装python3版本，所以python要指向python3才行，目前还没有安装python3，先备份,备份之前先安装相关包，用于下载编译python3.执行以下命令：

```shell
yum install libffi-devel zlib-devel bzip2-devel \
openssl-devel ncurses-devel sqlite-devel \
readline-devel tk-devel gcc make wget
```
**不能忽略相关包**，我之前就没有安装readline-devel导致执行python模式无法使用键盘的上下左右键；

然后备份

```shell
mv python python.bak
```



# 3. 开始编译安装python3

1. 去官网下载编译安装包或者直接执行以下命令下载

```shell
wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz
```

2. 解压 并 进入解压目录
```shell
tar -xvJf  Python-3.7.4.tar.xz
cd Python-3.7.4
```

3. 编译安装
```shell
./configure --enable-optimizations  prefix=/usr/local/python3  
make && make install
```
安装完毕，/usr/local/目录下就会有python3了



4. 添加软链到执行目录下/usr/bin
```shell
ln -s /usr/local/python3/bin/python3 /usr/bin/python
```
![img](https://images2017.cnblogs.com/blog/1226698/201708/1226698-20170830123437999-1379416720.png)

可以看到软链创建完成



5. 验证

```shell
python -V  # 看看输出的是不是python3的版本
python2 -V  # 看到的就是python2的版本
```



6. 修改依赖 python2 的配置文件

   因为执行yum需要python2版本，所以我们还要修改yum的配置，执行：

```shell
vi /usr/bin/yum
```

把**#! /usr/bin/python**修改为**#! /usr/bin/python2**

![img](https://images2017.cnblogs.com/blog/1226698/201708/1226698-20170830123843405-856911492.png)



同理 

```shel
vi /usr/libexec/urlgrabber-ext-down
```

 文件里面的 **#! /usr/bin/python** 也要修改为 **#! /usr/bin/python2**





以下内容来自博客 [centos 下安装pip pip3](https://www.cnblogs.com/crazytata/p/9889184.html)，有删改。



# 4. 安装和管理 pip

1. 安装 并升级 pip2

```shell
yum -y install epel-release
yum install python-pip		# 安装 pip

pip install –-upgrade pip	# 升级 pip
```



2. 创建 pip3 软链接

在之前装的python3 的/usr/bin 目录下有pip3 ，因此创建Pip3的软链接j即可

```shell
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
```

此时pip 和pip3 均可用~~

sudo yum install python34-pip



# 5. 关于 yum

http://www.imzcy.cn/1967.html

**4.1、centos7.4修改默认python版本为3.6.1之后YUM不能使用解决方法**

4.1.1、查找yum命令所在位置

whereis yum yum: /usr/bin/yum /etc/yum /etc/yum.conf /usr/share/man/man8/yum.8 



4.1.2、替换yum程序调用的python版本

sed -i 's@#!/usr/bin/python@#!/usr/bin/python2@' /usr/bin/yum sed -i 's@#! /usr/bin/python@#! /usr/bin/python2@' /usr/libexec/urlgrabber-ext-down 



**centos7.4下的yum和RHEL5.8的不一样，不能只修改yum命令的本身，还需要修改上面所示的其调用的urlgrabber-ext-down程序，不然还会报下面这个错误：**

​	

[root@imzcy ~]# yum list
已加载插件：fastestmirror
Loading mirror speeds from cached hostfile

 * base: mirrors.aliyun.com
 * epel: mirror.premi.st
 * extras: mirrors.aliyun.com
 * updates: mirrors.aliyun.com
    File "/usr/libexec/urlgrabber-ext-down", line 28
    except OSError, e:
                  ^
SyntaxError: invalid syntax
    File "/usr/libexec/urlgrabber-ext-down", line 28
    except OSError, e:
                  ^
SyntaxError: invalid syntax
    File "/usr/libexec/urlgrabber-ext-down", line 28
    except OSError, e:
                  ^
SyntaxError: invalid syntax
由于用户取消而退出

 

 