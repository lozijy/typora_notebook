### 室友建议：重修javascript，于是我超级细节的总结js。

1.js语法有点怪:

函数的参数可以是函数，如

```javascript
a.forEach(function (value, index, array){
    console.log("a["+index+"] = "+value);
    console.log(array);
})
```

对象的属性可以是一个对象

对象的属性可以是函数，以vue举例子

```javascript
let vue=new Vue({
    el:"#root",
    data:{
        username:"lozijy",
        password:"123456"
    },
    methods:{
        showfunction1:function (){
            window.alert("function1");
        },
        showfunction2:function (){
            console.log("showfunction2");
        }
    }
});
```





函数的return可以是一个对象，而这个对象的属性也可以是函数，以模块举例子中

```javascript
(function Mymodule2(){
    var msg="module2";
    function dosomething(){
        console.log("some : "+msg);
    }
    function  dootherThing(){
        console.log("other : "+msg);
    }
    //window是一个对象，我们给他的module赋值
    Window.module=function(){
        return {
            dosomething:dosomething(),
            dootherThing:dootherThing()
        }
    }
})()
module().doSomething()
```

在函数之中给window的属性赋值，赋的是一个有return的函数，而return的内容是一个对象，对象的属性是函数

再以object.defineProperties举例子

```javascript
let obj1={
    x:function (){
        console.log("属性是一个函数")
    }
}
let obj2={
    y:2
}
Object.defineProperty(obj2,"x",{
    get:function (){
        console.log("get的调用")
        return obj1.x;

    },
    set:function (value){
        console.log("set的调用")
        obj1.x=value;
    }
})
//get
obj2.x();
//set
obj2.x=1;
```



这里第三个参数是一个对象，对象的属性是一个有return的函数

