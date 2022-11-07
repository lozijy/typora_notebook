# webstorm上传本地项目到github

### 把项目添加到git管理

用命令行 (webstorm 的 Terminal 或者git命令行都可以)
 1、cd 到项目文件夹
 2、初始化本地仓库
 `git init`
 3、把所有文件添加到仓库中
 `git add .` (别忘记后面的点)



### 登录github

![image-20220507200433100](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220507200433100.png)



![image-20220507200619203](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220507200619203.png)

### 本地生成SSH key并添加到github上

我们本地的git仓库和github仓库之间通过ssh加密的，所以我们需要配置验证信息



#### 用git命令行生成密匙

```ruby
 ssh-keygen -t rsa -C "youremail@example.com"
```



![image-20220507195312973](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220507195312973.png)

#### 通过信息找到密匙

我的密匙放置在了C:\Users\34488/.ssh/id_rsa.pub.公共钥匙

![](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220507195807617.png)



#### 在github上配置



![image-20220507201251008](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220507201251008.png)

配置成功

![image-20220507201402564](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220507201402564.png)

### 验证

![image-20220507200117349](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220507200117349.png)

### 项目上传github

![image-20220507201504849](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220507201504849.png)



### 成功

![image-20220507201548880](https://raw.githubusercontent.com/lozijy/github_-/main/image-20220507201548880.png)