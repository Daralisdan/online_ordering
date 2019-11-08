package com.daralisdan.entity;

/**
 * 2019/10/29,Create by yaodan
 */
public class AdminUser {
    private Integer uid;
    private String uName;
    private String uPwd;
    private String uRealName;
    private String uAddress;
    private String uSex;
    private String uTel;
    private String uEmail;
    private Integer uqq;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPwd() {
        return uPwd;
    }

    public void setuPwd(String uPwd) {
        this.uPwd = uPwd;
    }

    public String getuRealName() {
        return uRealName;
    }

    public void setuRealName(String uRealName) {
        this.uRealName = uRealName;
    }

    public String getuAddress() {
        return uAddress;
    }

    public void setuAddress(String uAddress) {
        this.uAddress = uAddress;
    }

    public String getuSex() {
        return uSex;
    }

    public void setuSex(String uSex) {
        this.uSex = uSex;
    }

    public String getuTel() {
        return uTel;
    }

    public void setuTel(String uTel) {
        this.uTel = uTel;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public Integer getUqq() {
        return uqq;
    }

    public void setUqq(Integer uqq) {
        this.uqq = uqq;
    }

    @Override
    public String toString() {
        return "AdminUser{" +
                "uid=" + uid +
                ", uName='" + uName + '\'' +
                ", uPwd='" + uPwd + '\'' +
                ", uRealName='" + uRealName + '\'' +
                ", uAddress='" + uAddress + '\'' +
                ", uSex='" + uSex + '\'' +
                ", uTel='" + uTel + '\'' +
                ", uEmail='" + uEmail + '\'' +
                ", uqq=" + uqq +
                '}';
    }
}
