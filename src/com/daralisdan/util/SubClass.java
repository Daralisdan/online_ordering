package com.daralisdan.util;

/**
 * 2019/10/30,Create by yaodan
 */
public class SubClass extends SuperClass {
    static {
        System.out.println("子类静态代码块");
    }

    {
        System.out.println("子类构造代码块");
    }

    public SubClass() {
        System.out.println("子类构造函数");
    }

    public static void main(String[] args) {
        SubClass sb = new SubClass();
        System.out.println("------------");
        SubClass sb1 = new SubClass();
    }
}
