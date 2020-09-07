[TOC]

# 目录

<br />

# 1. 源码官方文档
源码：https://github.com/git/git

文档：https://git-scm.com/docs

# 2. 基本原理

## 2.1 git 三个工作区域的概念

  git 的三个工作区域： **仓库**、**工作区**以及**暂存区**



- 示意图

![img](https://git-scm.com/book/en/v2/images/areas.png)



- 概念：

|  工作区域  | 概念                                                         |
| :--------: | ------------------------------------------------------------ |
|  **仓库**  | Git 用来保存项目的元数据和对象数据库的地方。 这是 Git 中最重要的部分，从其它计算机克隆仓库时，拷贝的就是这里的数据。 |
| **工作区** | 工作区是对项目的某个版本独立提取出来的内容。 这些从 Git 仓库的压缩数据库中提取出来的文件，放在磁盘上供你使用或修改。 |
| **暂存区** | 暂存区是一个**文件**，保存了**下次将提交**的**文件列表信息**，一般在 Git 仓库目录中。 有时候也被称作 “索引”，不过一般说法还是叫暂存区。 |

- **工作区** 不等于 **分支**

  - **工作区**：

    当前git仓库目录下的文件夹，包含当前 git 分支的所有内容 和 工作区独有的内容（包含**未跟踪的文件**等），**工作区个人认为i可以理解为 操作文件（主要是更改，当然也包括新增等操作）的 区域**。

  - **分支**  ：

    git 仓库里的一个分支，来**源于 git仓库**  
  
  


## 2.2 git 仓库中文件的三种状态

  在git 仓库中，你的文件可能处于其中之一：**已提交**（committed）、**已修改**（modified）和**已暂存**（staged）。

|    状态    | 含义                                                         |
| :--------: | ------------------------------------------------------------ |
| **已修改** | 表示**已修改**了文件，但还**没保存**到数据库中。             |
| **已暂存** | 表示对一个**已修改**文件的当前版本做了**标记**，使之包含在下次提交的快照中。 |
| **已提交** | 表示数据**已**经安全的**保存**在本地数据库中。               |



## 2.3 工作区文件的两种状态

工作区文件状态可以划分为 **未跟踪**（**Untracked**）状态 和 **跟踪**状态

|    状态    | 含义                                  |
| :--------: | ------------------------------------- |
| **未跟踪** | 表示新增的文件，从未被 暂存 或 提交。 |
|  **跟踪**  | 表示被暂存或提交过的文件。            |



  ## 2.4 基本工作流程

- 流程图：

```
graph LR
	修改 --> 暂存
	暂存 --> 提交
```

- 说明：

|   步骤   | 说明                                                        |
| :------: | ----------------------------------------------------------- |
| **修改** | 在**工作区**中修改文件。                                    |
| **暂存** | 将文件的快照添加到**暂存区**                                |
| **提交** | 提交更新，找到暂存区的文件，将快照永久性存储到 **git 仓库** |

- 注意文件的三种基本操作由于都有特定的操作区域：

  文件的**修改**，**新增**，仅限于工作区，

  文件的**添加**（暂存）仅限于暂存区，

  文件的**提交**仅限于仓库，

  因此此教程后文的大部分将直接使用操作名称时将不强调操作的区域。仅以操作名出现在后文。



# 3. 基本配置

- 必须：
设置用户名和邮件地址，每次提交都会使用这些信息
```shell
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```
- 可选：
```sehll
git config --global core.editor emacs
```
配置默认的文本编辑器，emacs是文本编辑器的一种，“emacs”也可以换成 "vim"，windows环境下需要搜索到路径
git 默认的编辑器是 GUN nano ,在 commit 进入次编辑器时，需要用 ctrtl + o 组合键保存，ctrtl + x 组合键退出。

- 查看配置信息:

```sehll
git config --list			#查看所有的git配置信息。（所有存储在.gticonfig 文件中的信息）
git config --global --list	#获取全局的配置信息，该信息储存在 ~/.gticonfig 文件中
```



# 4. 基础命令

## 4.1 获取 git 仓库

### 4.1.1 git init 初始化仓库

- 示例

```shell
git init
```

- 用途

  对现有项目进行管理或者创**建一个空的 git 管理的项目**，改命令将会创建一个 .git文件夹，改文件夹包含git仓库的重要信息。

### 4.1.2 git clone 克隆已有仓库

- 示例1

```
git clone https://github.com/dayelu/pythonStudy.git
```

- 示例2

```shell
git clone https://github.com/dayelu/pythonStudy.git Pystudy
```

- 说明

  克隆已有的仓库，“https://github.com/dayelu/pythonStudy.git” 是克隆的链接地址，示例1中，没有指定仓库被克隆后存放的文件夹名，则文件夹会使用默认的仓库名来作为文件夹名，此例 ”**pythonStudy**“ 为默认的文件夹名。

  如需指定 **存放仓库的文件夹名** 可以在链接后加一个指定名，如例2 以 Pystudy 作为 存放仓库的文件夹名。



## 4.2 查看文件和仓库状态

### 4.2.1 git status 查看文件状态

- 用途

  对比**当前文件**状态与 **已提交的文件**的状态，返回 与 git 仓库 中有差异的文件及其差异的信息。

- 参数：
   **-s**（short）紧凑简短格式输出

- 示例

```shell
git status -s
```
- 返回结果

```
 M	README
MM 	Rakefile
A 	lib/git.rb
M 	lib/simplegit.rb
 ? ? 	LICENSE.txt
```
- 解析

1. 三种基本符号

| 标识符 | 含义                       |
| :----: | :------------------------- |
|   ??   | **新增**的**未跟踪**文件   |
|   A    | **新添加到暂存区后**的文件 |
|   M    | **被修改**过的文件         |

- M 标识符的三种不同形式

|   标识符    | 含义                       |
| :---------: | :------------------------- |
| M出现在左边 | 修改后，已暂存的文件       |
| M出现在右边 | 修改后，未暂存的文件       |
|     MM      | 修改后暂存，又被修改的文件 |

- 注意！！！

  区别于 标识符 A，M出现在左边时，表示该文件曾提交过。因此还有 标识符 
  
  **MA** ，表示 **新添加到暂存区后，又被修改过的文件**。



### 4.2.2 git diff 查看未暂存文件的改动

- 说明

  本身只显示尚未暂存的改动，而不是自上次提交以来所做的所有改动

 - 参数：--cached或者git diff --staged	

   查看已暂存的将要添加到下次提交里的内容



### 4.2.3 git log 查看提交历史

- 参数：

  |   参数   | 作用                                                      |
  | :------: | --------------------------------------------------------- |
  |    -p    | 用来显示每次提交的内容差异                                |
  |    -2    | 仅显示最近两次提交，可以是任何提交次数范围内的数字        |
  |  --stat  | 查看每次提交的简略的统计信息                              |
  | --pretty | 【format:"%h - %an, %ar : %s"】	格式输出（具体见官档） |

- 示例

  ```shell
  git commit -m 'initial commit'
  git add forgotten_file
  git commit --amend
  ```


- 复杂参数

  ```sehll
  git log --oneline --decorate --graph	--all 
  ```

  输出你的提交历史、各个分支的指向以及项目的分支分叉情况。

**Notice**：

除了以上使用方法外，`git log` 命令还可以 **以文件或文件夹做参数** 以查看文件或文件夹及其目录下所有文件和子文件等等的所有提交改动信息。


## 4.3 暂存和提交文件

### 4.3.1 git add 暂存文件

- 示例

```shell
git add hello.c
```

- 参数

  \-A		添加所有文件使用，命令 `git add .` 更通用。

### 4.3.2 .gitignore 文件

 在工作目录下创建一个该文件，可用于**过滤**日志文件等不必要信息，被过滤的文件将不会被跟踪。

例如，在 **.gitignore**  文件中添加”*.txt“,将过滤**.gitignore** 文件所在目录的所有以 .txt 为后缀的文件。

具体语法格式参考官档。



### 4.3.3 git commit 提交文件

- 参数

|  参数   | 作用                                                        |
| :-----: | ----------------------------------------------------------- |
|   -m    | 添加提交说明                                                |
|   -a    | 直接将**已跟踪**的文件一并提交而不必git add（添加到暂存区） |
| --amend | 撤销上次提交并将修改后的文件同上一次修改的记录的合并提交    |

- --amend 参数示例

```sehll
git commit -m 'initial commit'
git add forgotten_file
git commit --amend
```

- 说明

  最终你只会有一个提交 - 第二次提交将代替第一次提交的结果。

- 注意
  使用这个技巧的时候需要小心，因为修正会改变提交的 SHA-1 校验和。 它类似于一个小的变基 - **如果已经推送了**最后一次提交就不要修正它（怪不得每次推上去之后在使用这个命令还要合并一波）。

## 4.4 操作文件

### 4.4.1 git rm 移除文件

- 作用

  移除文件并暂存，相当于

```sehll
rm filename
git commit add filename
```
  两步操作。

- 参数

|   参数   | 作用                                                         |
| :------: | ------------------------------------------------------------ |
|    -f    | 强制删除提交后修改过放入暂存未提交的文件                     |
| --cached | 从git仓库移除，但是不在工作区删除，即使该文件处于未跟踪状态。 |



### 4.4.2 git mv 移动/重命名文件

- 作用

  移动/重命名文件并暂存，相当于

  ```shell
  mv README.md README
  git rm README.md
  git add README
  ```

- **提示！！！**

  经过实践，可以推断在git（或者在linux）中 文件的移动其实就是其文件名（包含路径）发生了改变，
  从 mv 可以进行rename操作也可以臆侧这一点。



## 4.5 撤回操作

### 4.5.1 git reset  取消文件的暂存

- 用法

```shell
git reset  HEAD  filename
```

- 参数

  --hard 	回滚到某一次提交

- 用法

  通过 git log 找到 *commitID*，如
  `git reset --hard 1a410efbd13591db07496601ebc7a059dd55cf`

### 4.5.2 git checkout 撤销对文件的修改

- 用法

```
git checkout  -- filename
```

- **注意！！！**

  经本人亲自试验，此操作只对跟踪过已修改状态，**未暂存**的文件撤销有效。**对于已暂存的文件回天乏力**。

## 4.6 切换到指定提交记录或版本

### 4.6.1 切换到指定提交记录（commit id）

```bash
git checkout 273f06be52d6955c33d704acc5a2f2247b1dfdb0
```

`273f06be52d6955c33d704acc5a2f2247b1dfdb0` 是 `commit id` ，可先使用 `git log` 命令查看相应的提交记录，查找到对应的 `commit id`. 

可以不不用完成的 `commit id`,例如 `git checkou 273f06b` 和上例是一样的效果。

### 4.6.2 切换到指定版本

```bash
git checkout v0.1.1
```

`v0.1.0` 是此 `git` 仓库的一个 **标签（`tag`）**，也就是版本号。

在切换之前可用先使用 `git tag` 命令查看相应的标签。



切换后，`git` 会将其检出为新分支，可通过 `git checkout branch_name`  回到当前分支。



# 5. 分支

## 5.1 查看分支

### 5.1.1 git branch 添加/查看当前所有分支

- 参数
  
|   参数   | 作用                                         |
| :------: | -------------------------------------------- |
|    -v    | 查看每个分支最后一次提交                     |
| --merged | 查看已合并分支                               |
|    -d    | 不可删除含未合并工作的分支，可用 -D 强制删除 |

- 无参数

```shell
git branch own
```

	**新建一个分支**



## 5.2 操作分支

### 5.2.1 git checkout 切换分支

```she
git checkout master		#切换到主分支
```

### 5.2.2 git merge 合并分支

- 示例

```shell
git merge test			#在主分支中合并test分支的内容，执行的前提是不冲突。
```



- **合并失败示例**

```
<?php
<<<<<<< HEAD
        echo 22233333;
=======
        echo 33333;
>>>>>>> master
?>
```

- 说明

  HEAD 							代表当前分支起始
  ============= 		分界线，之上表示当前分支内容，之下表示要被并入分支的内容
  master 						要被并入进来的分支



- **解决办法**

  解决冲突需要分界线上下二择一，或者自行合并，并删除标记
  暂存（git add .）,提交（git commit -m '注释'）
  或者 git commit -a -m '注释'，之后即可合并成功



### 5.2.3 git checkout -b 新建并切换到分支

- 实例

```shell
git checkout -b iss53
# Switched to a new branch "iss53"
```

相当于

```
git branch iss53
git checkout iss53
```





### 5.2.4 git branch -d 删除分支

```shell
git branch -d hotfix
```

git branch -d不可删除含未合并工作的分支，可用 -D 强制删除



# 6. 远程仓库

## 6.1 生成ssh公钥

使用远程仓库（比如github）时有时需要 进行ssh 验证，此时需要用 `ssh-keygen` 命令先生成 ssh公钥，再将生成的 ssh公钥 添加到远程服务器才能使用。



## 6.2 查看远程仓库

### 6.2.1 git  remote 

- 参数

  -v	显示需要读写远程仓库使用的 Git 保存的简写与其对应的 URL

### 6.2.2 git remote show 获取更多远程仓库信息

```bash
git remote show [remote-name]
# 获取更多远程仓库信息
```



## 6.3 操作远程仓库命令

### 6.3.1 git remote add 添加远程仓库地址

```shell
git remote add <shortname>  <url>
# 添加一个新的远程 Git 仓库，同时指定一个你可以轻松引用的简写
```



### 6.3.2 git remote set-url origin 更新添加远程仓库地址

```shell
git remote set-url origin <url>
# 更新远程git仓库的地址
```



### 6.3.2 git remote rename  重命名远程仓库

```shell
git remote rename [old_name]  [new_name]
# 重命名远程仓库，同时会修改分支名
```



### 6.3.3 git remote rm 移除远程仓库地址

```shell
git remote rm <repository>
# 移除远程仓库
```



### 6.3.3 git push origin --delete 删除远程分支

- 示例

```shell
git push origin --delete serverfix
# To https://github.com/schacon/simplegit
#  - [deleted]         serverfix
```

- 注意

  这个命令做的只是从服务器上移除这个指针。
  Git 服务器通常会保留数据一段时间直到垃圾回收运行，所以如果不小心删除掉了，通常是很容易恢复的。



## 6.3 远程仓库拉取/推送

```bash
git fetch <shortname>	
# 拉取仓库中有但你没有的信息

git push [remote-name] [branch-name]
# 推送本地文件到远程仓库分支

git pull [remote-name] [branch-name]
# 克隆最初克隆的服务器上抓取数据并自动尝试合并到当前所在的分支
```

- 关于 `git clone` 的小知识

  `git clone` 命令会自动设置本地 master 分支跟踪克隆的远程仓库的 `master` 分支（或不管是什么名字的默认分支）。(个人试验，你不必 `git init` ，只需要在文件夹使用即可)

- 注意 1，**`git pull`**

  当本地仓库 历史提交记录 与 远程的提交记录 不一致时，`git` 会提示 "**fatal: 拒绝合并无关的历史**"。这在将本地仓库**添加**一个刚刚新建的 **远程仓库地址**时会很常见，这时候可以用如下命令：

  ```bash
  git pull origin master --allow-unrelated-histories 
  ```

  允许拉取 与本地仓库冲突 的远程分支。拉取之后解决冲突即可。

- 注意 2，**`git push`**

  **第一点**

  本地仓库添加远程仓库地址后，使用 **`git push`** 需要显示地给出远程分支名，如下：

  ```bash
  git push origin master
  ```

  此时可根据提示：使用

  ```bash
  git push --set-upstream origin master
  ```

  命令，**为推送当前分支并建立与远程上游的跟踪**。

  这样，便可以直接使用 **`git push`** 命令推送了。

  **第二点**

  本地仓库添加远程仓库地址之后，并且本地的 `ssh` 公钥 已添加到远程 `git`服务器 的情况下，推送依然要输入 `git` 服务器的用户名和登陆密码，如：

  ```bash
  $ git push
  Username for 'https://github.com': 
  Password for 'https://github.com': 
  ```

  以 `github` 为例，这种情况多半是由于 **远程仓库地址选择不当** 造成的，在复制 `github` 仓库地址时会有两个选项：

  **`Use HTTPS`** 和 **`Use SSH`** 。这时候选择 **`Use SSH`** 就无需再输密码了， **`Use SSH`** 选项也有说明 ：`Use a password protected SSH key.`

  更多选项细节请看 [Which remote URL should I use?](https://docs.github.com/en/github/using-git/which-remote-url-should-i-use)



# 7. 标签与别名

## 7.1 标签

### 7.1.1 git tag

- 不带参数

```shell
git tag 			#列出标签
git tag tagname 	#不带参数，直接在git tag 命令后加上标签名
```



- 参数

| 参数                       | 作用                   |
| :------------------------- | ---------------------- |
| **-l**	'v1.8.5*'        | 罗出1.8.5系列标签列表  |
| **-a**	v1.4             | 创建附注标签           |
| **-m**	'my version 1.4' | 指定储存在标签里的信息 |
|                            |                        |

关于标签的具体用法可参见 [官方文档](https://git-scm.com/docs),

或参见博文 [Git打标签与版本控制规范](https://www.cnblogs.com/walls/p/9077958.html)


### 7.1.2 git show

```shell
git show tagname
#查看标签信息与对应的提交信息 （更多信息见官档）
```



### 7.1.3 后期打标签

- 1. 使用 **git log** 命令找到提交的校验和

```shell
git log --pretty=oneline
# 9fceb02d0ae598e95dc970b74767f19372d61af8 updated rakefile
```

- 2.打标签

```shell
git tag -a v1.2 9fceb02
# 后期打标签需要在末尾指定提交的校验和（或部分校验和）:
```

- **注意**

**git push命令不会传送标签到远程服务器上，必须像以下这样显式地上传**：

```shell
git push orgin [tag-name]
```



## 7.2 别名

- 示例

```
git config --global alias.ci commit	
```

- 说明

  使用别名后，当要输入 git commit 时，只需要输入 git ci。