<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/29
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>系统信息页面</title>

    <!--&lt;!&ndash; 引入JQuery &ndash;&gt;-->
    <script type="text/javascript" src="../../easyui/jquery.min.js"></script>
    <!--&lt;!&ndash; 引入EasyUI &ndash;&gt;-->
    <script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
    <!--&lt;!&ndash; 引入EasyUI的中文国际化js，让EasyUI支持中文 &ndash;&gt;-->
    <script type="text/javascript" src="../../easyui/locale/easyui-lang-zh_CN.js"></script>
    <!--&lt;!&ndash; 引入EasyUI的样式文件&ndash;&gt;-->
    <link rel="stylesheet" href="../../easyui/themes/default/easyui.css" type="text/css"/>
    <!--&lt;!&ndash; 引入EasyUI的图标样式文件&ndash;&gt;-->
    <link rel="stylesheet" href="../../easyui/themes/icon.css" type="text/css"/>


</head>
<body>
<div style="width: 1600px;height: 250px;font-size: 25px; text-align: center;">
    <table id="sys_table" class="easyui-datagrid" title="系统属性" data-options="fitColumns:true">
    </table>
</div>

<script type="text/javascript">
    $('#sys_table').datagrid({
        url: '/online_ordering/action/SystemInfoAction',
        method: 'get',
        dataType: 'JSON',
        striped: true,//奇偶行使用不同背景色
        fit: false, //datagrid自适应宽度 垂直滚动条默认true
        fitColumns: true, //水平滚动条，默认false
        columns: [[
            {field: 'key', title: '系统属性名', width: 800, align: 'right', fitColumns: false},
            {field: 'value', title: '系统属性值', width: 800, align: 'left', fitColumns: false}
        ]]

    });

</script>
</body>
</html>
