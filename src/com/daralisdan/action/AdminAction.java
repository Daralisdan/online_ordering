package com.daralisdan.action;

import com.daralisdan.entity.Admin;
import com.daralisdan.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 2019/10/25,Create by yaodan
 */
public class AdminAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//        super.doGet(req, resp);
        resp.setCharacterEncoding("UTF-8");
        //获取前台的值
        String names = req.getParameter("username"); //用户名
        String pwds = req.getParameter("password"); //密码

        //前台的值封装在实体类中
        Admin admin = new Admin();
        admin.setAname(names);
        admin.setApwd(pwds);

        //调用逻辑层
        AdminService adminService = new AdminService();
        String result = adminService.getAll(admin);
        resp.getWriter().println(result);
        //返回页面
//        req.setAttribute("result", result);
        //重定向 带值返回
//        req.getRequestDispatcher("jsp/manageEasyui.jsp").forward(req, resp);

    }

    /**
     * 根据用户名修改密码
     *
     * @param req
     * @param resp
     * @throws IOException
     */

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理中文乱码
        resp.setCharacterEncoding("UTF-8");

        //获取前台的值
        String name = req.getParameter("name");
        String pwd = req.getParameter("pwd");
        String newpwd = req.getParameter("setpwd");

        //封装在实体类中
        Admin admin = new Admin();
        admin.setAname(name);
        admin.setApwd(pwd);
        admin.setNewpwd(newpwd);

        //调用逻辑层
        AdminService adminService = new AdminService();
        String result = adminService.updatePassword(admin);

        //返回页面
        resp.getWriter().println(result);

    }
}
