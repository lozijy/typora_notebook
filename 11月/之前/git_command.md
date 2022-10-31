There is some command you should know:



```shell
git clone git://g.csail/mit.edu/xv6-labs-2021
```

```shell
git init
```

```shell
cat .git/config [core]
```

which display the basic content about the git:

```shell
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = git://g.csail.mit.edu/xv6-labs-2020
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master

```

we can use the command:

```shell
git remote add github https://github.com/lozijy/6.s081-project
```

let's see what hanpended:

```shell
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = git://g.csail.mit.edu/xv6-labs-2020
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
[remote "github"]
	url = https://github.com/lozijy/6.s081-project
	fetch = +refs/heads/*:refs/remotes/github/*
```

**git push** 命令用于从将本地的分支版本上传到远程并合并。 

```shell
git push <远程主机名> <本地分支名>:<远程分支名>
```



git commit

```shell
git commit -m "添加到远程"
```

```shell
git config user.name "sodacan"
git config user.email "123@163.com"
```

.git is  tranquilty for user!

```shell
git states
```

**git add** 命令可将该文件添加到暂存区

添加当前目录下的所有文件到暂存区：

```shell
git add .
```





前面章节我们使用 git add 命令将内容写入暂存区。

git commit 命令将暂存区内容添加到本地仓库中。

提交暂存区到本地仓库中:

```shell
git commit -m [message]
```

```shell
git pull 下载远程代码并合并
```

```shell
git push 上传远程代码并合并
```



### 本地库





### 远程库

创建远程仓库

创建别名

git remote -v

git remote add github  https://github.com/lozijy/6.s081-project.git

git push github main失败

git push -u github util:main 本地有分支，远程仓库也有分支，这个指令可以让本地的util分支提交到github别名的main分支里面，失败，原因是虚拟机不能ping域名只能ping ip,所以ping github.com失败了



解决一下,参考codesheep视频

2.博客

nameserver 127.0.0.53

vim撤销:u

是wq!而不是!wq

不知道什么情况，能ping百度了，也能push了，但是还是之前的报错:

![image-20221024155513483](D:\AppData\Typora\typora-user-images\image-20221024155513483.png)

这里的原因是自从 21 年 8 月 13 后不再支持用户名密码的方式验证了，需要创建个人访问令牌



![image-20221024155812029](D:\AppData\Typora\typora-user-images\image-20221024155812029.png)

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



> ## For a Linux-based OS [⤴](https://git-scm.com/docs/git-credential-cache)
>
> For Linux, you need to configure the local GIT client with a username and email address,
>
> ```
> $ git config --global user.name "your_github_username"
> $ git config --global user.email "your_github_email"
> $ git config -l
> ```
>
> Once GIT is configured, we can begin using it to access GitHub. Example:
>
> ```
> $ git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
> > Cloning into `YOUR-REPOSITORY`...
> Username: <type your username>
> Password: <type your password or personal access token (GitHub)
> ```
>
> Now cache the given record in your computer to remembers the token:
>
> ```
> $ git config --global credential.helper cache
> ```
>
> If needed, anytime you can delete the cache record by:
>
> ```
> $ git config --global --unset credential.helper
> $ git config --system --unset credential.helper
> ```
>
> Now try to pull with `-v` to verify
>
> ```
> $ git pull -v
> ```



吐了，还是不行，整了一个小时了

![image-20221024162050650](D:\AppData\Typora\typora-user-images\image-20221024162050650.png)

```shell
Hi All,
Issue is resolved now. This was happening because I was behind a corporate proxy. I used below commnad to resolve the issue

git config --global http.proxy http://proxyuser:proxypwd@proxy.server.com:8080

Thanks
```



success

1.use the physical direction

2.reboot the terminal
