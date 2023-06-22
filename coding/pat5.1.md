### 最近在做PAT习题

```java
//1001害死人不偿命的(3n+1)猜想
/*import java.util.Scanner;

public class jdbc {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        while (in.hasNextInt()) {
            int a = in.nextInt();
            int ans=0;
            while(a!=1){
                if (a%2==0){
                    a/=2;
                    ans++;
                }else {
                    a=(3*a+1)/2;
                    ans++;
                }
            }

            System.out.println(ans );
        }
    }
}*/
//1002写出这个数(未)
//import java.sql.Array;
//import java.util.HashMap;
//import java.util.Scanner;
//
//public class Main {
//    public static void main(String[] args) {
//        Scanner in = new Scanner(System.in);
//        String [] nums= new String[10];
//
//        nums[0]="yi";
//        nums[1]="er";
//        nums[2]="san";
//        nums[3]="si";
//        nums[4]="wu";
//        nums[5]="liu";
//        nums[6]="qi";
//        nums[7]="ba";
//        nums[8]="jiu";
//        nums[9]="shi";
//        HashMap<String, String> Map = new HashMap<>();
//        Map.put("0","yi");
//
//        while (in.hasNextInt()) {
//            String a= String.valueOf(in.nextInt());
//            String[] strings = new String[a.length()];
//            for (int i = 0; i < a.length(); i++) {
////                strings[i]=a.indexOf(i);
//            }
//        }
//
//
//
//    }
//}

//1004成绩排名
//    import java.util.Scanner;
//
//    public class Main {
//        public static void main(String[] args) {
//            Scanner in = new Scanner(System.in);
//            int n=in.nextInt();
//            if(n==1){
//                String name = in.next();
//                String grade=in.next();
//                System.out.println(name+" "+grade);
//                System.out.println(name+" "+grade);
//                return;
//            }
//            //定义两个最小数字
//            int min=Integer.MAX_VALUE;
//            int max=Integer.MIN_VALUE;
//            //保存极值成绩对应的name和num
//            String minName=null;
//            String maxName=null;
//            String minNum=null;
//            String maxNum=null;
//            while(n-->0){
//                //循环保存每次输入的name和num，循环之后被销毁
//                String Name = in.next();
//                String Num=in.next();
//                //成绩
//                int next=in.nextInt();
//                if(next<min){
//                    min=next;
//                    minName=Name;
//                    minNum=Num;
//                }else if(next>max){
//                    max=next;
//                    maxName=Name;
//                    maxNum=Num;
//                }
//            }
//            System.out.println(maxName+" "+maxNum);
//            System.out.println(minName+" "+minNum);
//            in.close();
//            }
//    }


/*
1006换个格式输出整数
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int s = in.nextInt();
        int ge=s%10;
        int shi=s/10%10;//int (s-s%10)/10有点问题
        int bai=s/100;
        String ans="";
        for (int i = 0; i < bai; i++) {
            ans+="B";
        }
        for (int i = 0; i < shi; i++) {
            ans+="S";
        }
        for (int i = 1; i < ge+1; i++) {
            ans+=i;
        }
        System.out.println(ans);
    }
}*/

import java.awt.*;

//1009说反话(未)
/*
1011A+B 和C
注意2147483647 0 2147483646
数字越界,用long解决
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int count=0;
        int temp=0;
        while(in.hasNext()){
            count+=1;
        }
        String[] chars = new String[count];
        for (int i = 0; i < count; i++) {
            chars[i]="0";
        }
        while (in.hasNext()){
            String next = in.next();
            chars[count-temp]=next;
            temp+=1;
        }
        in.close();
        for (int i = 0; i < count; i++) {
            System.out.println(chars[i]);
        }
    }
}*/
/*
//难点在于如何把几个int类型的数字加起来得到float
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int num = in.nextInt();
        ArrayList<Integer> ints = new ArrayList<Integer>();
        int a = 0,b=0,c=0,e=0;
        float d=0;
        //解决a
        if(num%5==0){
            a+=num;
        }else
        //解决b
        if(num%5==1){
            ints.add(num);
        }
        for (int i = 0; i < ints.size(); i++) {
            if(i%2==0){
                b-=ints.get(i);
            }else{
                b+=ints.get(i);
            }
        }
        //解决c
        if(num%5==2){
            c+=1;
        }
        //解决d?

        //解决e
        if(num%5==4){
            if(num>e){
                e=num;
            }
        }
        System.out.println(a+" "+b+" "+c+" "+d+" "+e);



    }
    }



*/
/*//1008数组元素右移问题
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int num1 = in.nextInt();
        int num2=in.nextInt();
        String str="";
        int[] arr=new int[num1];
        for (int i = 0; i < num1; i++) {
            int num=in.nextInt();
            arr[i]=num;
        }
        int[]ans=new int[num1];
        for (int i = num1-1; i >num2-1; i--) {
            ans[i]=arr[i-num2];
        }
        for (int i = 0; i < num2; i++) {
            ans[i]=arr[i+num1-num2];
        }
        for (int i = 0; i < num1; i++) {
            str+=ans[i];
            if(i<num1-1){
            str+=" ";}
        }

        System.out.println(str);

    }
}*/
//不允许使用另外的数组
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);


    }
```