第三章

### 4

```c
#include<stdio.h>
int max(int a,int b,int c);
int main() {
	int a, b, c,ans;
	scanf_s("%d%d%d", &a, &b, &c);
	ans = max(a, b, c);
	printf("%d", ans);
	return 0;
}
int max(int a, int b, int c) {
	int d;
	if (a >= b && a >= c) {
		d = a;
	}
	else if (b>=a&& b>c) {
		d = b;
	}
	else {
		d = c;
	}
	return d;
}
```

遇到一个问题:'scanf': This function or variable may be unsafe.

通过stackoverflow解决: you can try replacing `scanf` with `scanf_s` or disable the compiler warning.

替换为scanf_s



### 5

```c
#include<stdio.h>
#include<math.h>
int main() {
	int a;
	int ans;
	printf("请输入一个1-1000的数");
	scanf_s("%d", &a);
	ans = sqrt(a);
	printf("%d", ans);
	return 0;
}
```



```c
#include<stdio.h>
#include<math.h>
int main() {
	int a;
	int ans;
	printf("请输入一个1-1000的数");
	scanf_s("%d", &a);
	while (a > 1000||a<0) {
		printf("请重新输入");
		scanf_s("%d", &a);
		ans = sqrt(a);
		printf("%d", ans);
	}
	return 0;
}

```



没有解决判断问题

```c
#include<stdio.h>
#include<math.h>
int main() {
	int a;
	int ans;
	printf("请输入一个1-1000的数");
	scanf_s("%d", &a);
	while (a > 1000||a<0) {
		printf("请重新输入");
		scanf_s("%d", &a);
	}
	ans = sqrt(a);
	printf("%d", ans);
	return 0;
}

```

解决



### 6.

又犯了点错误:1. 2*x不是2x  2.scanf里面是&x不是x

```c
#include<stdio.h>
int main() {
	int x, y;
	scanf_s("%d", &x);
	if (x < 1) {
		y = x;
	}
	else if (x >= 1 && x < 10) {
		y = 2 *x - 1;
	}
	else {
		y = 3* x - 11;
	}
	printf("%d", y);
	return 0;
}

```

### 7.好难，我2个都判断错了

### 8

```c
#include<stdio.h>
int main() {
	int x;
	scanf_s("%d", &x);
	if (x >= 90) {
		printf("A");
	}
	else if (x >= 80 && x < 90) {
		printf("B");
	}
	else if (x >= 70 && x < 80) {
		printf("C");
	}
	else if (x >= 60 && x < 70) {
		printf("D");
	}
	else if (x <60) {
		printf("E");
	}
	return 0;
}
```

### 9

做的有点慢哦

```c
#include<stdio.h>
int main() {
	int x;
	int ge, shi, bai, qian, wan;
	scanf_s("%d", &x);
	ge = x % 10;
	shi = x / 10 % 10;
	bai = x / 100 % 10;
	qian = x / 1000 % 10;
	wan = x / 10000 % 10;
	int nums[5] = { wan,qian,bai,shi,ge };
	//要求1
	int wei = 4;
	int maxwei = 0;
	while (wei>=0) {
		if (nums[wei] != 0) {
			maxwei = 5-wei;
		}
		wei--;
	}
	printf("%d 位数\n", maxwei);
	//要求2
	for (int i = 0; i < 5; i++) {
		printf("%d \n", nums[i]);
	}
	//要求3
	
}
```



### 斐波那契

```c
#include<stdio.h>
int fibonachi(int n) {
	if (n == 1 || n == 2) {
		return 1;
	}
	else {
		return fibonachi(n - 1) + fibonachi(n - 2);
	}
}
int main() {
	int num;
	int ans = 0;
	scanf_s("%d", &num);
	for (int i = 1; i < num + 1; i++) {
		ans += fibonachi(i);
	}
	printf("%d", ans);
}

```

### 判断一个大于3的数是否是素数

```c
#include<stdio.h>

int main() {
	int num;
	int num2=0;
	scanf_s("%d", &num);
	for (int i = 2; i < num; i++) {
		if (num % i == 0) {
			num2 += 1;
		}
	}
	if (num2 == 0) {
		printf("是素数");
	}
	else {
		printf("是合数");
	}
}

```

### 求100-200的全部素数

```c
#include<stdio.h>
bool isnum(int num) {
	int num2 = 0;
	for (int i = 2; i < num; i++) {
		if (num % i == 0) {
			num2 += 1;
		}
	}
	if (num2 == 0) {
		return true;
	}
	else {
		return false;
	}
}

int main() {
	for (int i = 100; i < 201; i++) {
		if (isnum(i)) {
			printf("%d\n",i);
		}
	}
}
```

### 破译密码

```c
#include<stdio.h>
int main() {
	char c;
	char chars[] = "";
	char* p = chars;
	int len;
	while (c != '/n') {
		scanf("%c", c);
		*p++ = c;
		len++;
	}
	for (int i = 0; i < len; i++) {
		chars[i] + =4;
	}

}
```

报错

```c
	char c;
	char chars[]="";
	char* p = chars;
	char* p2 = chars;
	for (int i = 0; i < 10; i++) {
		scanf_s("%c", &c);
		printf("%c", c);
		*p++ = c;
	}
	printf("%s",*p2 );
```

报错

### 删除字符串中指定的字母

```c
#include<stdio.h>
#include<string.h>
char* deletestr(char* str, char* charset) {
	if (charset == NULL) {
		return str;
	}
	int hash[256];
	for (int i = 0; i < 256; i++) {
		hash[i] = 0;
	}
	for (int i = 0; i < strlen(charset); i++) {
		hash[charset[i]] = 1;
	}
	int currenIndex = 0;
	for (int i = 0; i < strlen(str); i++) {
		if (!hash[str[i]]) {
			str[currenIndex++] = str[i];
		}
	}
	str[currenIndex] = '\0';
	return str;
}

int main() {
	char str[4] = "aba";
	char charset[2] = "a";
	printf("%s", deletestr(str, charset));
}

```

1.字符数组大小自动+1.原因是里面有一个'\0'.

'\0' 是字符串的结束符，任何字符串之后都会自动加上'\0'。如果字符串末尾少了'\0'转义字符，则其在输出时可能会出现乱码问题。

'\0'转义字符在ASCII表中并不表示阿拉伯数字0，阿拉伯数字0的ASCII码为48，'\0'转义字符的ASCII码值为0，它表示的是ASCII控制字符中空字符的含义。

'\0'是C++中字符串的结尾标志，存储在字符串的结尾。比如char cha[5]表示可以放4个字符的数组，由于c/c++中规定字符串的结尾标志为'\0'，它虽然不计入串长，但要占内存空间，而一个汉字一般用两个字节表示，且c/c++中如一个数组cha[5]，有5个变量，分别是 cha[0] , cha[1] , cha[2] , cha[3] , cha[4]。

所以**cha[5]可以放4个字母（数组的长度必须比字符串的元素个数多1，用以存放字符串结束标志'\0'）或者放2个汉字（1个汉字占2个字节，1个字母占一个字节）**，cha[5]占5个字节内存空间。如果字符串末尾少了'\0'转义字符，则其在输出时可能会出现乱码问题。

2.strlen方法是头文件string.h里面的方法.

### 



### 冒泡排序

```c
#include <stdio.h>

//冒泡排序
void BubbleSort(int arry[],int len)
{
        int i;
        int j;
        int temp;
        for(i=0;i<len-1;i++)//比较次数
        {
                for(j=0;j<len-1-i;j++)//比较过程
                {
                        if(arry[j]>arry[j+1]) //比较大小
                        {
                                temp=arry[j];
                                arry[j]=arry[j+1];
                                arry[j+1]=temp;

                        }
                }

        }

}
//输出
void print(int arry[],int len)
{
        int i;
        for(i=0;i<len;i++)
        {
                printf("%d ",arry[i]);
        }
}
int main()
{

        int arry[10]={9,3,56,44,77,88,54,79,52,111};

        BubbleSort(arry,10);
        print(arry,10);
        printf("\n");

        return 0;
}

```



### 选择排序

```c
//选择排序
void selectSort(int arry[], int len)
{
    int i;
    int j;
    int minnum;
    int temp;
    int min;
    for (i = 0; i < len; i++)
    {
        minnum = arry[i];
        min = i;
        for(j=i;j<len;j++){
            if (arry[j] < minnum) {
                minnum = arry[j];
                min = j;
            }
        }
        temp = arry[i];
        arry[i] = arry[min];
        arry[min] = temp;
    }
}
//输出
void print(int arry[], int len)
{
    int i;
    for (i = 0; i < len; i++)
    {
        printf("%d ", arry[i]);
    }
}
int main()
{

    int arry[10] = { 3,4,6,2,4,6,7,2,3,4 };

    selectSort(arry, 10);
    print(arry, 10);
    printf("\n");

    return 0;
}

```

### 插入排序

```c
#include <stdio.h>

//插入排序
void selectSort(int arry[], int len)
{
    int i;
    int j;
    for (i = 1; i < len; i++) {
        int temp = arry[i];
        j = i - 1;
        while (temp<arry[j]&&j>=1) {
            arry[j + 1] = arry[j];
            j--;
        }
        arry[j] = temp;
    }
}
//输出
void print(int arry[], int len)
{
    int i;
    for (i = 0; i < len; i++)
    {
        printf("%d ", arry[i]);
    }
}
int main()
{

    int arry[10] = { 3,4,6,2,4,6,7,2,3,4 };

    selectSort(arry, 10);
    print(arry, 10);
    printf("\n");

    return 0;
}

```

