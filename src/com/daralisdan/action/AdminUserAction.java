package com.daralisdan.action;

import com.daralisdan.entity.AdminUser;
import com.daralisdan.service.AdminUserService;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * 2019/10/29,Create by yaodan
 */
public class AdminUserAction extends HttpServlet {
    /**
     * 会员信息，显示所有信息在页面
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理中文乱码
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        //调用逻辑层
        AdminUserService adminUserService = new AdminUserService();
        List<AdminUser> list = adminUserService.getUserList();
        System.out.println("返回的数据" + list);
        //解析数据为json
        JSONArray jsonArray = JSONArray.fromObject(list);
        //返回到页面
        resp.getWriter().println(jsonArray);
    }

    /**
     * 删除会员信息
     * 根据id删除数据，
     * 传一个id,单个删除
     * 传多个id，批量删除
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理中文乱码
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        //获取前面传的参数，数组对象
        String[] ids = req.getParameterValues("ids");
        System.out.println(Arrays.toString(ids));

        //调用逻辑层
        AdminUserService adminUserService = new AdminUserService();
        String rt = adminUserService.delById(ids);
        //返回页面
        resp.getWriter().println(rt);

    }

}
