List:size(),get(index)

```java
    public int cutOffTree(List<List<Integer>> forest) {
        int m=forest.size();
        int n=forest.get(0).size();
        int now=forest.get(i).get(j);
```

数组

```java
return new int[]{1,2,3};
int[]arr=new int[3];长度必须规定
```

栈:



堆:

堆加比较器实现大根堆，小根堆

```java
class Solution {
    public int minStoneSum(int[] piles, int k) {
    	PriorityQueue<Integer> heap = new PriorityQueue<>(new myComparator());
    } 
}



class myComparator implements  Comparator<Integer>{
    @Override
    public int compare(Integer o1, Integer o2) {
        return o2-o1;
    }
}
```



比较器: