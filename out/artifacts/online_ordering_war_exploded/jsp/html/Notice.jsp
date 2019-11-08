<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/4
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告管理</title>
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
<div style="width:1600px;height: 250px;font-size: 25px; text-align: center;">
    <table id="sys_table" class="easyui-datagrid" title="公告管理" data-options="fitColumns:true">
    </table>
</div>

<script type="text/javascript">
    $(function () {
        // 构建列表工具栏
        var tbar = [{
            id: "del",
            text: "删除",
            iconCls: "icon-remove",
            handler: function () {
                delBtn();
                alert("delete");
            }
        }, '-',
            {
                id: "add",
                text: "添加",
                iconCls: "icon-add",
                plain: true,//当True时显示一个普通效果
                handler: function () {
                    addBtn();
                    alert("添加数据")
                }
            }, '-',
            {
                id: "save",
                text: "保存",
                iconCls: "icon-save",
                handler: function () {
                    saveBtn();
                    alert("保存成功");
                }
            }, '-',
            {
                id: "edit",
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    edit();
                    alert("编辑");
                }
            }, '-',
            {
                id: 'celedit',
                text: '取消编辑',
                iconCls: 'icon-redo',
                handler: function () {
                    celBtn();
                    alert("取消编辑");
                }
            }
        ];

        $("#sys_table").datagrid({
            url: '/online_ordering/action/adminUserAction',
            method: 'GET',
            dataType: 'JSON',
            toolbar: tbar,
            fitColumns: true,
            striped: true,//奇偶行使用不同背景色
            // singleSelect: true,//单选
            frozenColumns: [[{ //复选框
                field: 'ck',
                checkbox: true
            }
            ]],
            columns: [[
                {field: 'title', title: '标题', width: 177, editor: {type: 'validatebox', options: {required: true}}},
                {field: 'data', title: '发布时间', width: 177, editor: {type: 'validatebox', options: {required: true}}},
                {field: 'contitle', title: '内容', width: 177, editor: {type: 'validatebox', options: {required: true}}},
            ]]
        });
    });
</script>
</body>
</html>
