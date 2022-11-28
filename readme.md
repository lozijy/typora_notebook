# typora_notebook
使用typora+git+github实现笔记云同步，方便搭配博客使用
~~本人已明确了终身学习的目标并坚定的执行下去，坚持"日拱一卒"的持续成长型学习思想。~~

为了贯彻落实这个理念，一个终生成长的个人知识库是必要的。

在尝试多种形式后，本人决定做一个最简单的typora+git+github形式的个人知识库，

好处是实现了ipad+pc+移动端多端共享的云端仓库，并且可拓展性很高，利于我们从源码上进行多种拓展.

后期目标,学业压力很大,暂时不搞:

- [ ] 待时机成熟，本人将会用一个服务器在域名为www.lozijy.top的网站上动态展示自己的个人知识库.
- [x] 使用typora+picgo+github实现图片自动远程存储
- [x] 做一个简易脚本实现git自动push



## 11.27感悟

这样的一个终生成长的个人知识库往往能进一步见证过去的自身的无知和幼稚.我于2022.11.27日对个人知识库进行了一个arrangement，于是亲眼目睹了这个知识库在4~5月份刚刚创立时结构肉眼可见的混乱以及知识的极度零散性，对过去输出内容的collective arrangement是痛苦的，因为你常常难以辨别过去写的东西中哪些是有用的哪些是无用的，哪些是成体系的，而哪些是零散的。



我的解决方案是，当月的知识集中放在一个名为xx月的文件夹中，在月末再进行collective arrangement,放入所属知识内容时要标上日期.大概如此..

~~In my hand ,is a pen that will write a poem of me and you.~~



## 11.28想法

也许我可以使用gitbook+github设计自己的博客,github上的Push操作会自动更新gitbook上的内容，而这只需要我在根目录下添加一个.gitbook.yaml便可实现两边的连接,这也是我期望达到的效果,详情请看gitbook官方文档[Automatically Generating Content on GitBook with GitHub Actions - The GitBook Blog](https://blog.gitbook.com/learn/tips-and-tricks/automatically-generating-content-on-gitbook-with-github-actions)

![image-20221128172607700](https://raw.githubusercontent.com/lozijy/image/main/image-20221128172607700.png)





- [x] Enabling GitHub Sync

# Enabling GitHub Sync



## 1. Get Started

In the space you want to sync with your GitHub repo, head to the space menu in the top right, and select **synchronize with Git**. From the provider list, select **GitHub**, and click **configure**.

![img](https://2775338190-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FNkEGS7hzeqa35sMXQZ4X%2Fuploads%2FpP9peXHm2mxXU2jxgdwy%2FGitHub%20sync.png?alt=media&token=fb91dee3-e3b4-451c-a839-eb27e7af8b19)

Choose GitHub as your Git provider

## 2. Authenticate with GitHub

If you're setting up GitHub sync for the first time and haven't already linked a GitHub account, you'll be prompted to do that when you begin configuring Git Sync. If you've already linked your account, you might still need to authenticate via GitHub.

## 3. Install the GitBook app to your GitHub account

![img](https://2775338190-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FNkEGS7hzeqa35sMXQZ4X%2Fuploads%2F1gtGeVzz3J7209hwzZ4m%2FGitHub%20authentication.png?alt=media&token=cf1df338-8dd0-4f3c-aeb0-471a24cf51bd)

Authenticate your GitHub account to connect with GitHub

If you've not already done so, you'll be prompted to add the GitBook app to your GitHub account. Follow the instructions in the GitHub popover and either give GitBook specific repo permissions, or allow access to all repositories, depending on your needs.

## 4. Select a repository and branch

Select the account and repository you want to keep in sync with your GitBook content.



**Can't see your repository?** If you can't find your repository in the list, make sure that you've installed the GitBook GitHub app in the right scope (i.e. your personal account or the GitHub org where the repository lives) and that you've configured the correct repository access in the GitBook GitHub app.

Once you've selected the correct repository, choose which branch you want commits to be pushed to and synced from.

![img](https://2775338190-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FNkEGS7hzeqa35sMXQZ4X%2Fuploads%2F0Z1CqYbhjOcCULhhaWnz%2FSynchronize%20with%20Git.png?alt=media&token=1b9a84f7-5dce-4bb2-8a2c-3078f0882127)

Choose your GitHub repository and branch

## 5. Perform an initial sync

When syncing for the first time, you'll have the option to sync in one of two directions:

1. 1.

   Git**Book** -> Git**Hub** will sync your space's content **to** the selected branch. This is great if you're starting from an empty repository and want to get your GitBook content in quickly.

2. 2.

   Git**Hub** -> Git**Book** will sync your space's content **from** the selected branch. This is great if you have existing markdown content in a repository and want to bring it into GitBook.

## 6. Write and commit!

You're good to go. You'll notice that if your space was in [live edit](https://docs.gitbook.com/getting-started/collaboration/live-edits) mode, it's now locked for live edits. This allows us to reliably sync content to your repository when[ change requests](https://docs.gitbook.com/getting-started/collaboration/change-requests) are merged in GitBook, rather than the constant noise of trying to sync live edits!

When you edit on GitBook, every change request merge will result in a commit to your selected GitHub branch.

When you commit to GitHub, every commit will be synced to your GitBook space.





