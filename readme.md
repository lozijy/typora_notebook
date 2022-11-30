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





## 11.28想法(已实现)

也许我可以使用gitbook+github设计自己的博客,github上的Push操作会自动更新gitbook上的内容，而这只需要我在根目录下添加一个.gitbook.yaml便可实现两边的连接,这也是我期望达到的效果,详情请看gitbook官方文档[Automatically Generating Content on GitBook with GitHub Actions - The GitBook Blog](https://blog.gitbook.com/learn/tips-and-tricks/automatically-generating-content-on-gitbook-with-github-actions)

![image-20221128172607700](https://raw.githubusercontent.com/lozijy/image/main/image-20221128172607700.png)



## 12.1 一个深思熟虑的plan!

将快遣返，我有了充足的自学时间，然而，充足的时间也往往意味着对时间的不珍惜~~,这是我经历十多个寒暑假的经验得出来的...~~

想要高效利用寒暑假的必要条件是我要有明确的学习目标，切忌诸如"这个寒假做个操作系统","啊啊这个暑假我要学算法，疯狂刷题"之类的泛泛而谈，相反我们要定量定时执行，一个必要的参考条件是在遣返前我用13*2.5 h的时间背完了六级词汇，这是一个重要的参考指标，因为这是我日常可达到的一个在每天占用相当精力的一个任务，这个任务的实现成功有很强的成就感，且完成日期占用少，不会显得过于臃肿，缺点在于长期的学科思维的养成来说效果较差.

不过没关系，

暂时先用这种"暴力学习法"旨在短时间内完成大量工作，因为获得的成就感太高了，且假期时间往往难以坚持训练所谓的"学科思维".



任务制定

我对什么感兴趣?我常常在问自己这个问题,我有点明白了，我感兴趣的不是感兴趣的东西本身，而是学习使用它的成就感，做出题的快乐，完成项目的快乐，"背了好多单词啊我好厉害"的快乐.但目前而言，我感兴趣的有这些:

#### 操作系统

兴趣较强，已有很多了解，不如趁热打铁一锅端了,需要大量前置知识(这里是2个项目都需要的，两个项目不同的单独放在项目后面里面):

c语言,组成原理，操作系统,汇编语言,gdb调试能力,linux操作能力和基本架构知识(进程管理，内存管理，磁盘管理)

计算机组成原理(黑皮),操作系统概念(黑皮)，

- [ ] 我的第一个真正意义上的在硬件上跑的（当然，是在qemu上跑的，毕竟我也不可能真的去拿一块真板子),x86架构下的,面相目标平台i685-elf的操作系统Lonux,需要的特有知识:AT&T汇编语言
- [ ] 6.s081 老lab了，也是我这学期一直在看的，还没搞完，需要的特有知识:

#### 完善笔记

笔记的完善意味着对过去知识的整理和体系化，需要整理的:java,js,c语言，由于已经学过，我期望最短的天数完成，2天一科，共8天吧..

- [ ] java

- [ ] js

- [ ] c

- [ ] 机器学习相关算法

  

#### 完善没做完项目

- [ ] 算法左程云
- [ ] c语言实现各种数据结构

#### 读书

真正需要我读的书籍,一天40页，只会占用2h,和之前背六级的时间差不多，且40页*7=280页，基本一周就能读完一本小书:

- [ ] 操作系统考研书(12章440页)11天
- [ ] CSAPP第3章AT&T汇编语言（110页）2天
- [ ] 汇编语言王爽(x章x页)
- [ ] 机器学习原理，算法和应用 有关卷积神经网络部分
- [ ] book-riscv-rev（12章110页）

#### 课程

我一直想看，但迫于学业压力没看的课程:

- [ ] 6.s081
- [ ] 从零实现一个操作系统Lunaixsky

- [ ] 操作系统王道
- [ ] cmu15 213
- [ ] linux韩顺平
- [ ] linux系统编程李慧琴

#### 刷吉米多维奇

从思想上意识到数学能力的不足，且一时心血来潮的一个目标，看了下有12章1200道题，难度不小，优先级较低，毅力不够可放弃,没人强迫我完成，一切由我决定，我是自己的主宰.

#### 计算机网络

和吉米一样，有所了解但意愿不强，有空再看吧..

#### GRE词汇

和吉米一样，有所了解但意愿不强，有空再看吧..

