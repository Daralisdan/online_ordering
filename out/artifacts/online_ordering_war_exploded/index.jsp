<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/24
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网上订餐系统后台</title>
    <link rel="stylesheet" href="css/login.css"/>
    <script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
    <script src="js/index.js"></script>
</head>
<body>
<div class="text">网上订餐系统后台管理</div>
<div class="login">
    <div class="admin_login">
        <div class="center admin_login_type">
            管理员登录
        </div>
    </div>
    <%--表单--%>
    <div class="login_form">
        <form>
            <%--用户名--%>
            <div class="div2">
                <div class="center">
                    <div class="div_name">用户名：</div>
                    <div class="div_input"><input type="text" class="inBox" id="username" placeholder="请输入用户名"/>
                    </div>
                </div>
            </div>
            <%--密码--%>
            <div class="div2">
                <div class="center">
                    <div class="div_name">密码：</div>
                    <div class="div_input"><input type="password" class="inBox" id="password" placeholder="请输入密码"/>
                    </div>
                </div>
            </div>
            <%--按钮--%>
            <div class="div2">
                <div class="center">
                    <div class="div_name div_btn1"><input type="button" class="btn" value="提交" onclick="sub()"/></div>
                    <div class="div_input div_btn2"><input type="reset" class="btn" value="重置"/></div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

