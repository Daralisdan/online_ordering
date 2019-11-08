package com.daralisdan.action;

import com.daralisdan.entity.FoodsCatalog;
import com.daralisdan.service.FoodsCatalogService;
import net.sf.json.JSONArray;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 2019/10/29,Create by yaodan
 */
public class FoodsCatalogAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //处理中文乱码
        resp.setCharacterEncoding("UTF-8");
        //调用逻辑层
        FoodsCatalogService foodsCatalogServiceService = new FoodsCatalogService();
        List<FoodsCatalog> list = foodsCatalogServiceService.getfoodsCatalog();
        System.out.println("返回的数据" + list);
        //解析数据为json
        JSONArray jsonArray = JSONArray.fromObject(list);
        //返回到页面
        resp.getWriter().println(jsonArray);

    }
}
