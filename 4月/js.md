# js详解



对象 bom dom js高级 es6新特性 

## 对象

```javascript
//创建对象方式1
var stu=new Object();
stu.name="lozijy";
stu.hobby="java";
stu.setname=function (name){
    this.name=name
}
console.log(stu)

//创建对象方式2
var stu2={
    name:"lozijy",
    hobby:"java",
    setname:function (name){
        this.name=name
    }
}
console.log(stu2)

//创建对象方式3，工厂函数
function setstu(name,hobby){
    let stu = new Object();
    stu.name=name;
    stu.hobby=hobby;
    stu.setname=function (name){
        this.name=name;
    }
    return stu;
}
let stu3 = setstu("lozijy","java");
console.log(stu3);

//创建方式4 直接一个类,这种显然最好，能区分出不同类的类型
function Student(name,hobby){
    this.name=name;
    this.hobby=hobby;
    this.setname=function (name){
        this.name=name
    }
}
let stu4 = new Student("lozijy","java");
console.log(stu4);
```

### 原型



##### 



### hasOwnProperty

### 继承

1.原型继承 有效继承父类方法

2.构造函数继承 有效继承父类属性

3.组合继承

```javascript
//继承方式1,原型链,可以有效获取父类的方法
//父类，子类，子类的原型为父类对象，子类原型的构造器为子类
function father(){
    this.fprop="fprop"
}
father.prototype.getFpro=function (){
    console.log(this.fprop)
}
function son(name){
    this.name=name;
}
son.prototype.getname=function (){
    console.log(this.name);
}
son.prototype=new father();
son.prototype.constructor=son();

let son1 = new son("lozijy");
son1.getFpro();

//方式2.构造器继承 可以有效获取父类的属性
function people(name,hobby){
    this.name=name;
    this.hobby=hobby;
    this.pprop="pprop";
}
people.prototype.showpprop=function (){
    console.log(this.pprop);
}
function stu(name,hobby,price){
    //用call函数调用people的构造函数,相当于this.people=new people(name,hobby)
    people.call(this,name,hobby);
    this.price=price
}
let stu1 = new stu("lozily","java","20k");
console.log(stu1.name)

//方式三 组合继承
function People(name){
    this.name=name;
}
People.prototype.run=function(){
    console.log("人正在跑")
}
function Student(name,price){
    People.call(this,name);
    this.price=price;
}
Student.prototype=new People();
Student.prototype.constructor=Student;

let a = new Student("lozijy","20k");
console.log(a.name);//父类属性
a.run();//父类方法
```

## 常用对象

普通对象

### 数组

#### 数组的定义

#### 数组的遍历

#### 数组的构造器

返回创建数组对象的原型函数

#### length

返回数组元素的个数

#### 数组方法

##### push

向数组末尾防止一个或多个元素，并返回新数组的长度

```javascript
let s=a.push("java");
```

##### pop

删除数组最后一个元素，并将被删除的元素返回

```javascript
let s=a.pop();
```

##### unshift

向数组开头添加一个或多个元素，并返回新数组的长度

```
let s=a.unshift();
```

##### shift

删除数组的第一个元素，并将被删的元素返回

```javascript
let s=a.shift("javascript");
```



##### foreach

这个方法的参数是一个函数

```javascript
console.log("================")
a.forEach(function (value, index, array){
    console.log("a["+index+"] = "+value);
    console.log(array);
})
```

### Date



### dom操作

获取标签元素

获取属性元素

获取文本元素



## bom操作

### window

###  

### screen



### Navigator



### location



### history



## js高级

### json

json形式

json转化为对象 parse

对象转化为json stringify

```javascript
let student={
    name:"lozijy",
    price:"20k"
}
let s = JSON.stringify(student);
let parse = JSON.parse(s);
console.log(s);
console.log(parse);
```

![image-20220425232608192](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220425232608192.png)

### ajax

XmlHttpRequest

open()

send()

readystate 0 1 2 3 4

status:200 404

请求整合

将ajax设置为一个对象，对外暴露接口

### cookie

### Webstorage

用来在本地储存数据，可通过F12查看

![image-20220425233208623](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220425233208623.png)

#### localstorage

API:

localstorage.setItem(key,value);

localstorage.getItem(key);

localstorage.removeItem(key);

localstorage.clear();

```javascript
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<input type="text"class="text">输入账号</input>
<button class="set" >设置账号</button>
<button class="get">查看账号</button>
<button class="delete">删除账号</button>
<button class="clear">清空储存</button>
<script>
    let text = document.querySelector("input");
    //设置储存
    let set = document.querySelector(".set")
    set.addEventListener("click",function (){
        localStorage.setItem("user",text.value);
    })

    //获取储存
    let set = document.querySelector(`.set`);
    set.addEventListener("click",function (){
        let user=localStorage.getItem("user");
        window.alert(user);
    })
    //删除储存
    let delet = document.querySelector(".delete");
    delet.addEventListener("click",function(){
        localStorage.removeItem("usr");
    })
    //清空储存
    let clear = document.querySelector(".clear");
    clear.addEventListener("click",function (){
        localStorage.clear();
    })



</script>
</body>
</html>
```

![image-20220425234410570](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220425234410570.png)

#### sessionstorage

生命周期为一次会话 ,网页关闭后储存消失

### 闭包

#### 闭包的情形

1.一个函数的返回值为另一个函数

```javascript
function fun1(){
    var a=1;
    function fun2(){
        console.log(a++)
    }
    return fun2;
}
let fun = fun1();
fun();
fun();
```

2.一个函数作为另一个函数的参数

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1 id="hello">Hello,world</h1>
<div style="background-color: red;align-items: center;align-self: center;">
    <form >
        <input type="submit" value="一个参数作为另一个函数的参数" class="text"/>
    </form>
</div>
<div align="center">
<table >
    <tr>
        <td>请输入你的账号</td>
        <td><input type="text" id="usr"></td>
    </tr>
    <tr>
        <td>请输入你的密码</td>
        <td><input type="password" id="pwd" ></td>
    </tr>

    <script>

    </script>

</table>
</div>
<script>
    let text = document.querySelector(".text")
    text.addEventListener("click",function (){
        window.alert("哈哈，一个函数作为另一个函数的参数");
    })


</script>
</body>
</html>
```

一个函数的return为另一个函数

#### 闭包的生命周期

闭包定义完成后开始，闭包对象变为垃圾结束

#### 闭包的应用-模板

模板:私有化属性在函数内部，外部无法访问(对象的属性是公开的，函数的属性是私有的),对外暴露接口，可以用来操作属性

## ES6新特性

#### let

作用域为块作用域,不可在未声明前使用变量，不可重复给变量赋值

#### const

声明的变量必须初始化，后面的代码不可修改变量的值

const世纪上保证的不是变量的值而是变量指向的那个内存地址不变

#### 解析构造

#### 箭头函数

#### rest参数

#### Symbol类型?

#### 迭代器