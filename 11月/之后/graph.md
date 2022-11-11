### 图

#### 图的基本概念

非线性结构，对节点的前驱和后继不做限制



图论的起源

![image-20221111195113915](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111195113915.png)

欧拉图,欧拉回路:能遍历所有点并回到起点，欧拉通路:弱欧拉回路,能遍历所有点但不能回到起点

和树相比的特点:不一定有一个根节点,，无明显的父子关系，从一个顶点到另一个顶点可能有多条(0条)路径.

分为有向图,无向图,(V,E)V是G的顶点集合，是有穷集合，E是G的编辑和，是有穷集。

完全图:区别有向完全图和无向完全图,n(n-1)/2和n(n-1)条边

![image-20221111202351022](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111202351022.png)

子图:生成子图:节点数和母图一样,导出子图

带权图:边上带权的图weight

路径:在图G=(V,E)中，若从顶点vi出发，沿

路径长度:非带权图的路径长度是路径上边的长度，带权图的路径长度是路径上各边全之和。

简单路径:路径上各顶点互相不重复。

回路

连通图，任意一对顶点都是连通的则称为连通图，非连通图的极大连通子图叫连通分量。

强连通图:有向图中,对每一对都有vi到vj和vj到vi

![image-20221111203340418](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111203340418.png)



![image-20221111203510087](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111203510087.png)

有向图中，节点的度等于入度和出度之和

邻接节点:一对from和to

简单回路:点不能重复,基本回路:

![image-20221111205658807](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111205658807.png)

在树里面6,7分别为大儿子，二儿子

#### 图的存储结构和类定义

注意区别权图和非权图,无向图和有向图

邻接矩阵

![image-20221111210135131](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111210135131.png)

因为他是对称矩阵，所以我们只需要存储一个三角矩阵就行了，共n*(n+1)/2个节点.



![image-20221111211517009](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111211517009.png)



![image-20221111211705300](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111211705300.png)



 无向图![image-20221111212006880](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111212006880.png)

有向图

![image-20221111212337316](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111212337316.png)

有向邻接表,好求出度，不太好求入度需要遍历一次,

我们用一个逆邻接表，存储指向他的邻居



![image-20221111212616253](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111212616253.png)

![image-20221111212748426](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111212748426.png)



![image-20221111212853183](C:\Users\lonux\AppData\Roaming\Typora\typora-user-images\image-20221111212853183.png)



#### 图的遍历算法

#### 拓扑排序
#### 关键路径:起点到目标点的最长路径(难)

#### 最短路径问题:起点到目标点的最短路径

弗洛伊德算法

#### 最小支持树

prim,krusal

#### 图的应用