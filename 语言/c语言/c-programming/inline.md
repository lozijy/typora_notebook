只能用于小函数，防止反复调用小函数浪费大量栈空间

```c
#include<stdio.h>
inline const char *check(int c){
    return c%2==0?"奇":"偶";
}
int main(){
    for(int i=0;i<5;i++){
        printf("%d :  %s",i,check(i));
    }
    return 0;
}
```

