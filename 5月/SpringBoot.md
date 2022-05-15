### SpringBoot(6)

是什么

配置如何编写 yaml

自动装配原理:重要

集成web开发业务核心

集成数据库Druid

分布式开发 Dubbo+zookeeper

swagger：接口文档

任务调度

SpringSecurity,shiro封装filter+拦截器

### linux(2)

### Springcloud(2.5) 

微服务

入门

Restful风格

Eureka和zookeeper一样是一种解决方案

Ribbon

Feign

HyStrix

Zuul路由网关

SpringClou config:git

SpringCloudAlibaba

### JVM(2)



## 什么是SpringBoot

### 什么是Spring

ioc,aop,di

通过切面和模板减少样式代码

### 什么是SpringBoot

springboot的历史

集成大量第三方库redis,mongodb,rabbitmq

优点

开箱即用

内嵌式容器

无xml配置要求

### 什么是微服务架构

其他架构 MVC,MVVM,微服务架构

将应用构建出一系列小的组合通过http的方式互通

单体应用架构(all in one) 将一个应用中所有应用服务封装在一个应用中(都放在同一个war包里)好处在于易于开发和测试，在加上个负载均衡即可，缺点在于一个应用服务出错，整个应用都会挂掉

微服务:将服务应用拆分，跑在多个服务器上

核心思想：高内聚低耦合

## Hello，world

官方提供了一个快速生成的网站，IDEA集成了种鸽网站

![image-20220514201907768](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220514201907768.png)

推荐使用idea快速生成SpirngBoot项目

Hello，world

![image-20220514202520411](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220514202520411.png)

![image-20220514202734717](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220514202734717.png)

在Controller包下新建一个class:helloController并写入以下代码

```java
package com.kuang.helloworld.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @RequestMapping("/hello")
    public String Hello(){
        return"hello,world";
    }
}
```

通过源码分析:application程序主入口本身就是Spring的一个组件(有注解@component)

分析pom.xml发现有以下代码

```xml
<parent>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-parent</artifactId>
   <version>2.6.7</version>
   <relativePath/> <!-- lookup parent from repository -->
</parent>
```

继续分析依赖

starter-web用于实现HTTP接口，包含了springmvc

```xml
    <!--web依赖:tomcat dispatcherServlet,xml-->
   <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
   </dependency>
   <!--单元测试-->
   <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-test</artifactId>
      <scope>test</scope>
   </dependency>
</dependencies>
```

如何打包

![image-20220514203949672](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220514203949672.png)



这种写法更加常见，大的path下一个小的path分别是@RequestMapping和@GetMapping

```java
package com.kuang.helloworld.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HelloController {
    @GetMapping("/hello")
    @ResponseBody
    public String Hello(){
        return"hello";
    }
}
```

更改端口号

```properties
server.port=8081
```

自定义banner

## 自动装配原理

### pom.xml

核心依赖在父工程中

启动器

- ```xml
  		<dependency>
    			<groupId>org.springframework.boot</groupId>
    			<artifactId>spring-boot-starter-web</artifactId>
    		</dependency>
  ```

- 说白了就是Springboot的启动场景

- 比如spring-boot-stater-web就会帮我们自动导入web环境的所有依赖

- springboot会将所有的功能场景都变成一个个的启动器

- 我们要使用什么功能，就只需要找到对应的启动器(在官方中寻找)

### 主程序



```java
package com.kuang.helloworld;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication {

   public static void main(String[] args) {
      SpringApplication.run(DemoApplication.class, args);
   }

}
```

注解

- @SpringBootApplication标记这是主程序

- ```java
  @Target({ElementType.TYPE})
  @Retention(RetentionPolicy.RUNTIME)
  @Documented
  @Inherited
  @SpringBootConfiguration
  @EnableAutoConfiguration
  @ComponentScan(
      excludeFilters = {@Filter(
      type = FilterType.CUSTOM,
      classes = {TypeExcludeFilter.class}
  ), @Filter(
      type = FilterType.CUSTOM,
      classes = {AutoConfigurationExcludeFilter.class}
  )}
  )
  ```

- 查看源码发现这是一个组合注解,核心是SpringBootConfiguration和EnableAutoConfiguration

@SpringBootConfiguration

- 

- ```java
  @Component
  ```

  说明这也是一个组件

- ```java
  @Target({ElementType.TYPE})
  @Retention(RetentionPolicy.RUNTIME)
  @Documented
  @Configuration
  @Indexed
  ```



@EnableAutoConfiguration

自动配置

```java
@AutoConfigurationPackage
```

自动配置包 

## 了解一下主启动类如何启动

```java
SpringApplication.run(DemoApplication.class, args);
```

并不只是运行一个程序，而且是开启一个服务，开启一个进程（和docker原理类似）

SpringApplication类主要做四件事情

推动项目是普通项目还是web项目

查找并加载所有可用初始化器，设置到initializers属性中

找出所有应用程序监听器，设置到listeners属性中

推断并设置main方法的定义类，找到运行的主类

源码关键:@Configuration 配置@Bean组件

## yaml语法

配置文件得到名字是固定的

application.properties或application.yaml

properties

```properties
#只能保存键值对
key=value
```

yaml(对空格的要求十分高)

```yaml
# 普通的key value
key: value
# 对象
student:
	name:qinjiang
	age:3
# 行内写法
student: {name: qinjiang,age: 3}
#数组
pets:
	- cat
	- dog
	- pig
pets: [cat,dog,pig]
```

注意:空格不能丢





springboot可以配置什么东西呢

官方的配置太多了

了解原理:一通百通



## 给属性赋值的几种方式

yaml可以直接给实体类赋值

pojo.dog

```java
package com.kuang.helloworld.pojo;

import org.springframework.stereotype.Component;

@Component
public class Dog {
    public String name;
    public int age;

    public Dog() {
    }

    public Dog(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }
}

```

​	pojo.people

@Component

@ConfigurationProperties(prefix ="person")绑定person实例和Person实体类

```java
package com.kuang.helloworld.pojo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.Map;
@Component
@ConfigurationProperties(prefix = "person")
public class Person {
    public String name;
    public Integer age;
    public boolean isHappy;
    public Date birth;
    private Map<String,Object>maps;
    private List<Object>list;
    private Dog dog;

    public Person(String name, Integer age, boolean isHappy, Date birth, Map<String, Object> maps, List<Object> list, Dog dog) {
        this.name = name;
        this.age = age;
        this.isHappy = isHappy;
        this.birth = birth;
        this.maps = maps;
        this.list = list;
        this.dog = dog;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public boolean isHappy() {
        return isHappy;
    }

    public Date getBirth() {
        return birth;
    }

    public Map<String, Object> getMaps() {
        return maps;
    }

    public List<Object> getList() {
        return list;
    }

    public Dog getDog() {
        return dog;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setHappy(boolean happy) {
        isHappy = happy;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public void setMaps(Map<String, Object> maps) {
        this.maps = maps;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }

    public void setDog(Dog dog) {
        this.dog = dog;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", isHappy=" + isHappy +
                ", birth=" + birth +
                ", maps=" + maps +
                ", list=" + list +
                ", dog=" + dog +
                '}';
    }
}
```

Application.yaml

将实例与实体类绑定

```yaml
person:
  name: lozijy
  age: 3
  ishappy: false
  birth: 2020/5/15
  maps: {k21: v1,k: v2}
  list:
    - code
    - music
    - cat
  dog:
    name: 旺财
    age: 3
```

test

```java
@SpringBootTest
class DemoApplicationTests {
   @Autowired
   Person person;
   @Test
   void contextLoads() {
      System.out.println(person);

   }

}
```