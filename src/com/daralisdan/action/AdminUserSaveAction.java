package com.daralisdan.action;

import com.daralisdan.entity.AdminUser;
import com.daralisdan.service.AdminUserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 会员信息管理，增加，修改
 * 2019/10/29,Create by yaodan
 */
public class AdminUserSaveAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        //获取前台的参数
        String uid = req.getParameter("uid");
        Integer uids = Integer.parseInt(uid);

        String uNames = req.getParameter("uName");
        String uPwds = req.getParameter("uPwd");
        String uRealNames = req.getParameter("uRealName");
        String uAddress = req.getParameter("uAddress");

        //存入实体类中
        AdminUser adminUser = new AdminUser();
        adminUser.setUid(uids);
        adminUser.setuName(uNames);
        adminUser.setuPwd(uPwds);
        adminUser.setuRealName(uRealNames);
        adminUser.setuAddress(uAddress);

        //调用逻辑层
        AdminUserService adminUserService = new AdminUserService();
        String rt = adminUserService.save(adminUser);
        //返回页面
        resp.getWriter().println(rt);
    }
}
