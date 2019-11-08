package com.daralisdan.service;

import com.daralisdan.dao.AdminUserDao;
import com.daralisdan.dao.impl.AdminUserDaoImpl;
import com.daralisdan.entity.AdminUser;

import java.util.List;

/**
 * 2019/10/29,Create by yaodan
 */
public class AdminUserService {
    /**
     * 显示所有会员用户
     *
     * @return
     */
    public List<AdminUser> getUserList() {
        //调用实现层
        AdminUserDao userdao = new AdminUserDaoImpl();
        //查询到的数据
        return userdao.getAdminUser();

    }

    /**
     * 根据用户id删除会员信息
     *
     * @param ids
     * @return
     */
    public String delById(String[] ids) {
        String rt = "";
        //调用实现层
        AdminUserDao userdao = new AdminUserDaoImpl();
        boolean del = userdao.delById(ids);
        if (del) {
            rt = "删除成功";
        } else {
            rt = "删除失败";
        }
        return rt;
    }

    /**
     * 保存会员信息
     * 增加，修改
     *
     * @param adminUser
     * @return
     */
    public String save(AdminUser adminUser) {
        String rt = "";
        //调用实现层
        AdminUserDao userdao = new AdminUserDaoImpl();
        //根据id查询用户，判断用户是否存在，不存在则添加，存在就修改
        //根据id查询用户
        Integer id = adminUser.getUid();
        AdminUser user = userdao.getById(id);
        if (user == null) {
            boolean add = userdao.insert(adminUser);
            if (add) {
                rt = "添加成功";
            } else {
                rt = "添加失败";
            }
        } else {
            user.setuName(adminUser.getuName());
            user.setuPwd(adminUser.getuPwd());
            user.setuRealName(adminUser.getuRealName());
            user.setuAddress(adminUser.getuAddress());
            boolean up = userdao.update(adminUser);
            if (up) {
                rt = "修改成功";
            } else {
                rt = "修改失败";
            }
        }
        return rt;
    }
}
