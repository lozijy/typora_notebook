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

### 数组

### Date



### dom操作

获取标签元素

获取属性元素

获取文本元素

获取

## bom操作

### window 

### screen

### Navigator

### location

### history

## js高级

### json

json形式

json转化为对象 parse

对象转化为json stringify

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

#### localstorage

#### sessionstorage 

### 闭包

#### 闭包的情形

#### 闭包的生命周期

#### 闭包的应用-模板

模板:私有化属性在函数内部，外部无法访问(对象的属性是公开的，函数的属性是私有的),对外暴露接口，可以用来操作属性

## ES6新特性

#### let

#### const

#### 解析构造

#### 箭头函数

#### rest参数

#### Symbol类型?

#### 迭代器