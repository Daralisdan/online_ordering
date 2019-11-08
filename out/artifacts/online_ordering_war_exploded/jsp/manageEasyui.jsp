<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/24
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理页面</title>

    <!-- 引入JQuery -->
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <!-- 引入EasyUI -->
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
    <script type="text/javascript" src="../easyui/locale/easyui-lang-zh_CN.js"></script>
    <!-- 引入EasyUI的样式文件-->
    <link rel="stylesheet" href="../easyui/themes/default/easyui.css" type="text/css"/>
    <!-- 引入EasyUI的图标样式文件-->
    <link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"/>

    <link rel="stylesheet" href="../css/manageEasyui.css">
    <script src="../js/manageEasyui.js"></script>

</head>
<body>
<div class="easyui-layout">
    <%--头部导航栏--%>
    <div class="nav" data-options="region:'north'">后台管理页面
        <div style="float: right;font-size: 23px;color: black;line-height:90px;"><a href="../index.jsp">退出登录</a></div>
    </div>
    <%--左边菜单栏--%>
    <div class="meau" data-options="region:'west',split:true" title="后台管理模块">
        <div id="sm" class="easyui-sidemenu" data-options="data:left_calalog" style="width:295px;"></div>
    </div>
    <%--右边显示栏--%>
    <div id="showView" data-options="region:'center',title:'显示栏'">

    </div>
</div>
</body>
</html>
