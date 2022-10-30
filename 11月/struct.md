### 结构体的声明

```c
struct book{
    char title[MAXWIGTH];
    char author[MAXWI];
    float value;
}
```



### 结构体创建对象

声明:

```c
struct book{
    char title[MAXWIGTH];
    char author[MAXWI];
    float value;
} library;
```

```c
struct book library
```

赋初值:

```c
struct book lonux={
    .title="Lonux",
    .author="Lozijy",
    999
};
```

```c
struct book library={
    "lonux",
    "lozijy",
    9999
};
```



### 嵌套结构体

### 结构体与数组

### 指向结构体的指针

c语言程序员一般喜欢把结构体的指针赋给函数，这样做往往更有效率.

### typedef

```c
typedef struct{
    char* name;
    char* ID;
}player_t;
```



```c
struct book{
    char title[MAXWIGTH];
    char author[MAXWI];
    float value;
} 
typedef struct book book;
```

