package com.daralisdan.dao.impl;


import com.daralisdan.dao.AdminDao;
import com.daralisdan.entity.Admin;
import com.daralisdan.util.JDBC;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 2019/10/25,Create by yaodan
 */
public class AdminDaoImpl implements AdminDao {
    /**
     * 查询数据库所有数据
     *
     * @return
     */
    @Override
    public List<Admin> selectAll() {
        String sql = "SELECT aid,aname,apwd FROM t_admin ";
        ResultSet select = JDBC.query(sql);
        List<Admin> lists = new ArrayList<>();
        try {
            while (select.next()) {
                Admin admin = new Admin();
                admin.setAid(select.getInt("aid"));
                admin.setAname(select.getString("aname"));
                admin.setApwd(select.getString("apwd"));
                lists.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lists;
    }

    /**
     * 根据用户名，密码查询用户
     *
     * @param admin
     * @return
     */
    @Override
    public Admin getAdmin(Admin admin) {
        Admin a = null;
        String execSQL = "select * from t_admin ta where 1=1 and ta.aname= '" + admin.getAname() + "' and ta.apwd='" + admin.getApwd() + "'";
        ResultSet query = JDBC.query(execSQL);
        try {
            if (query.next()) {
                a = admin;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }

    /**
     * 根据用户名，密码修改数据
     *
     * @param ad
     * @return
     */
    @Override
    public boolean updatePassword(Admin ad) {
        boolean rt = false;
        String execSQL = "update t_admin set apwd ='" + ad.getApwd() + "' where aname='" + ad.getAname() + "'";
        int i = JDBC.update(execSQL);
        if (i > 0) {
            rt = true;
        }
        return rt;
    }

    /**
     * 根据id删除数据，
     * 传一个id,单个删除
     * 传多个id，批量删除
     *
     * @return //
     */
    @Override
    public boolean getDelById(String[] ids) {
        boolean a = false;
        //定义一个可变长度的字符串
        StringBuffer sbIds = new StringBuffer();
        for (int i = 0; i < ids.length; i++) {
            //遍历ids数组，把数组中对象变成以逗号分隔的字符串
            sbIds.append(ids[i]);
            //判断数组是否是最后一个对象，如果不是，在后面添加逗号分隔
            if (i < ids.length - 1) {
                sbIds.append(",");
            }
        }
        String exeSQL = "DELETE FROM t_admin where aid in (" + sbIds + ")";
        int del = JDBC.update(exeSQL);
        if (del > 0) {
            a = true;
        }
        return a;
    }

    /**
     * 根据id查询用户
     *
     * @param
     */
    @Override
    public Admin getById(Integer id) {
        Admin ad = null;
        String exeSQL = "SELECT * FROM t_admin WHERE 1=1 AND aid=" + id;
        ResultSet query = JDBC.query(exeSQL);
        try {
            if (query.next()) {
                ad = new Admin();
                ad.setAid(id);
                ad.setAname(query.getString("aname"));
                ad.setApwd(query.getString("apwd"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ad;
    }

    /**
     * 添加用户信息
     *
     * @param
     * @return
     */
    @Override
    public boolean insert(Admin user) {
        boolean rt = false;
        String exeSQL = "INSERT INTO t_admin(aid,aname,apwd) VALUES (?,?,?)";
        int u = JDBC.update(exeSQL, user);
        if (u > 0) {
            rt = true;
        }
        System.out.println("添加的数据：==================");
        return rt;
    }

    /**
     * 修改用户信息
     *
     * @param
     * @return
     */
    @Override
    public boolean update(Admin admin) {
        boolean rt = false;
        String exeSQL = "UPDATE t_admin SET aname='"+admin.getAname()+"',apwd='"+admin.getApwd()+"' WHERE aid=" + admin.getAid();
        int u = JDBC.update(exeSQL);
        if (u > 0) {
            rt = true;
        }
        System.out.println("修改的数据：==================");
        return rt;
    }

}
