package com.daralisdan.service;

import com.daralisdan.dao.AdminDao;
import com.daralisdan.dao.impl.AdminDaoImpl;
import com.daralisdan.entity.Admin;

import java.util.List;

/**
 * 2019/10/25,Create by yaodan
 */
public class AdminService {
    /**
     * 用户登录
     */
    public String getAll(Admin admin) {
        String rt = "";
        AdminDao admindao = new AdminDaoImpl();
//        List<Admin> list = admindao.selectAll();
        //根据用户名与密码查询，获取用户
        Admin ad = admindao.getAdmin(admin);

//        获取前台的值
//        String name = admin.getAname();
//        String pwd = admin.getApwd();
        if (ad != null) {
            rt = "登录成功";
        } else {
            rt = "用户不存在";
        }

//        //遍历 获取数据库中的值
//        for (Admin admin1 : list) {
//            String aname = admin1.getAname();
//            String apwd = admin1.getApwd();
//            if (StringUtils.isBlank(name) && StringUtils.isBlank(pwd)) {
//                return "登录失败，账号或者密码错误";
//            } else {
//                if (name.equals(aname) && pwd.equals(apwd)) {
//                    return "登录成功";
//                }
//            }
//
//        }
//        System.out.println(name + "   " + pwd);
        return rt;
    }


    /**
     * 根据用户名更新密码
     *
     * @param admin
     * @return
     */
    public String updatePassword(Admin admin) {
        //返回的字符串结果
        String rt = "";
        //调用实现层
        AdminDao admindao = new AdminDaoImpl();
        //根据用户名与密码查询，获取用户
        Admin ad = admindao.getAdmin(admin);

        //判断用户是否存在
        if (ad != null) {
            //判断原密码是否正确
            if (admin.getApwd().equals(ad.getApwd())) {
                //密码正确，进行修改
                ad.setApwd(admin.getNewpwd());
                boolean falg = admindao.updatePassword(ad);
                if (falg) {
                    rt = "修改成功";
                } else {
                    rt = "修改失败";
                }
            } else {
                rt = "原密码错误";
            }
        } else {
            rt = "用户不存在";
        }
        return rt;
    }

    /**
     * 管理员维护，获取管理员所有信息
     *
     * @return
     */
    public List<Admin> getAdminInfo() {
        //调用实现层的查询
        AdminDao admindao = new AdminDaoImpl();
        System.out.println("dao:" + admindao.selectAll());
        return admindao.selectAll();

    }

    /**
     * 根据id删除数据，
     * 传一个id,单个删除
     * 传多个id，批量删除
     *
     * @param
     * @return
     */

    public String delById(String[] ids) {
        String delRt = "";
        //调用实现层的查询
        AdminDao admindao = new AdminDaoImpl();
        boolean delById = admindao.getDelById(ids);
        if (delById) {
            delRt = "删除成功";
        } else {
            delRt = "删除失败";
        }
        return delRt;
    }

    /**
     * 保存管理员维护的数据信息
     * 添加，修改
     *
     * @param admin
     * @return
     */
    public String save(Admin admin) {
        String rt = "";
        AdminDao admindao = new AdminDaoImpl();
        //根据id查询用户
        Integer id = admin.getAid();
        Admin user = admindao.getById(id);
        //判断用户是否存在,不存在添加用户
        if (user == null) {
            boolean in = admindao.insert(admin);
            if (in) {
                rt = "添加成功";
            } else {
                rt = "添加用户失败";
            }
        } else {  //存在修改数据
            user.setAname(admin.getAname());
            user.setApwd(admin.getApwd());
            boolean up = admindao.update(user);
            if (up) {
                rt = "修改成功";
            } else {
                rt = "修改失败";
            }
        }
        return rt;
    }

}