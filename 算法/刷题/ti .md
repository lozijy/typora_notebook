1.鞍点



```java

```

2.a+b

```java
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String s1 = scanner.next();
        String s2=scanner.next();
        int[] int1 = new int[s1.length()];
        int[]   int2=new int[s2.length()];
        int big=Math.max(int1.length, int2.length);
        int[] ans=new int[big];
        int cur=0;
        int pre=0;
        int cur1=0;
        int small= Math.min(int1.length, int2.length);
        int p1=small-1;
        int p2=big-1;
        String longger=s1.length()>= s2.length()?s1:s2;
        String shourter=longger==s1?s2:s1;
        while(p1>=0){
            int i = Character.getNumericValue(shourter.charAt(p1)) + Character.getNumericValue(longger.charAt(p2));
            cur= cur1+i >=10?1:0;
            pre= cur1+i -cur*10;
            ans[p2]=pre;
            p1--;
            p2--;
            cur1=cur;
        }
        while(p2>=0){
            int j=Character.getNumericValue(longger.charAt(p2));
            cur= cur1+j >=10?1:0;
            pre= cur1+j -cur*10;
            ans[p2]=pre;
            p2--;
        }
        for (int i = 0; i < big; i++) {
            System.out.print(ans[i]);
        }
    }
}
```

3.提取数字串

```java


```



4.校门外的树

```java
public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int L = scanner.nextInt();
    int M=scanner.nextInt();
    int ans=L+2;
    for (int i = 0; i < M; i++) {
        int start=scanner.nextInt();
        int end=scanner.nextInt();
        ans-=(end-start+1);
    }
    System.out.println(ans);
}
```



5.总花费

```
public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int n = scanner.nextInt();
    int ans=0;
    int preTime=0;
    int price0=0;
    int count=0;
    for (int i = 0; i < n; i++) {
        int type=scanner.nextInt();
        int price=scanner.nextInt();
        int newTime=scanner.nextInt();
        if(type==0){
            ans+=price;
            price0=price;
            count++;
        }
        if(type==1){
            if(price<price0){
                count--;
            }
            else {
                ans+=price;
            }
        }
        preTime=newTime;
    }
    System.out.println(ans);
}
    }
```