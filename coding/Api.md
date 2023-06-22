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
    Arrays.stream(dp).sum()将数组中所有的数相加
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



红黑树:

```java
        TreeMap<Integer, Integer> treeMap = new TreeMap<>();
		//放入键值对
		treeMap.put(1,2);
		//返回大于给定键的最小键
		treeMap.floorKey(K key);
		//返回小于给定键的最大键
		treeMap.ceilingKey(K key);
```



类型转换:

“int 变为 char 一种是自动转换,如char c = 97,会自动的将int类型的96转换成char的‘a’

String转int:在Java 中要将 String 类型转化为 int 类型时,需要使用 Integer 类中的 parseInt() 方法或者 valueOf() 方法进行转换.

char转int:

Character.getNumericValue()

String转int:

Integer.valueOf()







Character:

```java
Character.isDigit;
Character.isAl

    
```

String:

检查字符串是否为空格

```java
String ans="1,23,";
ans.splite("")
ans.isBlank();
```

