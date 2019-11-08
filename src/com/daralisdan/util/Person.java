package com.daralisdan.util;

/**
 * 2019/10/30,Create by yaodan
 */
public class Person {
    //执行顺序：静态代码块>构造代码块>构造函数>普通代码块　
    //继承时：先调用父类的静态资源，在执行父类中的静态资源，再看父类中的构造代码块
    //方法中不能存在静态代码块，在类被加载时，就运行，优先于构造函数与其他代码块
//    静态代码块内容先执行，接着执行父类构造代码块和构造方法，然后执行子类构造代码块和构造方法。
    static {
        System.out.println("静态代码块");
    }

    //优先于构造函数加载，调用时必须实例化
    {
        System.out.println("构造代码块");
    }

    public Person() {
        System.out.println("无参构造器");
    }

    public Person(String str) {
        System.out.println("有参构造器");
    }

    //普通代码块在方法中，构造函数在类中
    public void student() {
        System.out.println("普通代码块");
    }

    public static void main(String[] args) {

    }
}
