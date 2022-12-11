![image-20221211122737732](https://raw.githubusercontent.com/lozijy/image/main/image-20221211122737732.png)

![image-20221211122805931](https://raw.githubusercontent.com/lozijy/image/main/image-20221211122805931.png)

![image-20221211125922066](https://raw.githubusercontent.com/lozijy/image/main/image-20221211125922066.png)

I/O

第三章文件IO



stdio标准io :FILE类型贯穿始终

sysio系统调用io 系统调用io直接在kernel下执行，不同操作系统的系统调用io不同，为了解决这个问题，引入stdio标准io进行抽象，在不同操作系统下都能实现io而不管底层实现

![image-20221211130944422](https://raw.githubusercontent.com/lozijy/image/main/image-20221211130944422.png)

![image-20221211131244910](https://raw.githubusercontent.com/lozijy/image/main/image-20221211131244910.png)

![image-20221211135244790](https://raw.githubusercontent.com/lozijy/image/main/image-20221211135244790.png)

![image-20221211135308351](https://raw.githubusercontent.com/lozijy/image/main/image-20221211135308351.png)

fflush();

结构体在哪?栈?静态区?堆?

栈上的情况?不对，保留不到程序结束

![image-20221211135946441](https://raw.githubusercontent.com/lozijy/image/main/image-20221211135946441.png)

 静态区的情况?不对，这样所有的都只会声明一次

![image-20221211140143774](https://raw.githubusercontent.com/lozijy/image/main/image-20221211140143774.png)

堆的情况（对）

![image-20221211140301241](https://raw.githubusercontent.com/lozijy/image/main/image-20221211140301241.png)

fclose关闭一个文件描述符

![image-20221211141850828](https://raw.githubusercontent.com/lozijy/image/main/image-20221211141850828.png)



unix/linux环境下的IO系统调用

第五章标准IO库

文件系统

并发

多进程并发

多线程并发

IPC:进程间通信