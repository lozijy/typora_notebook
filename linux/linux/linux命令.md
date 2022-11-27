## 常用linux命令的基本使用

| ls    | list                 | 查看当前文件夹下的内容   |
| ----- | -------------------- | ------------------------ |
| pwd   | print work directory | 查看当前文件夹           |
| cd    | change directory     | 切换文件夹               |
| touch | touch                | 如果文件不存在则新建文件 |
| mkdir | make directory       | 创建目录                 |
| rm    | remove               | 删除文件                 |
| clear | clear                | 清屏                     |

## find

## 打包/解包

## 安装

## ls

## cd

## touch

## mkdir

## rm

## tree

## cp

## mv

## 查看文件内容

### cat

concatenate 查看文件内容，创建文件，文件合并，追加文件内容等功能

### more 

分屏显示文件内容

### grep	

搜索文本文件内容

### echo

echo+文字内容会在终端显示参数指定的文字，通常回合重定向联合使用

重定向>和>>

linux允许将命令执行结果重定向到一个文件将本应显示在终端上的内容输出追加到指定文件中。

其中>表示输出,会覆盖文件原有的内容>>表示追加，会将内容追加到已有文件的末尾

### 管道 |

Linux允许将一个命令的输出可以通过管道作为另一个命令的输入

这里的|可以理解为一个管道，左边塞东西(写),右边取东西(读)

常见的管道命令有more:分屏显示内容,grep在命令执行结果的基础上查询指定的文本

## 系统信息

### 时间和日期

data 查看系统时间

cal	查看日历,-y可以查看一年的日历

### 磁盘信息

df -h 显示磁盘剩余空间

df -h [文件名]	显示目录下的文件大小

### 进程信息

ps aux process status查看进程的详细状况

-a显示终端上的所有进程，包括其他用户的进程

-u显示进程的详细状况

-x显示没有控制终端的进程



top	动态显示运行中的进程并且排序

kill [-9]进程代号	终止指定代号的进程,-9表示强行终止

最好只终止由当前用户开启的进程而不要终止root身份开启的进程，否则可能导致系统崩溃

## 用户权限

### 组管理

groupadd添加组

groupdel删除组

cat /etc/group 确认组信息

chgrp -R组名 文件/目录名 递归修改文件/目录的所属组

### 用户管理

创建用户/设置密码/删除用户

| useradd -m -g 组 新建用户名 | 添加新用户   | -m自动建立用户home目录 -g指定用户所在的组，否则会建立一个和用户同名的组 |
| --------------------------- | ------------ | ------------------------------------------------------------ |
| password 用户名             | 设置用户密码 | 如果是普通用户，直接用password可以修改自己的帐户密码         |
| userdel -r 用户名           | 删除用户     | -r会自动删除用户家目录                                       |
| cat /etc/passwd \|grep      | 确认用户信息 | 新建用户时，用户信息会自动保存在/etc/passwd文件中            |

查看用户信息

| id [用户名] | 查看用户UID和GID信息       |
| ----------- | -------------------------- |
| who         | 查看当前所有登录的用户列表 |
| whoami      | 查看当前登录用户的账户名   |

/etc/passwd是用于保存用户信息的文件

/usr/bin/passwd是用于保存用户密码的程序

## which

which命令可以查看执行命令所在位置

```shell
which ls        //bin/ls
which useradd	//usr/sbin/useradd
```

绝大多数可执行文件都是保存在/bin  /sbin  /usr/bin /usr/sbin

/bin 是二进制执行文件目录,主要用于具体应用

/sbin是系统管理员专用的二进制代码存放目录，主要用于系统管理

/usr/bin是后期安装的一些软件

/usr/sbin超级用户的一些管理程序



cd这个终端命令是内置在系统内核中的，没有独立的文件，因此用which无法找到cd命令的位置

##　修改文件权限

chown 修改拥有者

chgrp修改组

chmod修改权限

## 切换用户

su -用户名 切换用户，并且切换目录

exit 退出当前登录账户



## 远程管理

关机/重启

查看配置网卡信息

​	ifconfig

​	ping

## ssh

ssh [-p port] user@remote

-p port是可选项，不指定的话默认是22

user是远程机器上的用户名,不指定的话默认为当前用户

remote是远程机器的地址，可以是IP/域名,或者是别名

ssh这个终端命令只能在linux或unix系统下使用。

## scp

secure copy,用来进行远程拷贝文件的命令

地址格式与ssh基本相同，需要注意的是,选定端口时用的是大写的-P而不是小写的



把本地当前目录下的01.py文件复制到远程home目录下的Desktop/01.py

```shell
scp -P port 01.py user@remote:Desktop/01.py
```

把远程Home目录下的Desktop/01.py文件复制到本地当前目录下的01.py

```shell
scp -P port user@remote:Desktop/01.py 01.py
```

把当前目录下的demo文件夹复制到远程家目录下的desktop

```shell
scp -r demo user@remote :Desktop
```

把远程目录家目录下的desktop复制到当前目录下的demo文件夹

```shell
scp -r user@remote:Desktop demo
```



scp这个终端命令只能在linux或者unix系统下使用,如果是在windows系统，可以安装putty，使用pscp命令行工具或者安装filezilla使用ftp进行文件传输
