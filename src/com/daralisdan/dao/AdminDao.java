package com.daralisdan.dao;

import com.daralisdan.entity.Admin;

import java.util.List;

/**
 * 2019/10/25,Create by yaodan
 */
public interface AdminDao {
    /**
     * 查询数据库中所有
     *
     * @return
     */
    List<Admin> selectAll();

    /**
     * 根据用户名，密码查询数据
     *
     * @param admin
     * @return
     */
    Admin getAdmin(Admin admin);

    /**
     * 根据用户修改数据
     *
     * @param ad
     * @return
     */
    boolean updatePassword(Admin ad);

    /**
     * 根据id删除数据，
     * 传一个id,单个删除
     * 传多个id，批量删除
     *
     * @return
     */

    boolean getDelById(String[] ids);

    /**
     * 根据id查询用户
     *
     * @param
     * @return
     */
    Admin getById(Integer id);

    /**
     * 添加用户
     *
     * @param
     * @return
     */

    boolean insert(Admin admin);

    /**
     * 修改用户
     *
     * @param
     * @return
     */
    boolean update(Admin user);
}
