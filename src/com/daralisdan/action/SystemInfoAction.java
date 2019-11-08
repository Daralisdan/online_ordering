package com.daralisdan.action;

import com.daralisdan.entity.SystemField;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 2019/10/27,Create by yaodan
 */
public class SystemInfoAction extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
        //字符编码，中文乱码
        resp.setCharacterEncoding("UTF-8");
        //调用系统信息的类，存入map中
//        Map<String, String> list = null;
        List<SystemField> list=null;
            list = new SystemInfo().getField();

//字符串拼接
//        String list = "[{" +
//                "\t\"id\": \"系统操作系统:\",\n" +
//                "\t\"value\":\"" + "window" +
//                "\"}, {\n" +
//                "\t\"id\": \"操作系统类型;\",\n" +
//                "\t\"value\":\"" + "x86" +
//                "\"}, {\n" +
//                "\t\"id\": \"用户，目录，临时目录:\",\n" +
//                "\t\"value\":\"" + "临时目录" +
//                "\"}, {\n" +
//                "\t\"id\": \"JDK版本:\",\n" +
//                "\t\"value\":\"" + "jdk版本" +
//                "\"}, {\n" +
//                "\t\"id\": \"JDK安装目录:\",\n" +
//                "\t\"value\":\"" + "jdk安装目录" +
//                "\"}, {\n" +
//                "\t\"id\": \"总内存剩余内存:\",\n" +
//                "\t\"value\":\"" + "内存" +
//                "\"}]";
        JSONArray jsonArray = JSONArray.fromObject(list);
        System.out.println(jsonArray);
        resp.getWriter().println(jsonArray);
        System.out.println("jsonArray=============================================="+jsonArray.toString());

    }

}
