package com.daralisdan.util;

/**
 * 2019/10/30,Create by yaodan
 */
public class SuperClass {
    static {
        System.out.println("父类静态代码块");
    }

    {
        System.out.println("父类构造代码块");
    }

    public SuperClass() {
        System.out.println("父类构造函数");
    }
}
