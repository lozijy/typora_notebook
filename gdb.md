一、GDB的介绍
GDB（全称：GNU Debugger）是GNU工程为GNU操作系统开发的调试器。它可以用于调试C、C++、Objective-C、Pascal、Ada等语言编写的程序。

二、GDB的使用
GDB的使用条件
程序要用GDB调试，需要添加调试信息。
添加方法：

gcc的-g选项为程序添加调试信息。
例如：gcc –g –o helloworld helloworld.c

启动GDB
启动方法：
gdb [程序名称]

GDB常用命令
①GDB命令的介绍

命令名	命令功能
file	装入想要调试的可执行文件
kill	终止正在进行的调试程序
list	列出产生执行文件的源代码的一部分
next	执行一行源代码但不进入函数内部
step	执行一行源代码并可以进入函数内部
run	执行当前被调试的程序
c	继续运行程序
quit	终止gdb
watch	使你能监视一个变量的值而不管它何时被改变
backtrack	栈跟踪，查看代码被谁调用
print	查看变量的值
make	不用退出gdb，就可以重新生成可执行文件
shell	不用退出gdb，就可以使用UNIX shell命令
whatis	显示变量或者函数类型
break	设置断点
info break	显示当前断点信息，包含到达断点处的次数
info files	显示被调试文件的详细信息
info func	显示所有函数名称
info local	显示当前的函数的局部变量
info prog	显示被调试程序的执行状态
delete [n]	删除第n个断点
disable [n]	关闭第n个断点
enable [n]	开启第n个断点
ptype	显示结构定义
set variable	设置变量的值
call name(args)	调用并执行为name，参数为args的函数
Finish	终止当前函数并输出返回值
return value	停止当前函数并返回value给调用者
②GDB部分命令的使用方法
break
依据行号设置断点：break linenum
依据函数名设置断点：break funcname
依据某个源文件的某行设置断点：break filename：linenum
依据某个源文件的某函数名设置断点：break filename：funcname

三、使用GDB调试实际例子
实例1代码（实现整形数据反转）：

#include <stdio.h>
void ShowRevertNum(int iNum)
{
 while (iNum > 10)
 {
printf("%d", iNum % 10);
 iNum = iNum / 10;
 }
 printf("%d\n", iNum);
}
int main(void)
{
 int iNum;
 printf("Please input a number :");
 scanf("%d", &iNum);
 printf("After revert : ");
 ShowRevertNum(iNum);
}

程序编译：


程序调试过程：


实例2代码：

#include<stdio.h>
#include<string.h>

#define BUFSIZE 256;


static char *pStr;
static char acBuf[BUFSIZE];
int main(void)
{	
	printf("Please input a string:");
	gets(pStr);
	printf("\nYour string is:%s\n",pStr);
}

编译执行：

当遇到段错误时，使用core来快速定位问题。
方法：
①产生core文件
ulimit -c num(num为数字，0表示不产生core文件)
②运行程序，让程序崩溃，产生core文件
③gdb配合core文件，定位
gdb 程序名 core文件名
通过上述方法，就可以定位到问题出现的地方。
实例3代码：



#include<stdio.h>
int main()
{
	int *p=0;
	*p=1;
	return 0;
}
版权声明：本文为CSDN博主「HarrietLH」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_43279579/article/details/109228195
