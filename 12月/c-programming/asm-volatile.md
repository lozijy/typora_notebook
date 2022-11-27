什么是内联汇编？
GCC 支持在C/C++代码中嵌入汇编代码，这些汇编代码被称作GCC Inline ASM——GCC内联汇编。这是一个非常有用的功能，有利于我们将一些C/C++语法无法表达的指令直接潜入C/C++代码中，另外也允许我们直接写 C/C++代码中使用汇编编写简洁高效的代码。

其实就是在C/C++中加入汇编语句，一个是有一些操作无法使用高级语言，只能用汇编；另一个是高级语言虽然易读，但是执行效率肯定没有汇编高。
基本内联汇编
__asm__("movl %esp,%eax"); // 括号里一定要加引号，引号内是汇编语句
__asm__是GCC关键字asm的宏定义：

#define __asm__ asm
__asm__或asm用来声明一个内联汇编表达式，所以任何一个内联汇编表达式都是以它开头的，是必不可少的。

选项-O表示优化编译，我们还可以指定优化等级，比如-O2表示优化等级为2；选项-S表示将C/C++源文件编译为汇编文件，文件名和C/C++文件一样，只不过扩展名由.c变为.s。
内联汇编的意义
Instruction List是汇编指令序列（实际就是括号里的东西）。它可以是空的，比如：__asm__ __volatile__(""); 或__asm__ ("");都是完全合法的内联汇编表达式，只不过这两条语句没有什么意义。但并非所有Instruction List为空的内联汇编表达式都是没有意义的，

__asm__ ("":::"memory");
就非常有意义，它向GCC声明：“我对内存作了改动”，GCC在编译的时候，会将此因素考虑进去，则不会对内存部分做出优化编译

内联汇编的格式
当在"Instruction List"中有多条指令的时候，你可以在一对引号中列出全部指令，也可以将一条或几条指令放在一对引号中，所有指令放在多对引号中。如果是前者，你可以将每一条指令放在一行，如果要将多条指令放在一行，则必须用分号（；）或换行符（/n，大多数情况下/n后还要跟一个/t，其中/n是为了换行，/t是为了空出一个tab宽度的空格）将它们分开。比如：

__asm__("movl %eax, %ebx sti popl %edi subl %ecx, %ebx");
__asm__("movl %eax, %ebx; sti popl %edi; subl %ecx, %ebx");
__asm__("movl %eax, %ebx; sti/n/t popl %edisubl %ecx, %ebx");
都是合法的。

如果你将指令放在多对引号中，则除了最后一对引号之外，前面的所有引号里的最后一条指令之后都要有一个分号(；)或(/n)或(/n/t)。比如：

__asm__("movl %eax, %ebx sti/n" "popl %edi;" "subl %ecx, %ebx");
__asm__("movl %eax, %ebx; sti/n/t" "popl %edi; subl %ecx, %ebx");
__asm__("movl %eax, %ebx; sti/n/t popl %edi/n""subl %ecx, %ebx");
__asm__("movl %eax, %ebx; sti/n/t popl %edi;" "subl %ecx, %ebx");
都是合法的。

上述原则可以归结为：

任意两个指令间要么被分号(；)分开，要么被放在两行；
放在两行的方法既可以从通过/n的方法来实现，也可以真正的放在两行；
可以使用1对或多对引号，每1对引号里可以放任一多条指令，所有的指令都要被放到引号中。



__volatile__ 或volatile是可选的，你可以用它也可以不用它。如果你用了它，则是向GCC声明“不要动我所写的Instruction List，我需要原封不动的保留每一条指令”，否则当你使用了优化选项(-O)进行编译时，GCC将会根据自己的判断决定是否将这个内联汇编表达式中的指令优化掉。



带有C/C++[表达式](https://so.csdn.net/so/search?q=表达式&spm=1001.2101.3001.7020)的内联汇编格式为：
　　__ asm__　 __ volatile__(“InSTructiON List” : Output : Input : Clobber/Modify);

1._ asm _ 是[GCC](https://so.csdn.net/so/search?q=GCC&spm=1001.2101.3001.7020)关键字asm的宏定义：#define __ asm__ asm

__ asm__ 或asm用来声明一个内联汇编表达式，任何内联汇编表达式都是以它开头，必不可少。

2.Instruction list是汇编指令序列，可以为空比如：__ asm__ __ volatile__(""); 或 __ asm__ ("")，都是完全正当的内联汇编表达式，只不过这两条语句没有什么意义。但是如：__ asm__ ("":::“memory”)，就有意义，它向GCC 声明：“内存作了改动”，GCC 在编译的时候，会将此因素考虑进去。



当Instruction list中有多条指令时，可以将多条指令放在一对引号中，用;或\n将它们分开，如过一条指令放一对引号中，可以每条指令一行。即：（1）每条指令都必须被双引号括起来 (2)两条指令必须用换行或分号分开。如：







例如6.s081的

riscv.h中

在mstatus中将运行模式改成管理模式,

```c
static inline void 
w_mstatus(uint64 x)
{
  asm volatile("csrw mstatus, %0" : : "r" (x));
}
```

通过将main函数的地址写进寄存器mepc，将返回地址设为main

```c
static inline void 
w_mepc(uint64 x)
{
  asm volatile("csrw mepc, %0" : : "r" (x));
}
```

通过向页表寄存器satp写入0在管理模式下禁用虚拟地址转换

```c
static inline void 
w_satp(uint64 x)
{
  asm volatile("csrw satp, %0" : : "r" (x));
}
```

start.c中的前几行对寄存器进行操作:

```c
void
start()
{
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();//start函数在寄存器mstatus中将先前的运行模式改成管理模式，
  x &= ~MSTATUS_MPP_MASK;
  x |= MSTATUS_MPP_S;
  w_mstatus(x);

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);//通过将main函数的地址写进寄存器mepc,将返回地址设为main

  // disable paging for now.
  w_satp(0);//通过向页表寄存器satp写入0在管理模式下禁用虚拟地址转换
    
  ...
  ...
  asm volatile("mret");//调用mret这个riscv指令返回到管理模式,使pc的值更改为main函数地址
```



寄存器 在mstatus中将运行模式改成管理模式,将main地址写进mepc,页表寄存器satp写入0禁用虚拟内存转换