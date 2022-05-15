# 	Vue学习

### 大纲

**vue核心**

**vue组件化编程**

**使用vue脚手架**

**vue中的ajax**

**vuex**

**vue-router**

**vue ui组件库**

### 文档

官方文档:[https://cn.vuejs.org/index.html](官方文档)

主题:https://cn.vuejs.org/resources/themes.html

vue第三方库:https://cn.vuejs.org/resources/themes.html或者https://awesomejs.dev/for/vue/

下载开发版本的vue.js

下载开发者工具(firefox)

我们可以直接有了vue的构造器

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>
    <script>
        new Vue();
    </script>
</head>
<body>

</body>
</html>
```

![image-20220425175544980](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220425175544980.png)



vue.config

`Vue.config` 是一个对象，包含 Vue 的全局配置。可以在启动应用之前修改下列 property：

silent

optionMergeStrategies

producttip:设置false阻止vue在生成时生成生产提示

![image-20220425180121400](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220425180121400.png)

# Vue 核心

### hello,world

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>

</head>
<body>
<!--准备一个容器-->
<div id="root">
    <h1>hello,{{name}}</h1>
</div>
</body>
<script>
    Vue.config.productionTip=false//阻止vue在启动时生成生产提示
    //创建Vue实例
    const x =new Vue({
        el:"#root",//el指定当前vue实例用于给哪个容器服务，值通常为css选择器字符串,也可以用js的dom操作
        data:{
            name:"world!"
        }
    });

</script>
</html>
```

想让vue工作，必须new一个vue的对象,其中设置的el用来选中要操作的容器

容器中的代码依然符合html规范，只不过加入了vue自己的语法。

data放置相应的动态数据。

不能实现一对多和多对一，若出现这种情况，会按从上到下的顺序一一对应。

真实开发中只会有一个vue实例，并且会配合组件一起使用

在{{xxx}}中要写js表达式，如:a,a+b,demo(1),x===y?"a":"b"不能写js语句



问题:

1.网页没有icon?

vue开发者工具无法打开

在F12中看，不是在右上角



### 模板语句

不加这些不会当成vue语句，而是普通的html+css+js

- 插值语法{{}}      用于解析标签体内容

- 指令语法:用于解析标签(标签属性，标签体内容，绑定事件)

  Vue有很多指令都是v-xxx的形式，这里只是拿v-bind举个例子

  v-bind能给标签中任何属性赋予动态的值，也可以简写为:

```html
    <a v-bind:href="url" >点我去百度哦</a>
```

用于解析标签



### 层级属性

```html
    <h1>hello,{{name.toUpperCase()}}</h1>
    <h1>hello,{{school.name.toUpperCase()}}</h1>
<script>
    Vue.config.productionTip=false//阻止vue在启动时生成生产提示
    //创建Vue实例
    const x =new Vue({
        el:"#root",//el指定当前vue实例用于给哪个容器服务，值通常为css选择器字符串,也可以用js的dom操作
        data:{
            name:"world!",
            url:"http://www.baidu.com",
            school:{
                name:"lozijy"
            }
        }
    });

</script>


```

![image-20220425202111353](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220425202111353.png)

数据绑定

```html
<form>
    <input type="text" v-bind:value="username"/>
    <input type="text" v-model:value="username"/>
</form>
```

数据绑定有两种绑定方式:

- 单向绑定(v-bind):只能从data流向界面

- 双向绑定(v-module):既可以从data流向界面，也可以从界面流向data。只能用于表单类元素上(input select radio  textarea)

  ![image-20220425203308263](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220425203308263.png)

![image-20220425203427233](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220425203427233.png)

双向绑定不能修饰h1等不可从页面上改变内容的的标签



简写:单向绑定中的v-bind可以用: 代替,双向绑定由于只针对value所以可以把v-model:value简写为v-value

### el和data的两种写法

el:1.在vue的对象属性中写 2.直接使用 vue.$mount

data:1.以对象的形式2.以return函数的形式

```javascript
Vue.config.productionTip=false//阻止vue在启动时生成生产提示
//创建Vue实例方式一
new Vue({
    el:"#root",//el指定当前vue实例用于给哪个容器服务，值通常为css选择器字符串,也可以用js的dom操作
    data:{
        username:"lozijy",
        password:"123456"
    }
});
//el方式2
let vue = new Vue();
vue.$mount("#root");
//data方式2
new Vue({
    el:"#root",
    data:function(){
        return {
            username: "lozijy",
            password:"123456"
        }
    }
})
```

### MVVM模型



### defineProperty回顾

一个函数,参数也是一个对象，对象的2个属性是2个函数，一个有return，一个没有return。

代理的是一个具体的值

```javascript
let obj2={
    y:2
}
Object.defineProperty(obj2,"x",{
    value:100
})
console.log(obj2.x)
```

代理的是另一个对象的属性，而属性是一个函数

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

代理的是另一个对象的属性,而属性是数字

```javascript
let obj1={
    x:1
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
console.log(obj2.x);
//set
obj2.x=1;
```

![image-20220426173323390](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220426173323390.png)



### vue的代理

#### 明白vue._data.name和vue.name的区别:

vue._data里面保存的是我们创建vue对象时data里面的数据，vue.name是我们使用{{}}插值语句和v-bind:和v-module:时调用的东西({{}}里面的东西省略掉vue.，所以直接输入name即可)

#### 试验一下

```javascript
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>

</head>
<body>
<!--准备一个容器-->
<div id="root">
    <form>
        <input type="text" v-bind:value="username"/>
        <input type="text" v-model:value="username"/>
    </form>
</div>
</body>
<script>
    Vue.config.productionTip=false//阻止vue在启动时生成生产提示
    //创建Vue实例方式一
    let vue=new Vue({
        el:"#root",//el指定当前vue实例用于给哪个容器服务，值通常为css选择器字符串,也可以用js的dom操作
        data:{
            username:"lozijy",
            password:"123456"
        }
    });
    console.log(vue);
    console.log(vue.username);
    console.log(vue._data.username);
</script>
</html>
```

![image-20220426174938038](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220426174938038.png)

![image-20220426175036323](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220426175036323.png)



### 事件处理

vue._methods:里放进去的是一个一个的方法

属性的methods不要写成method哦

事件绑定:1.@xxx(click)="function"2.v-con:xxx(click)="function"

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>

</head>
<body>
<!--准备一个容器-->
<div id="root">
    <form>
        <input type="text" v-bind:value="username"/>
        <input type="text" v-model:value="username"/>
        <button @click="showfunction1">点我在控制台打印信息</button>
    </form>
</div>
</body>
<script>
    Vue.config.productionTip=false//阻止vue在启动时生成生产提示
    //创建Vue实例方式一
    let vue=new Vue({
        el:"#root",//el指定当前vue实例用于给哪个容器服务，值通常为css选择器字符串,也可以用js的dom操作
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

</script>
</html>
```

#### 事件修饰符

#### 键盘事件

### 计算属性

get函数中要用this.firstname而不是firstname或者vue.firstname.

这里的get()相当于get:function()

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>

</head>
<body>
<!--准备一个容器-->
<div id="root">
    <h1>{{firstname}}</h1>
    <h1>{{lastname}}</h1>
    <h1>{{fullname}}</h1>
</div>
</body>
<script>
    Vue.config.productionTip=false//阻止vue在启动时生成生产提示
    //创建Vue实例方式一
    let vue=new Vue({
        el:"#root",//el指定当前vue实例用于给哪个容器服务，值通常为css选择器字符串,也可以用js的dom操作
        data:{
            firstname:"lo",
            lastname:"zijy"

        },
        computed:{
            fullname:{
                get() {
                    return this.firstname + this.lastname;
                }
            }
        },
        watch:{
            firstname: {

            }
        }
    });

</script>
</html>
```

### 事件监听

handler:function()  参数可以省略，若有参数则第一个为oldvalue,第二个为newvalue

vue的属性中methods不小心写成method了，卡了好久

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>

</head>
<body>
<!--准备一个容器-->
<div id="root">
    <h1>{{firstname}}</h1>
    <button @click="changevalue">点我修改值</button>
    <h1>{{lastname}}</h1>
    <h1>{{fullname}}</h1>
</div>
</body>
<script>
    Vue.config.productionTip=false//阻止vue在启动时生成生产提示
    //创建Vue实例方式一
    let vue=new Vue({
        el:"#root",//el指定当前vue实例用于给哪个容器服务，值通常为css选择器字符串,也可以用js的dom操作
        data:{
            firstname:"lo",
            lastname:"zijy"

        },
        computed:{
            fullname:{
                get() {
                    return this.firstname + this.lastname;
                }
            }
        },
        methods:{
            changevalue:function (){
                this.firstname="li";
            }
        },
        watch:{
            firstname: {
                handler(oldvalue,newvalue){
                    console.log(oldvalue,newvalue);
                }
            }
        }
    });

</script>
</html>
```

点击按钮后，"lo"变成了"li"，控制台输出打印了"lo  li"

练习:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>

</head>
<body>
<!--准备一个容器-->
<div id="root">
    <table>
        <tr><td>今天的天气是{{dom}}</td>
            <td><input type="button" @click="change">点我修改天气</td>
        </tr>
        <tr><td>{{sentens}}</td></tr>
        <tr>
    </table>
</div>
</body>
<script>
    Vue.config.productionTip=false//阻止vue在启动时生成生产提示
    //创建Vue实例方式一
    new Vue({
    el:"#root",
    data:{
        dom:"晴天",
        sentens:"你看那春日的蝴蝶"
    },
    methods:{
      change:function (){
          this.dom="阴天";
      },

    },
    watch:{
        dom:{
            handler(oldvalue,newvalue){
                this.sentens="你听那秋末的落叶"
            },
        },
    },
    });

</script>
</html>
```

点击前:![image-20220427194340925](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220427194340925.png)

点击后

![image-20220427194355436](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220427194355436.png)



#### 深度监视：

设置为true后，能够监视数组类对象的所有元素的变化.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>

</head>
<body>
<!--准备一个容器-->
<div id="root">
    <h1>{{i1}}</h1>
    <h1>{{i2}}</h1>
    <button @click="change"value="点我让2个数字加一"></button>
</div>
</body>
<script>
    Vue.config.productionTip=false//阻止vue在启动时生成生产提示
    //创建Vue实例方式一
    new Vue({
    el:"#root",
    data:{
        nums:[this.i1,this.i2],
        i1:1,
        i2:2,
    },
    methods:{
      change:function (){
          this.i1+=1;
          this.i2+=2;
      },

    },
    watch:{
        nums:{
            deep:true,
            handler:function (){
                this.i1+=1;
                this.i2+=2;
            }
        }
    },
    });

</script>
</html>
```

#### 简写:

#### 监听属性vs计算属性:

计算属性能完成的监听属性一定能完成



### 绑定样式

需求:

1.设计按钮，点击后能改变样式

2.设计按钮，点击后能添加样式

```javascript
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>
    <style>
    .basic{
        width: 400px;
        height: 100px;
        border: 1px #0C0C0C;
    }
    .happy{
        border: 4px solid red;
        background-color: rgba(255,255,0,0.644);
        background: linear-gradient(30deg,yellow,pink,orange,yellow);
    }
    .sad{
        border:4px solid black;
        background-color: gray;
    }
    .normal{
        background-color: skyblue;
    }
    .atguigu1{
        background-color: skyblue;
    }
    .atguigu2{
        font-size: 30px;
        text-shadow:2px 2px 10px red;
    }
    .atguigu3{
        border-radius: 20px;
    }
    </style>
</head>
<body>
<!--准备一个容器-->
<div id="root">
    <div class="basic":class="mood" >{{name}}</div>
    <button @click="changemood">点我换心情哦</button>
    <button @click="randommood">点我随机一个心情哦</button>
    <div class="basic":class="moodarr">{{name}}</div>
    <button @click="add1">添加1</button>
    <button @click="add2">添加2</button>
    <button @click="add3">添加3</button>
</div>
</body>
<script>
    Vue.config.productionTip = false//阻止vue在启动时生成生产提示
    //创建Vue实例方式一
 let vue=   new Vue({
        el: "#root",
        data: {
            name:"lozijy",
            mood:"happy",
            moodarr:"",
        },
        methods:{
            changemood:function (){
                this.mood="sad";
            },
            randommood:function(){
                let array = ["sad","happy","normal"];
                let number = Math.floor(Math.random()*3);
                this.mood=array[number];
            },
            add1:function (){
                this.moodarr+=(" atguigu1");
                console.log(this.moodarr)
            },
            add2:function (){
                this.moodarr+=("atguigu2");
            },
            add3:function (){
                this.moodarr+=("atguigu3");
            },
        },

    })
</script>
</html>
```

![image-20220428000127767](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220428000127767.png)

### 条件渲染

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>
    <style>
    </style>
</head>
<body>
<!--准备一个容器-->
<div id="root">
    <h1>{{n}}</h1>
    <button @click="add">点我让n+1</button>
    <h1 v-if="n==1">n==1了哦</h1>
    <h1 v-else-if="n==2">n==2了哦</h1>
    <h1 v-else>n不是1或2了</h1>
</div>
</body>
<script>
    Vue.config.productionTip = false//阻止vue在启动时生成生产提示
    //创建Vue实例方式一
    let vue=   new Vue({
        el:"#root",
        data:{
            n:0,
        },
        methods:{
            add:function (){
                this.n+=1;
            },
        }


    })
</script>
</html>
```

![image-20220428125403450](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220428125403450.png)

![image-20220428125410597](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220428125410597.png)

### 列表渲染

注意:key和value是反着来的

```javascript
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>
    <style>
    </style>
</head>
<body>
<!--准备一个容器-->
<div id="root">
    <ul>
        <li v-for="(value,key) in peoples" :key="key">
        {{value.name}}-{{value.age}}
        </li>
        <li v-for="(value,key) in lozijy" :key="key">
            {{key}}-{{value}}
        </li>
    </ul>
</div>
</body>
<script>
    Vue.config.productionTip = false//阻止vue在启动时生成生产提示
    //创建Vue实例方式一
    let vue=   new Vue({
        el:"#root",
        data:{
            peoples:[
                {name:"lozijy" ,age:"19"},
                {name:"yougi",age:"19"},
                {name:"lizetc",age:"19"}
            ],
            lozijy:{
                hobby:"java",
                age:"19",
            }
        },
        methods:{
            add:function (){
                this.n+=1;
            },
        }
    })
</script>
</html>
```

![image-20220428131334643](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220428131334643.png)



#### 列表过滤



## 收集表单元素

##  过滤器

## 内置指令

### v-text

```
我们学过的指令:v-model v-bind v-for v-on v-if v-else v-show
```

插值:原因

更习惯于使用插值语法:更加灵活

```html
<h1 v-text="hello"></h1>
```

### v-html p41

v-html有安全性问题，容易引起xss攻击，一定要在可信的网站上使用v-html,永远不要用在用户提交的内容上(盗走cookie)

支持结构解析

有安全性问题

cookie的工作原理

不能跨浏览器

拿到cookie相当于拿到了身份

httponly

```html
<h1 v-html="hello"></h1>
```

```javascript
data: {
    hello:"<h3>hello</h3>"
},
```

### v-cloak p42

js阻塞,访问外部vue

作用是防止网速过慢时将未经解析的模板显示在页面上{{xxx}}等

没有值，只有名

配合css实现

```css
[v-cloak]{

	display:none;

}
```





### v-once

只有名，没有值

v-once在初次动态渲染后就视为静态内容了

以后数据的更新不会引起v-once所在结构的更新

### v-pre

使vue跳过对应结点的编译过程，加快编译

## 自定义指令

这些元素的dom都需要自己操作

### hello

需求:定义一个v-big指令，与v-text类似，但会将字体放大十倍

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/vue.js"></script>
    <style>

    </style>
</head>
<body>
<!--准备一个容器-->
<div id="root">
    <h1 v-html="hello"></h1>
    <h1><span v-text="n"></span></h1>
    <h1><span v-big="n"></span></h1>
    <button @click="add">点我让n+1</button>
</div>
</body>
<script>
    Vue.config.productionTip = false//阻止vue在启动时生成生产提示
    //创建Vue实例方式一
    //我们学过的指令:v-model v-bind v-for v-on v-if v-else v-show
    new Vue({
        el: "#root",
        data: {
            n:0,
            hello:"<h3>hello</h3>"
        },
        methods: {
            add:function (){
                this.n+=1;
            }
        },
        directives:{
            big(element,bingding){
            element.innerText=bingding.value*10;
            }
        }

    })

</script>
</html>
```

big函数什么时候会被调用:1.指令和元素成功绑定。2.指令所在模板被重新解析时



#### 实现v-fbind



### vue生命周期

# Vue组件化编程

#### 对组件的理解

#### 非单文件组件

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="vue.js"></script>
    <style>

    </style>
</head>
<body>
<!--准备一个容器-->
<div id="root">
    <school></school>
    <student></student>
</div>
</body>
<script>
    //创建学校组件
    const school =Vue.extend({
        template:`
          <div>
          <h1>学校名:{{name}}</h1>
          <h1>地址:{{address}}</h1>
          </div>
        `,
        data(){
            return{
                name:"lovs",
                address:"lojl",
            }
        }
    })
    //创建学生组件
    const student =Vue.extend({
        template:`
        <div>
        <h1>age:{{age}}</h1>
        <h1>name:{{name}}</h1>
        </div>

        `,
        data(){
            return{
                name:"lozijy",
                age:"18",
            }
        }
    })
    Vue.config.productionTip = false//阻止vue在启动时生成生产提示
    //创建Vue实例方式一
    new Vue({
        el: "#root",
        data: {},
        methods: {},
        components:{
            school,
            student:student,
        }
    })

</script>

```

开发者工具:

![image-20220503175746193](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220503175746193.png)

#### 组件的几个注意点

Vue.extend()创建组件,V大写

vm中的components绑定组件

组件中没有el配置项,因为所有的组件都会直接交给Vue去管理,由vm决定服务

在组件中写入template编写模板，要用es6新特性的``模板字符串以支持回车.

命名问题:一个单词:要么全部小写，要么首字母大写

多个单词要么用连接多个单词(components绑定时要用双引号包裹起来)

要么用驼峰命名法(只有在Vue脚手架中才支持驼峰命名,非单文件组件中不支持)

#### 组件的嵌套

组件中可以嵌套组件

在标准开发中vue只管理一个组件application，再由application去管理其他的组件

用的是components不是component，开始写错了

子组件要比母组件先创建，否则不知道子组件是什么东西

```javascript
const student =Vue.extend({
    template:`
    <div>
    <h1>age:{{age}}</h1>
    <h1>name:{{name}}</h1>
    </div>

    `,
    data(){
        return{
            name:"lozijy",
            age:"18",
        }
    }
})
//创建学校组件,嵌套student组件
const school =Vue.extend({
    template:`
      <div>
      <h1>学校名:{{name}}</h1>
      <h1>地址:{{address}}</h1>
      <student></student>
      </div>
    `,
    data(){
        return{
            name:"lovs",
            address:"lojl",
        }
    },
    components:{
        student:student
    }
})
```

开发者工具:![image-20220503181146353](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220503181146353.png)

#### _VueComponent构造函数

#### _Vue实例与组件实例

#### 一个重要的内置关系

#### 单文件组件

# Vue脚手架

切换至淘宝镜像

```c
npm config set registry https://registry.npm.taobao.org
```

下载脚手架

```
npm install -g @vue/cli
```

创建项目

```cmake
vue create hello-world
```

运行项目

![image-20220504204540601](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220504204540601.png)

## hello,world

目录结构

![image-20220504213123714](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220504213123714.png)

teacher.vue

```vue
<template>
<h1>{{name}}</h1>
  <h1>{{student}}</h1>
</template>

<script>
export default {
  name: "Teacher",
  date(){
    return{
    name:"uihc",
    student:"lozijy",
    }
}
}
</script>

<style scoped>

</style>
```

app.vue   引入组件,只有一个根标签,暴露接口

```vue
<template>
  <div>
    <school/>
    <hr/>
    <student like="js"></student>
  </div>

</template>

<script>
import school from "./components/School";
import student from "./components/Student";
export default {
  name: "App",
  components:{
    school,student
  }
}
</script>

<style scoped>

</style>
```

main.js 只有一个根标签,暴露接口

```javascript
import App from "./App";
import Vue from "vue";
new Vue({
    el:"#app",
    render(CreatElement){
        return CreatElement(App)
    }
})
```

index.html

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="root"></div>
    <script src="vue.js"/>
    <script src="main.js"/>
</body>
</html>
```





vue创建的helloworld目录结构

![image-20220504211139607](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220504211139607.png)



### 目录结构

## render函数

![image-20220505204516857](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220505204516857.png)

1.

vue.js是完整版的vue,包括了核心功能+模板解析器

vue.runtime.xxx.js是运行版的vue，只有核心功能，没有模板解析器

2.因为没有模板解析器，所以我们需要使用render函数来使用，注意:el还是要写,卡了好久哦.

```javascript
import App from "./App";
import Vue from "vue";
new Vue({
    el:"#app",
    render:h=>h(App)
})
```

这里是简写形式,h是函数CreatElement的别称.

```javascript
render(CreatElement){
    return CreatElement(App)
}
```

## ref属性

编写在标签之内

```vue
<h1 ref="hello">欢迎来到尚硅谷!</h1>
```

获取:this.$refs.id

测试:

```vue
<template>
  <div>
    <h1 ref="hello">欢迎来到尚硅谷!</h1>
    <button @click="get">点我获取hello</button>
    <school/>
    <hr/>
    <student like="js"></student>
  </div>
</template>

<script>
import school from "./components/School";
import student from "./components/Student";
export default {
  name: "App",
  components:{
    school,student
  },
  methods:{
    get(){
      console.log(this.$refs.hello);
    }
  }

}
</script>

<style scoped>

</style>
```

结果：

![image-20220505214234079](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220505214234079.png)

## props

props写在data外面啊,和data并行的.

student.vue

```vue
<template>
  <div>
    <h2>姓名:{{name}}</h2>
    <h2>爱好:{{hobby}}</h2>
    <h2>喜欢:{{like}}</h2>
  </div>

</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "student",
  data(){
    return{
      name:"lozijy",
      hobby:"java",
    }
  },
  props:['like']
}
</script>

<style scoped>

</style>
```

## mixin 混入

#### 局部混入

src/mixin.js

```javascript
export const mixin = {
    methods: {
        showName() {
            alert(this.name)
        }
    },
    mounted() {
        console.log("你好呀~")
    }
}
```

src/component/Student.vue

```vue
<template>
  <div>
    <button @click="showname"></button>
    <h2 @click="showName">姓名:{{name}}</h2>
    <h2>爱好:{{hobby}}</h2>
    <h2>喜欢:{{like}}</h2>
  </div>

</template>

<script>
import {mixin} from '../mixin'
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "student",
  data(){
    return{
      name:"lozijy",
      hobby:"java",
    }
  },
  props:['like'],
  mixins:[mixin]
}
</script>

<style scoped>

</style>
```



#### 全局混入

#### 在main.js中实现混入

```javascript
import App from "./App";
import Vue from "vue";
import {mixin} from "@/mixin";
Vue.mixin(mixin);
new Vue({
    el:"#app",
    render(CreatElement){
        return CreatElement(App)
    }
})
```

## plugins插件

对象中写一个install方法,由Vue自动帮我们调用,在install方法中可定义过滤器，混入,在Vue原型上定义一个方法

#### 使用:在main.js中引入+使用Vue.use(plugin,参数),其中第一个参数vue不需要传入

#### plungins.js

```javascript
export default {
    //Vue需要作为参数引入
    install(Vue,x,y,z){
        console.log(x,y,z)
        Vue.filter("myslice",function (value){
            return value.slice(0,4)
        })
        //定义过滤器
        //定义混入
        Vue.mixin({
            data(){
                return {
                    x:100,
                    y:200,
                }
            },
            methods:{
                showName(){
                    console.log(this.name);
                }
            }
        }
        )
        //在Vue原型上加一个方法,这样就可以在VM和VC上使用了
        Vue.prototype.hello=function (){
            console.log("hello")
        }
    }
}
```

#### main.js

```javascript
import App from "./App";
import Vue from "vue";
import plungins from "@/components/plungins";
Vue.use(plungins,1,2,3);
new Vue({
    el:"#app",
    render(CreatElement){
        return CreatElement(App)
    }
})
```



#### 在Student.vue中使用plugins提供的参数和过滤器

```vue
<template>
  <div>
    <button ></button>
    <h2 @click="showName">姓名:{{name|myslice}}</h2>
    <h2>爱好:{{hobby}}</h2>
    <h2>喜欢:{{like}}</h2>
    <h3>plungins:{{x}}</h3>
  </div>

</template>

<script>

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "student",
  data(){
    return{
      name:"lozijy123213",
      hobby:"java",
    }
  },
  props:['like'],
}
</script>

<style scoped>

</style>
```

效果:过滤器+传入数据

![image-20220506143512632](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220506143512632.png)

## scoped 作用域

## 案例:todolist

组件:header,footer,list,item

item用于展示数据,list是一个容器，把item包裹在内

设计流程:静态(html+css写死)->动态将写死的内容变活,通过props进行传参,

数据的存储使用列表,每一个数据用对象处理,每一条数据不可能只有看得见的字符串，还要有checked,来判断是否要勾选



#### App.vue

```vue
<template>
  <div id="root">
    <Headline/>
    <div class="todo-container">
      <div class="todo-wrap">
        <MyHeader :addTodo="addTodo"/>
        <MyList :todos="todos" :checkTodo="checkTodo" :deleteTodo="deleteTodo"/>
        <MyFooter :todos="todos" :checkAllTodo="checkAllTodo" :clearAllTodo="clearAllTodo"/>
      </div>
    </div>

  </div>
</template>

<script>
import MyHeader from './components/MyHeader.vue'
import MyList from './components/MyList.vue'
import MyFooter from './components/MyFooter.vue'
import MyItem from "@/components/MyItem";
import Headline from "@/components/Headline";
export default {
  name:"App",
  components:{
    // eslint-disable-next-line vue/no-unused-components
  MyList,MyFooter,MyHeader,MyItem,Headline
  },
  data(){
    return{
      //存放数据,由additem方法传输数据
      todos:[]
    }
  },
  watch:{
    todos(value){
      localStorage.setItem("todos",JSON.stringify(value));
    }
  },
  methods:{
    //添加todo方法,参数由myheader提供
    addTodo(todoobj){
      this.todos.unshift(todoobj);
    },
    //检查给定id的todo的属性done是否为true,返回对应的bool类型
    checkTodo(id){
      this.todos.forEach((todo)=>{
        if(todo.id===id &&todo.done===false)
        {
          todo.done=true
        }else if(todo.id===id &&todo.done===true)todo.done=false;
      })
    },
    deleteTodo(id){
      this.todos=this.todos.filter((todo)=>{
        return todo.id!==id;
      })
    },
    checkAllTodo(){
      this.todos.forEach(todo=>{
        todo.done=true;
      })
    },
    clearAllTodo(){
      this.todos=this.todos.filter(todo=>{
        return todo.done===false;
      })
    }
  }
}
</script>

<style>
body {
  background: #fff url("../public/img/img2.webp");
}
img{
}
.todo-container {
  background-color: pink;
  width: 600px;
  margin: 50px auto;
}
.todo-container .todo-wrap {
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
}
</style>
```

Headline.Vue

```vue
<template>
<img src="../../public/img/yuanshen2.png">
</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Headline"
}
</script>

<style scoped>
img{
  position: absolute;
  width: 20rem;
  height: 4rem;
  left: calc(50% - 3.982rem);
  top: 1.096rem;
  font-size: 93.75px;
}
</style>
```

MyHeader.vue

```vue
<template>
  <div class="todo-header">
    <input type="text" placeholder="请输入你的任务名称，按回车键确认" @keydown.enter="add()" v-model="title"/>
  </div>
</template>

<script>
import {nanoid} from 'nanoid'
export default {
  name:"MyHeader",
  data(){
    return{
      title:""
    }
  },
  methods:{
    //调用父传来的函数，把参数传给父亲
    add(){
        const todoobj={
          id:nanoid(),
          title:this.title,
          done:false,
        }
        this.addTodo(todoobj);
        //清空字符串
        this.title = "";
    }
  },
  props:["addTodo"]
}
</script>

<style scoped>
.todo-header input {
  width: 560px;
  height: 28px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 4px 7px;
}
.todo-header input:focus {
  outline: none;
  border-color: rgba(82, 168, 236, 0.8);
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
}
</style>
```

MyList.vue

```vue
<template>
  <ul class="todo-main">
    <MyItem
        v-for="todo in todos"
        :key="todo.id"
        :todo="todo"
        :checkTodo="checkTodo"
        :deleteTodo="deleteTodo"
    />

  </ul>

</template>

<script>
import MyItem from "@/components/MyItem";
export default {
  name:"MyList",
  props:["todos","checkTodo","deleteTodo"],
  components:{
    MyItem
  }
}
</script>

<style scoped>
.todo-main {
  margin-left: 0px;
  border: 1px solid #ddd;
  border-radius: 2px;
  padding: 0px;
}
.todo-empty {
  height: 40px;
  line-height: 40px;
  border: 1px solid #ddd;
  border-radius: 2px;
  padding-left: 5px;
  margin-top: 10px;
}
</style>
```

MyItem.vue

```vue
<template>

<li>
    <label>
      <input type="checkbox" :checked="todo.done" @click="handleCheck(todo.id)"/>
      <span>{{todo.title}}</span>
    </label>
    <button class="btn btn-danger" @click="handleDelete(todo.id)">删除</button>
</li>
</template>

<script>
export default {
  name:"MyItem",
  props:["todo","checkTodo","deleteTodo"],
  methods:{
    handleCheck(id){
      this.checkTodo(id);
    },
    handleDelete(id){
      this.deleteTodo(id)
    },
  },
}
</script>

<style scoped>
li {
  list-style: none;
  height: 36px;
  line-height: 36px;
  padding: 0 5px;
  border-bottom: 1px solid #ddd;
}
li label {
  float: left;
  cursor: pointer;
}
li label li input {
  vertical-align: middle;
  margin-right: 6px;
  position: relative;
  top: -1px;
}
li button {
  float: right;
  display: none;
  margin-top: 3px;
}
li:before {
  content: initial;
}
li:last-child {
  border-bottom: none;
}
li:hover {
  background-color: #eee;
}
li:hover button{
  display: block;
}
</style>
```

Myfooter.vue

```vue
<template>
  <div class="todo-footer" v-show="total">
    <label>
      <input type="checkbox" v-model="isAll"/>
    </label>
    <span>
            <span>已完成{{doneTotal}}</span> / 全部{{total}}
        </span>
    <button class="btn btn-danger" @click="clearAll">清除已完成任务</button>
  </div>
</template>

<script>
export default {
  name:"MyHeader",
  data(){
    return{
      isAll:false
    }
  },
  computed:{
    total(){
      return  this.todos.length;
    },
    doneTotal(){
      return  this.todos.reduce((pre,todo)=> pre + (todo.done ? 1 : 0) ,0)
    }
  },
  methods:{
    clearAll(){
      this.clearAllTodo();
    }
  },
  watch:{
    isAll(newValue){
      // eslint-disable-next-line vue/no-mutating-props
      this.todos.forEach(todo=>{
        todo.done=newValue;
      })
      console.log("isAll改变了")
    }
  },
  props:["todos","checkAllTodo","clearAllTodo"]
}
</script>

<style scoped>
.todo-footer {
  height: 40px;
  line-height: 40px;
  padding-left: 6px;
  margin-top: 5px;
}
.todo-footer label {
  display: inline-block;
  margin-right: 20px;
  cursor: pointer;
}
.todo-footer label input {
  position: relative;
  top: -1px;
  vertical-align: middle;
  margin-right: 5px;
}
.todo-footer button {
  float: right;
  margin-top: 5px;
}
</style>
```





## 组件的自定义事件

子组件给父组件传数据,用函数

### 绑定

父组件:@atguigu="method"

子组件:在一个函数中:this.$emit("method",data)

#### app.vue

```vue
<template>
  <School @atguigu="getName"/>
  <Student/>
</template>

<script>
import Student from "@/components/Student";
import School from "@/components/School";
export default {
  name: 'App',
  components: {
    // eslint-disable-next-line vue/no-unused-components
  School,Student,
  },

    methods:{
    getName(name){
      console.log("得到了名字 : ",name )
    }

  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
```

#### student.vue

```vue
<template>
  <h1>{{name}}</h1>
  <h2>{{address}}</h2>
  <button @click="sendname">点我把数据发给app</button>
</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Student",
  data(){
    return{
      name:"尚硅谷",
      address:"北京"
    }

  },
  methods:{
    sendname(){
      this.$emit("atguigu",this.name)
    }
  }
}
</script>

<style scoped>

</style>
```



### 解绑

```javascript
//解绑单个时间
this.off("atguigu");
//解绑多个事件
this.off(["atguigu"])
//全部解绑
this.off();
```

student.vue

```vue
<template>
  <h1>{{name}}</h1>
  <h2>{{address}}</h2>
  <button @click="sendname">点我把数据发给app</button>
  <button @click="unbind">点我解绑</button>
</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Student",
  data(){
    return{
      name:"尚硅谷",
      address:"北京"
    }

  },
  methods:{
    sendname(){
      this.$emit("atguigu",this.name)
    },
    unbind(){
      //解绑单个时间
      this.off("atguigu");
      //解绑多个事件
      this.off(["atguigu"])
      //全部解绑
      this.off();
    }
  }
}
</script>

<style scoped>

</style>
```

Mylist.vue

```vue
<template>
  <ul class="todo-main">
    <MyItem
        v-for="todo in todos"
        :key="todo.id"
        :todo="todo"
        :checkTodo="checkTodo"
        :deleteTodo="deleteTodo"
    />

  </ul>

</template>

<script>
import MyItem from "@/components/MyItem";
export default {
  name:"MyList",
  props:["todos","checkTodo","deleteTodo"],
  components:{
    MyItem
  }
}
</script>

<style scoped>
.todo-main {
  margin-left: 0px;
  border: 1px solid #ddd;
  border-radius: 2px;
  padding: 0px;
}
.todo-empty {
  height: 40px;
  line-height: 40px;
  border: 1px solid #ddd;
  border-radius: 2px;
  padding-left: 5px;
  margin-top: 10px;
}
</style>
```



## 全局事件总线

用于任意组件之间的通信

@on绑定,@emit,@off解绑

### 在main.js中安装全局事件总线

```javascript
import Vue from "vue"
import App from './App.vue'

Vue.config.productionTip = false

new Vue({
    el:"#app",
    render: h => h(App),
    beforeCreate() {
        Vue.prototype.$bus=this;
    }
})
```

在请求数据的组件中绑定

```vue
<template>
  <School />
  <Student />
</template>

<script>
import Student from "@/components/Student";
import School from "@/components/School";
export default {
  name: 'App',
  components: {
    // eslint-disable-next-line vue/no-unused-components
  School,Student,
  },
  mounted() {
    this.$bus.$on("getName",(name)=>{
      console.log("收到了name:",name)
    })
  }


}
</script>

<style>

</style>MyItem.vue
```



在发送数据的组件中用emit执行(可以调用函数，也可以mounted)

```vue
<template>
  <h1>{{name}}</h1>
  <h2>{{address}}</h2>
  <button @click="sendname">点我把数据发给app</button>
</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Student",
  data(){
    return{
      name:"尚硅谷",
      address:"北京"
    }

  },
  methods:{
    sendname(){
      this.$emit("getName",this.name)
    }

  }
}
</script>

<style scoped>

</style>
```

## 消息订阅

也可实现任意组件间通信，在Vue中用的较少

## Todolist编辑 



## nexrtick



## 动画效果

## 过渡效果

## 多个元素过渡

## 集成第三方动画

## 配置代理 方式一

##  配置方式二



## Github查询案例

```javascript
import Vue from 'vue'
import App from './App.vue'

Vue.config.productionTip = false

new Vue({
  el:"#app",
  render: h => h(App),
  beforeCreate() {
    Vue.prototype.$bus=this;
  }
})
```

```vue
<template>
  <div id="app">
    <div class="container">
      <Search/>
      <List/>
    </div>
  </div>
</template>

<script>
import List from "@/components/List";
import Search from "@/components/Search";
export default {
  name: 'App',
  components: {
    // eslint-disable-next-line vue/no-unused-components
      List,Search
  }
}
</script>

<style>
  .container{
    width: 1000px;
    margin: 0 auto 0 auto;
    padding: 10px;
  }
</style>
```

```vue
<template>
  <div>
    <input type="text" value="enter the name to find the user" v-model="name">
    <button type="submit" @click="search">提交</button>
  </div>
</template>

<script>
import axios from "axios"
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Search",
  data(){
    return{
      name:"",
    }
  },
  methods:{
    search(){
      axios.get(`https://api.github.com/search/users?q=${this.name}`).then(
          response=>{
            console.log("请求成功了!",response.data.items);
            this.$bus.$emit("getusrs",response.data.items)
          }
          ,error=>{
            console.log(error.message)
          }
      )
    }
  }
}
</script>

<style scoped>
div{
  margin: 0 auto 20px auto;
}
input{
  width: 200px;
  height: 28px;
  margin: 0 auto 0 auto;
  font-size: 14px;
  padding: 7px;
  border: 4px solid pink;;
  border-radius: 5px;
}
button{
  width: 50px;
  height: 28px;
  margin: 0 auto 0 auto;
  border: 4px solid pink;
}
</style>
```

```vue
<template>
  <div>
    <Item v-for="(usr) in usrs" :key="usr.login" :usr="usr"></Item>
  </div>
</template>

<script>
import Item from "@/components/Item";
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "List",
  data(){
    return{
      usrs:[]
    }

  },
  components:{
    Item
  },
  mounted() {
    //接收数据的绑定全局事件
    this.$bus.$on("getusrs",(usrs)=>{
      console.log("我收到了数据")
      this.usrs=usrs;

    })
  }
}
</script>

<style scoped>
div {
  float: left;
  padding: 30px;
}
</style>
```

```vue
<template>
  <div>
    <img :src="usr.avatar_url" style="width: 300px">
    <a href="usr.np"></a>
    <div class="name">{{usr.login}}</div>
  </div>
</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Item",
  props:["usr"]
}
</script>

<style scoped>
div{
  width: 250px;
  margin: 0px auto 0px auto;
}
.name{
  margin: 0px auto 0px auto;
}
</style>
```

## 插槽

用于父组件和子组件之间的通信

### 默认插槽

#### app.vue

```vue
<template>
  <div class="category">
    <h3>{{title}}分类</h3>
    <!-- 定义一个插槽（挖个坑，等着组件的使用者进行填充） -->
    <slot >我是一些默认值，当使用者没有传递具体结构时，我会出现</slot>

  </div>
</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name:'List',
  props:['title']
}
</script>

<style scoped>
.category{
  background-color: skyblue;
  width: 200px;
  height: 300px;
}
h3{
  text-align: center;
  background-color: orange;
}
video{
  width: 100%;
}
img{
  width: 100%;
}
</style>
```

#### list.vue

```vue
<template>
  <div class="container">
    <List title="美食" >
      <img src="https://s3.ax1x.com/2021/01/16/srJlq0.jpg" alt="">
    </List>

    <List title="游戏" >
      <ul>
        <li v-for="(g,index) in games" :key="index">{{g}}</li>
      </ul>
    </List>
    <List title="电影">
      <video controls src="http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"></video>
    </List>
  </div>
</template>

<script>
import List from "@/components/List";

export default {
  name:'App',
  components:{List},
  data() {
    return {
      games:['植物大战僵尸','红色警戒','空洞骑士','王国']
    }
  },
}
</script>

<style scoped>
.container{
  display: flex;
  justify-content: space-around;
}
</style>
```

### 具名插槽

#### list.vue

```vue
<template>
  <div class="category">
    <h3>{{title}}分类</h3>
    <!-- 定义一个插槽（挖个坑，等着组件的使用者进行填充） -->
    <slot name="center">我是一些默认值，当使用者没有传递具体结构时，我会出现</slot>
    <slot name="bottom">默认值</slot>
  </div>
</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name:'List',
  props:['title']
}
</script>

<style scoped>
.category{
  background-color: skyblue;
  width: 200px;
  height: 300px;
}
h3{
  text-align: center;
  background-color: orange;
}
video{
  width: 100%;
}
img{
  width: 100%;
}
</style>
```

#### app.vue

```vue
<template>
  <div class="container">
    <List title="美食" >
      <template slot="center">
        <img src="https://s3.ax1x.com/2021/01/16/srJlq0.jpg" alt="">
      </template>
      <template slot="bottom">
        <img src="https://s3.ax1x.com/2021/01/16/srJlq0.jpg" alt="">
      </template>

    </List>

    <List title="游戏" >
      <template slot="center">
        <ul>
          <li v-for="(g,index) in games" :key="index">{{g}}</li>
        </ul>
      </template>
      <template slot="bottom">
        <ul>
          <li v-for="(g,index) in games" :key="index">{{g}}</li>
        </ul>
      </template>


    </List>

    <List title="电影">
      <template slot="center">
        <video controls src="http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"></video>
      </template>
      <template slot="bottom">
        <video controls src="http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"></video>
      </template>

    </List>
  </div>
</template>

<script>
import List from "@/components/List";
export default {
  name:'App',
  // eslint-disable-next-line vue/no-unused-components
  components:{List},
  data() {
    return {
      games:['植物大战僵尸','红色警戒','空洞骑士','王国']
    }
  },
}
</script>

<style scoped>
.container{
  display: flex;
  justify-content: space-around;
}
</style>
```

### 作用域插槽

数据存放在子组件，如何显示有父组件决定

app.vue

```vue
<template>
  <div class="container">
    <List title="游戏" >
      <template scope="jojo1">
        <ul class="ul1">
          <li v-for="(game,index)in jojo1.games" :key="index">{{game}}</li>
        </ul>

      </template>

    </List>

    <List title="游戏" >
      <template scope="jojo2">
        <ul class="ul2">
          <li v-for="(game,index)in jojo2.games" :key="index">{{game}}</li>
        </ul>

      </template>


    </List>

    <List title="游戏">
      <template scope="jojo3">
        <ul class="ul3">
          <li v-for="(game,index)in jojo3.games" :key="index">{{game}}</li>
        </ul>

      </template>


    </List>
  </div>
</template>

<script>
import List from "@/components/List";
export default {
  name:'App',
  // eslint-disable-next-line vue/no-unused-components
  components:{List},
  data() {
    return {
      games:['植物大战僵尸','红色警戒','空洞骑士','王国']
    }
  },
}
</script>

<style scoped>
.container{
  display: flex;
  justify-content: space-around;
}
.ul1{
  background-color: pink;
}
.ul2{
  background-color: bisque;
}
.ul3{
  background-color: aquamarine;
}
</style>
```

list.vue

```vue
<template>
  <div class="category">
    <h3>{{title}}分类</h3>
    <slot :game="games"></slot>


  </div>
</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name:'List',
  data(){
    return{
      props:["title"],
      games:['植物大战僵尸','红色警戒','空洞骑士','王国']
    }
  }

}
</script>

<style scoped>
.category{
  background-color: skyblue;
  width: 200px;
  height: 300px;
}
h3{
  text-align: center;
  background-color: orange;
}
video{
  width: 100%;
}
img{
  width: 100%;
}
</style>
```



效果

![image-20220510181003824](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220510181003824.png)

踩大坑:  

```vue
<List title="游戏" >
  <template scope="jojo1">
    <ul class="ul1">
      <li v-for="(game,index) in jojo1.games" :key="index">{{game}}</li>
    </ul>

  </template>

</List>
```

      ```html
            <li v-for="(game,index) in jojo1.games" :key="index">{{game}}</li>
      ```

这个 in 之前必须有一个空格，不然会编译报错，弄了好久的。

## Vuex

### 原理

![image-20220510233212465](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220510233212465.png)

### 搭建环境

1.下载vuex3

```
npm i vuex@3
```

用3版本,四版本在vue2中无法使用

2.引入vuex并创建store暴露出去

Store/index.js

```javascript
import Vue from "vue";
import Vuex from "Vuex";
//vuex的使用必须在store创建之前，所以在这里编写而非main.js
Vue.use(Vuex);
//创建actions
const Actions={};
//创建mutation
const mutation={};
//创建state
const state={};
//创建store并暴露出去
export default new Vuex.store({
    Actions,mutation,state
})
```

3.在vue中配置store,此时store中的方法(dispather,commit)可被所有组件看到.

main.js

```javascript
//引入Vue
import Vue from 'vue'
import App from './App.vue'
//引入编写好的store
import store from "./Store"
Vue.config.productionTip = false

new Vue({
  el:"#app",
  render: h => h(App),
  beforeCreate() {
    Vue.prototype.$bus=this;
  },
  //配置store
  store
})
```

### 案例:用vuex完成求和

### vuex版

actions

```javascript
const actions={
    addodd(context,value){
        if(context.state.num%2!==0){
            context.commit('ADD',value)
        }
    },
    addTimeout(context,value){
        setTimeout(()=>{
            context.commit('ADD',value)
        },500)
    }
};
```

mutations

```javascript
const mutations={
    ADD(value,state){
        state.num+=value;
    },
    SUBTRACT(value,state){
        state.num-=value
    }
};
```

state

```javascript
const state={
    num:0
};
```

store

```javascript
export default new Vuex.store({
    actions,mutations,state
})
```

组件中调用

```javascript
additem(){
  //调用commit
  this.$store.commit("ADD",this.n)
},
removeitem(){
  this.$store.commit("SUBTRACT",this.n)
},
addodd(){
  this.$store.dispatch("addodd",this.n)
},
addtimeout(){
  this.$store.dispatch("addTimeout",this.n);
}
```

踩坑:开始静态页面无法显示,定位后发现在index.js中引入store后出现问题

业务逻辑写在actions里面,具体的操作数据的放在mutations里面,在组件中函数若没有业务逻辑，则可以直接调用mutations



Count.vue

```vue
<template>
  <div>
    <h1>当前求和为：{{$store.state.sum}}</h1>
    <select v-model.number="n">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
    </select>
    <button @click="increment">+</button>
    <button @click="decrement">-</button>
    <button @click="incrementOdd">当前求和为奇数再加</button>
    <button @click="incrementWait">等一等再加</button>
  </div>
</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name:'Count',
  data() {
    return {
      n:1, //用户选择的数字
    }
  },
  methods: {
    increment(){
      this.$store.commit('ADD',this.n)
    },
    decrement(){
      this.$store.commit('SUBTRACT',this.n)
    },
    incrementOdd(){
      this.$store.dispatch('addOdd',this.n)
    },
    incrementWait(){
      this.$store.dispatch('addWait',this.n)
    },
  },
}
</script>

<style>
button{
  margin-left: 5px;
}
</style>
```

main.js

```javascript
import Vue from 'vue'
import App from './App.vue'
import Vuex from 'vuex'
import store from './store'

Vue.config.productionTip = false

Vue.use(Vuex)

new Vue({
  el:"#app",
  render: h => h(App),
  store
})
```

index.js

```javascript
//引入Vue核心库
import Vue from 'vue'
//引入Vuex
import Vuex from 'vuex'
//应用Vuex插件
Vue.use(Vuex)

//准备actions对象——响应组件中用户的动作
const actions = {
    addOdd(context,value){
        console.log("actions中的addOdd被调用了")
        if(context.state.sum % 2){
            context.commit('ADD',value)
        }
    },
    addWait(context,value){
        console.log("actions中的addWait被调用了")
        setTimeout(()=>{
            context.commit('ADD',value)
        },500)
    },
}
//准备mutations对象——修改state中的数据
const mutations = {
    ADD(state,value){
        state.sum += value
    },
    SUBTRACT(state,value){
        state.sum -= value
    }
}
//准备state对象——保存具体的数据
const state = {
    sum:0 //当前的和
}

//创建并暴露store
export default new Vuex.Store({
    actions,
    mutations,
    state
})
```

### vuex开发者工具

vuex和vue的开发者工具是同一个

devtools专门捕获mutations

### getter配置项

可用于数据处理后的多组件复用

index.js

```javascript
const getters = {
    sumten(state){
        return state.sum*10;
    }
}
//创建并暴露store
export default new Vuex.Store({
    actions,
    mutations,
    state,
    getters
})
```

Count.vue

```vue
<h1>乘10后:{{$store.getters.sumten}}</h1>
```

### mapstate和mapGetters

组件中引入

```javascript
import {mapState} from "vuex"
```

 ![image-20220511205731640](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220511205731640.png)

方法一:对象形式

```javascript
...mapState(
    {he:"sum",
      xuexiao:"school",
      dizhi:"address",
    })
```

方式二:数组形式

```javascript
  ...mapState(
      ["sum","school","address"])
}
```





踩坑:

1. vuex中的v必须小写,mapState中的S必须大写

2. 必须写在computed里面，我写在data里面了.

### mapActions和mapMutations

引入

```import {mapState,mapGetters,mapMutations,mapActions} from "vuex"
import {mapState,mapGetters,mapMutations,mapActions} from "vuex"
```

在vue对象中配置methods用结构方式写

```javascript
methods: {
  ...mapMutations(["ADD","SUBTRACT"]),
  ...mapActions(['addOdd','addWait'])

},
```

注意:

和mapstate的区别在template中调用时要传参

```html
<button @click="ADD(n)">+</button>
```

### 多组件共享数据

### vuex模板化+namespace1

### vuex模板化+namespace2

## 路由vue-router

### 路由的简介:

服务于SPA技术，实现在单个页面显示多个页面组件

### 路由的基本使用

下载路由

```c
npm i vue-router@3
```

./router/index.js

```javascript
import VueRouter from "vue-router";
//引入要配置的组件
import Home from "@/pages/Home";
import About from "@/pages/About";
export default new VueRouter({
    routes:[{
        path:'/home',
        component:Home
    },
        {
        path: "/about",
        component: About
        }]
})
```

main.js

```javascript
import Vue from 'vue'

//引入vue-router
import VueRouter from "vue-router";
//引入自行配置好的router
import router from "./router"
Vue.config.productionTip = false
Vue.use(VueRouter)
import App from "@/App";

new Vue({
  el:"#app",
  render: h => h(App),
  router
})
```

App.vue

```vue
<template>
  <div>
    <div class="row">
      <div class="col-xs-offset-2 col-xs-8">
        <div class="page-header"><h2>Vue Router Demo</h2></div>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-2 col-xs-offset-2">
        <div class="list-group">
          <!-- 原始html中我们使用a标签实现页面跳转 -->
          <!-- <a class="list-group-item active" href="./about.html">About</a>
          <a class="list-group-item" href="./home.html">Home</a> -->

          <!-- Vue中借助router-link标签实现路由的切换 -->
          <router-link class="list-group-item" active-class="active" to="/about">        About
          </router-link>
          <router-link class="list-group-item" active-class="active" to="/home">
            Home
          </router-link>
        </div>
      </div>
      <div class="col-xs-6">
        <div class="panel">
          <div class="panel-body">
            <!-- 指定组件的呈现位置 -->
            <router-view></router-view>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "App"
}
</script>

<style scoped>

</style>
```

Home.vue

```vue
<template>
  <h2>我是Home组件的内容</h2>
</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Home"
}
</script>

<style scoped>

</style>
```

### 几个注意点

从一个组件调到切换到另一个组件,被切换的组件被销毁

路由中的组件放在pages文件夹中集中管理

### 嵌套路由

注意:

1.在index.js中编写二级目录的path时不用写/

2.静态页面中的

```html
<router-link class="list-group-item" active-class="active" to="/about"> 
```

to要把一级路由，二级路由写全。

### 路由的请求参数



 
