## 前言

更新了半个月的vue(4.30-5.13)，终于写完了,不考虑继续学习vue3,先把后端整精通，继续spring全家桶吧，这一次是Springmvc系列,作为servlet的替代,springmvc显然拥有高内聚低耦合的特征，已然成为后端工程师的基础，本博客不提供源码部分的分析，只提供基本使用的讲解,需要学习源码的推荐一本《spring源码分析》+《大话设计模式》。

### Hello,World

### 引入依赖 

springframework+日志logback+servlet+thymeleaf

```xml
<dependencies>
  <!-- SpringMVC -->
  <dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>5.3.1</version>
  </dependency>

  <!-- 日志 -->
  <dependency>
    <groupId>ch.qos.logback</groupId>
    <artifactId>logback-classic</artifactId>
    <version>1.2.3</version>
  </dependency>

  <!-- ServletAPI -->
  <dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>3.1.0</version>
    <scope>provided</scope>
  </dependency>

  <!-- Spring5和Thymeleaf整合包 -->
  <dependency>
    <groupId>org.thymeleaf</groupId>
    <artifactId>thymeleaf-spring5</artifactId>
    <version>3.0.12.RELEASE</version>
  </dependency>
</dependencies>
```

#### 配置web.xml

默认配置方式

### 配置SpringMVC.xml
