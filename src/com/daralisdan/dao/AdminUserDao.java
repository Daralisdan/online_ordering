package com.daralisdan.dao;

import com.daralisdan.entity.AdminUser;

import java.util.List;

/**
 * 2019/10/29,Create by yaodan
 */
public interface AdminUserDao {
    /**
     * 查询所有会员信息
     *
     * @return
     */
    List<AdminUser> getAdminUser();

    /**
     * 删除会员信息
     * 根据id删除数据，
     * 传一个id,单个删除
     * 传多个id，批量删除
     *
     * @param ids
     * @return
     */
    boolean delById(String[] ids);

    /**
     * 根据id获取用户
     *
     * @param
     * @return
     */
    AdminUser getById(Integer id);

    /**
     * 添加会员信息
     *
     * @param adminUser
     * @return
     */
    boolean insert(AdminUser adminUser);

    /**
     * 修改会员信息
     *
     * @param adminUser
     * @return
     */
    boolean update(AdminUser adminUser);
}
