package com.daralisdan.action;

import com.daralisdan.entity.Admin;
import com.daralisdan.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户信息管理
 * 添加，修改
 * 2019/10/29,Create by yaodan
 */
public class AdminMaintainSaveAction extends HttpServlet {
    /**
     * 保存管理员维护的数据信息
     * 添加，修改
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理请求，响应时中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        //获取页面的参数
        String aid = req.getParameter("aid");//key 用户id
        // String 转换成int类型
        Integer aids = Integer.parseInt(aid);

        String anames = req.getParameter("aname");//用户名
        String apwds = req.getParameter("apwd");//密码

        //封装到实体类中
        Admin admin = new Admin();
        admin.setAid(aids);
        admin.setAname(anames);
        admin.setApwd(apwds);

        //调用逻辑层
        AdminService adminService = new AdminService();
        String rt = adminService.save(admin);
        System.out.println("============" + rt);
        //返回到页面
        resp.getWriter().println(rt);

    }
}
