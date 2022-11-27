怎么让电脑知道GDT在哪?

指令lgdt :加载GDT地址到GDTR

用法:lgdt(%reg) 寄存器%reg的值是GDTR的值的地址

GDTR的大小是48Bits寄存器里面，所以只能放在内存中，而后由CPU直接从内存读出 

需要处理的寄存器CS,ES,SS,DS,FS,GS

gdt结构:

arch/x86/gdt.c

gdt和平台紧密结合在一起所以放在arch下

