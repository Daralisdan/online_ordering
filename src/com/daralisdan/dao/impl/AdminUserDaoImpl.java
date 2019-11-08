package com.daralisdan.dao.impl;

import com.daralisdan.dao.AdminUserDao;
import com.daralisdan.entity.AdminUser;
import com.daralisdan.util.JDBC;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 2019/10/29,Create by yaodan
 */
public class AdminUserDaoImpl implements AdminUserDao {
    /**
     * 查询所有会员信息
     *
     * @return
     */
    @Override
    public List<AdminUser> getAdminUser() {
        String exeSQL = "SELECT * FROM t_user ";
        ResultSet resultSet = JDBC.query(exeSQL);
        System.out.println(resultSet);
        List<AdminUser> list = new ArrayList<>();

        try {
            while (resultSet.next()) {
                AdminUser adminUser = new AdminUser();
                adminUser.setUid(resultSet.getInt("uid"));
                adminUser.setuName(resultSet.getString("uName"));
                adminUser.setuPwd(resultSet.getString("uPwd"));
                adminUser.setuRealName(resultSet.getString("uRealName"));
                adminUser.setuAddress(resultSet.getString("uAddress"));
                adminUser.setuSex(resultSet.getString("uSex"));
                adminUser.setuTel(resultSet.getString("uTel"));
                adminUser.setuEmail(resultSet.getString("uEmail"));
                adminUser.setUqq(resultSet.getInt("uqq"));
                list.add(adminUser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("AdminUserDaoImpl:" + list);
        return list;
    }

    /**
     * 根据id删除数据，
     * 传一个id,单个删除
     * 传多个id，批量删除
     *
     * @param ids
     * @return
     */
    @Override
    public boolean delById(String[] ids) {
        boolean rt = false;
        //把数组对象存入以逗号分隔的字符串中
//        StringBuffer sb=new StringBuffer();
//        for (int i=0;i<ids.length;i++){
//            sb.append(ids[i]);
//            if(i<ids.length-1){
//            sb.append(",");
//            }
//        }
        for (int i = 0; i < ids.length; i++) {
            String exeSQL = "DELETE FROM t_user WHERE uid=" + ids[i];
            int up = JDBC.update(exeSQL);
            if (up > 0) {
                rt = true;
            }
        }
        return rt;
    }

    /**
     * 根据id查询用户
     *
     * @param
     * @return
     */
    @Override
    public AdminUser getById(Integer id) {
        AdminUser u = null;
        String exeSQL = "SELECT * FROM t_user WHERE uid=" + id;
        ResultSet query = JDBC.query(exeSQL);
        try {
            if (query.next()) {
                u = new AdminUser();
                u.setUid(id);
                u.setuName(query.getString("uName"));
                u.setuPwd(query.getString("uPwd"));
                u.setuRealName(query.getString("uRealName"));
                u.setuAddress(query.getString("uAddress"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    /**
     * 添加数据
     *
     * @param adminUser
     * @return
     */
    @Override
    public boolean insert(AdminUser adminUser) {
        boolean rt = false;
        String exeSQL = "INSERT INTO t_user(uid,uName,uPwd,uRealName,uAddress)" +
                " VALUES (" + adminUser.getUid() + ",'" + adminUser.getuName() + "','" + adminUser.getuPwd() + "','" +
                adminUser.getuRealName() + "','" + adminUser.getuAddress() + "')";
        int u = JDBC.update(exeSQL);
        if (u > 0) {
            rt = true;
        }
        System.out.println("添加的数据：==================");
        return rt;
    }

    /**
     * 修改数据
     *
     * @param adminUser
     * @return
     */
    @Override
    public boolean update(AdminUser adminUser) {
        boolean rt = false;
        String exeSQL = "UPDATE t_user SET uName='" + adminUser.getuName() + "',uPwd='" + adminUser.getuPwd() + "',uRealName='" + adminUser.getuRealName() + "',uAddress='" + adminUser.getuAddress() + "'  WHERE uid=" + adminUser.getUid();
        int u = JDBC.update(exeSQL);
        if (u > 0) {
            rt = true;
        }
        System.out.println("修改的数据：==================");
        return rt;
    }


}

