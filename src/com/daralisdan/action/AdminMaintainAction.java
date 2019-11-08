package com.daralisdan.action;

import com.daralisdan.entity.Admin;
import com.daralisdan.service.AdminService;
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
public class AdminMaintainAction extends HttpServlet {
    /**
     * 查询所有信息展示在页面
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //处理请求，响应时中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        //调用逻辑层
        AdminService adminService = new AdminService();
        List<Admin> result = adminService.getAdminInfo();
        System.out.println(result);
        //解析数据为json
        JSONArray jsonArray = JSONArray.fromObject(result);
        System.out.println("json:" + result);
        // 返回页面
        resp.getWriter().println(jsonArray);

    }

    /**
     * 删除数据
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //处理请求，响应时中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        //获取前面传的参数,数组对象
        String[] ids = req.getParameterValues("ids"); //key
        System.out.println(Arrays.toString(ids));

        //调用逻辑层
        AdminService adminService = new AdminService();
        String rt = adminService.delById(ids);
        System.out.println("============" + rt);
        //返回到页面
        resp.getWriter().println(rt);

    }
}
