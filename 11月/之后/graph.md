### 图

### 图的基本概念

非线性结构，对节点的前驱和后继不做限制



图论的起源

![image-20221111195113915](https://raw.githubusercontent.com/lozijy/image/main/image-20221111195113915.png)

欧拉图,欧拉回路:能遍历所有点并回到起点，欧拉通路:弱欧拉回路,能遍历所有点但不能回到起点

和树相比的特点:不一定有一个根节点,，无明显的父子关系，从一个顶点到另一个顶点可能有多条(0条)路径.

分为有向图,无向图,(V,E)V是G的顶点集合，是有穷集合，E是G的编辑和，是有穷集。

完全图:区别有向完全图和无向完全图,n(n-1)/2和n(n-1)条边

![image-20221111202351022](https://raw.githubusercontent.com/lozijy/image/main/image-20221111202351022.png)

子图:生成子图:节点数和母图一样,导出子图

带权图:边上带权的图weight

路径:在图G=(V,E)中，若从顶点vi出发，沿

路径长度:非带权图的路径长度是路径上边的长度，带权图的路径长度是路径上各边全之和。

简单路径:路径上各顶点互相不重复。

回路

连通图，任意一对顶点都是连通的则称为连通图，非连通图的极大连通子图叫连通分量。

强连通图:有向图中,对每一对都有vi到vj和vj到vi

![image-20221111203340418](https://raw.githubusercontent.com/lozijy/image/main/image-20221111203340418.png)



![image-20221111203510087](https://raw.githubusercontent.com/lozijy/image/main/image-20221111203510087.png)

有向图中，节点的度等于入度和出度之和

邻接节点:一对from和to

简单回路:点不能重复,基本回路:

![image-20221111205658807](https://raw.githubusercontent.com/lozijy/image/main/image-20221111205658807.png)

在树里面6,7分别为大儿子，二儿子

### 图的存储结构和类定义



注意区别权图和非权图,无向图和有向图

#### 邻接矩阵

![image-20221111210135131](https://raw.githubusercontent.com/lozijy/image/main/image-20221111210135131.png)

因为他是对称矩阵，所以我们只需要存储一个三角矩阵就行了，共n*(n+1)/2个节点.



![image-20221111211517009](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111211517009.png)



![image-20221111211705300](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111211705300.png)



 无向图![image-20221111212006880](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111212006880.png)

有向图

![image-20221111212337316](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111212337316.png)

#### 邻接表

有向邻接表,好求出度，不太好求入度需要遍历一次,

我们用一个逆邻接表，存储指向他的邻居



![image-20221111212616253](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111212616253.png)

![image-20221111212748426](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111212748426.png)



![image-20221111212853183](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111212853183.png)

### 图的遍历算法

从某一顶点出发遍历图中所有顶点，且每个顶点仅被访问一次，是图的基本运算

基本运算:遍历，查找，排序

图的特点是图可能存在回路，因此遍历时可能回到曾经访问过的顶点

解决思路，可设置一个辅助数组visited[n]标记每个被访问过的顶点，它的初始状态是0，被访问，就改成1(我更倾向于用HashSet)

#### 深度优先DFS

优先访问它的邻居，然后是邻居的邻居..

通过标记，防止出现重复节点

通过一个栈实现回到从前

##### 步骤

![image-20221125195008159](https://raw.githubusercontent.com/lozijy/image/main/image-20221125195008159.png)

##### 递归实现

![image-20221125195204564](https://raw.githubusercontent.com/lozijy/image/main/image-20221125195204564.png)



![image-20221125195348950](https://raw.githubusercontent.com/lozijy/image/main/image-20221125195348950.png)

有n个顶点，e条边

邻接表：扫描边的时间复杂度:O(e),遍历的时间复杂度O(n+e)

邻接矩阵:扫描边的时间复杂度O(n)遍历总时间复杂度O(n方)

#### 广度优先BFS

找邻居，然后找所有邻居的所有邻居

如果用邻接表:O(n+e)

邻接矩阵:O(n方)

### 拓扑排序

#### AOV网

有向图中的顶点叫活动，弧表示活动之间的优先关系，这样的有向图叫AOV网

从i到j有一条有向路径，则i是j 的前驱

AOV网是有向无环图

常用来表示流程的若干阶段，由一个活动引发若干并行的活动

重复直到空:选一个没有前驱的节点，放在排序中，在图中去掉顶点，再去掉该顶点所有出弧

#### 拓扑排序

有集合上的一个偏序得到集合上的一个全序

偏序:关系R是自反的，反对称的和传递的(小于)

全序:关系是自反的，对称的和传递的(等于)

偏序与部分有序，全序是全部有序

#### 算法

![image-20221125204451585](https://raw.githubusercontent.com/lozijy/image/main/image-20221125204451585.png)

输出结果不唯一

![image-20221125204826914](https://raw.githubusercontent.com/lozijy/image/main/image-20221125204826914.png)



#### 应用:判断图中是否有环

![image-20221125205031714](https://raw.githubusercontent.com/lozijy/image/main/image-20221125205031714.png)

#### 伪代码



### 关键路径:起点到目标点的最长路径(难)

#### AOE网

边表示活动的网，是带权的有向无环图

顶点代表事件，弧表示活动，权表示持续时间

#### 算法

![image-20221125205331561](https://raw.githubusercontent.com/lozijy/image/main/image-20221125205331561.png)



![image-20221125205908175](https://raw.githubusercontent.com/lozijy/image/main/image-20221125205908175.png)



![image-20221125210407721](https://raw.githubusercontent.com/lozijy/image/main/image-20221125210407721.png)

![image-20221125211048690](https://raw.githubusercontent.com/lozijy/image/main/image-20221125211048690.png)





关键路径答案也不唯一



#### 算法实现

![image-20221125211239387](https://raw.githubusercontent.com/lozijy/image/main/image-20221125211239387.png)

时间复杂度o(n+e)

### 最短路径问题:起点到目标点的最短路径

#### 交通运输网

顶点表示城市，边表示交通联系，权表示线路的长度或花费的时间或费用等

#### Dijkstra迪杰斯特拉算法

他能

是一种标号法，

![image-20221125211909333](https://raw.githubusercontent.com/lozijy/image/main/image-20221125211909333.png)

把V分成两组:

S已求出最短路径的顶点的集合

V-S尚未确定最短路径的顶点的集合

将T中顶点按最短路径递增的次序加入到S中，加入后由把所有下一个节点找到，再按递增的顺序排序，最短的加到固定的集合里面

贪婪算法greedy algorith



#### FLOYD弗洛伊德算法







### 最小支持树

#### prim

#### krusal

### 图的应用