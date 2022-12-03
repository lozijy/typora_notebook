## 插入排序

每一次循环:若比这个数大的数有dj个,比较dj+1次 交换dj+2次

![image-20221202203600705](https://raw.githubusercontent.com/lozijy/image/main/image-20221202203600705.png)

-∞是为了防止下标越界，不能是0，

![image-20221202203406151](https://raw.githubusercontent.com/lozijy/image/main/image-20221202203406151.png)

时间复杂度

稳定的算法

可以通过二分排序降低时间复杂度，可以减小比较次数

## 希尔排序

对插入排序的算法

将记录按下标的一定增量分组，对魅族使用直接插入排序算法排序

![image-20221202204818869](https://raw.githubusercontent.com/lozijy/image/main/image-20221202204818869.png)



![image-20221202205201171](https://raw.githubusercontent.com/lozijy/image/main/image-20221202205201171.png)不稳定的算法

增量di的选取:每次从上次增量/2向下取整.

这样的做法是减少交换次数,最后一趟时可能已经非常接近于最终结果了

## 冒泡排序

![image-20221202210548867](https://raw.githubusercontent.com/lozijy/image/main/image-20221202210548867.png)

## 快排



![image-20221202211303321](https://raw.githubusercontent.com/lozijy/image/main/image-20221202211303321.png)

基准;第一个数，一分为二左边都比这个数小，右边的树逗比这个数大

结束:i>=j

辅助空间:log n

不稳定

对n较大的平均情况而言，是内部排序中最快的排序方法，但n很小时，这种排序比其它排序方法还慢

## 选择排序

![image-20221202212211907](https://raw.githubusercontent.com/lozijy/image/main/image-20221202212211907.png)



![image-20221202212224703](https://raw.githubusercontent.com/lozijy/image/main/image-20221202212224703.png)

直接选择排序:![image-20221202212323682](https://raw.githubusercontent.com/lozijy/image/main/image-20221202212323682.png)

不稳定
辅助空间O(1)
简单



