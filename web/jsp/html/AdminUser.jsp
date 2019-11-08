<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/29
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员管理</title>
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
    <table id="sys_table" class="easyui-datagrid" title="会员管理">
    </table>
</div>

</body>
</html>
<script type="text/javascript">
    $(function () {
        var tbldata; //定义全局变量datagrid
        var editRow = undefined; //定义全局变量：当前编辑的行
        tbldata = $('#sys_table').datagrid({
            url: '/online_ordering/action/adminUserAction',
            method: 'GET',
            dataType: 'JSON',
            // toolbar: tbar,
            fitColumns: true,
            idField: 'uid', //主键
            striped: true,//奇偶行使用不同背景色
            // singleSelect: true,//单选
            <%--&lt;%&ndash; //隔行变色&ndash;%&gt;--%>
            <%--rowStyler: function(index,row){--%>
            <%--if ((index % 2)!=0){--%>
            <%--return 'background-color:#E8F0FE;';--%>
            <%--}--%>
            // else{
            //     return 'background-color:#9acfea;color:#fff;font-weight:bold;';
            // }
            // },
            frozenColumns: [[{ //复选框
                field: 'ck',
                checkbox: true
            }
            ]],
            columns: [[
                {field: 'uid', title: '会员ID', width: 177, editor: {type: 'validatebox', options: {required: true}}},
                {field: 'uName', title: '会员用户名', width: 177, editor: {type: 'validatebox', options: {required: true}}},
                {field: 'uPwd', title: '会员密码', width: 177, editor: {type: 'validatebox', options: {required: true}}},
                {
                    field: 'uRealName',
                    title: '会员真实姓名',
                    width: 100,
                    editor: {type: 'validatebox', options: {required: true}}
                },
                {
                    field: 'uAddress',
                    title: '会员住址',
                    width: 100,
                    editor: {type: 'validatebox', options: {required: true}}
                },
                {field: 'uSex', title: '会员性别', width: 177, editor: {type: 'validatebox', options: {required: true}}},
                {field: 'uTel', title: '会员联系方式', width: 177, editor: {type: 'validatebox', options: {required: true}}},
                {field: 'uEmail', title: '会员邮箱', width: 177, editor: {type: 'validatebox', options: {required: true}}},
                {field: 'uqq', title: '会员qq', width: 177, editor: {type: 'validatebox', options: {required: true}}}
            ]],
            toolbar: [{
                id: "del",
                text: "删除",
                iconCls: "icon-remove",
                handler: function () {
                    delBtn();
                }
            }, '-',
                {
                    id: "add",
                    text: "添加",
                    iconCls: "icon-add",
                    plain: true,//当True时显示一个普通效果
                    handler: function () {//添加列表的操作按钮添加，修改，删除等
                        addBtn();
                    }
                }, '-',
                {
                    id: "save",
                    text: "保存",
                    iconCls: "icon-save",
                    handler: function () {
                        save();
                    }
                }, '-',
                {
                    id: "edit",
                    text: '编辑',
                    iconCls: 'icon-edit',
                    handler: function () {
                        edit();
                    }
                }, '-',
                {
                    id: 'celedit',
                    text: '取消编辑',
                    iconCls: 'icon-redo',
                    handler: function () {
                        cancelEdit();
                    }
                }
            ],
            //当用户完成编辑一行时触发
            onAfterEdit: function (rowIndex, rowData, changes) {
                //保存之后，endEdit该方法触发此事件
                alert("保存之后触发");
                alert("id:" + rowData.uid);
                console.info(rowData);
                editRow = undefined;
                //通过ajax把数据提交到后台
                $.ajax({
                    url: "/online_ordering/action/adminUserSaveAction",
                    method: "GET", //发送的请求方式
                    dataType: "text", //服务器返回的数据类型
                    data: {  //向后台发送请求的参数
                        "uid": rowData.uid,
                        "uName": rowData.uName,
                        "uPwd": rowData.uPwd,
                        "uRealName": rowData.uRealName,
                        "uAddress": rowData.uAddress,
                        "uSex": rowData.uSex,
                        "uTel": rowData.uTel,
                        "uEmail": rowData.uEmail,
                        "uqq": rowData.uqq
                    },
                    success: function (result) { //响应请求的回调函数
                        alert(result);
                        //响应成功，返回数据，渲染到页面成功之后，重新加载数据表格
                        tbldata.datagrid("reload");

                    },
                    error: function () {
                        alert("回调函数渲染失败");
                    }
                });
            },
            //双击开启编辑
            onDblClickRow: function (rowIndex, rowData) {
                // tbldata.datagrid("reload");
                doubleEdit(rowIndex);
            }

        });

        //删除按钮的点击事件
        function delBtn() {
            //删除时先获取选择行的数据
            var rows = tbldata.datagrid("getSelections");
            //判断是否选中要删除的行
            if (rows.length > 0) {
                $.messager.confirm("提示", "你确定要删除吗?", function (row) {
                    //选中要删除的行
                    if (row) {
                        var ids = [];
                        //循环遍历要删除的行，并存放到数组中，便于发送给后台
                        for (var i = 0; i < rows.length; i++) {
                            ids.push(rows[i].uid);
                        }
                        //分隔转换成字符串，目前前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
                        alert(ids.join(','));
                        //向后台发送ajax请求，请求要删除的数据
                        $.ajax({
                            url: '/online_ordering/action/adminUserAction',
                            method: 'POST',
                            dataType: 'text',
                            traditional: true,//传数组进后台需要设置该属性
                            data: { //向后台发送的数据
                                "ids": ids
                            },
                            success: function (result) { //请求成功之后后台返回的结果
                                console.log("后台返回的结果" + result)
                                tbldata.datagrid("reload");
                            }
                        });
                    }
                });
            } else {
                $.messager.alert("提示", "请选择要删除的行", "error");
            }
            alert("delete");
        }

        //添加按钮的点击事件
        function addBtn() {
            // 添加时先判断是否有开启编辑的行，如果有则把开户编辑的那行结束编辑
            if (editRow != undefined) {
                tbldata.datagrid("endEdit", editRow);
            } else if (editRow == undefined) {
                //添加时如果没有正在编辑的行，则在datagrid的第一行插入一行
                tbldata.datagrid("insertRow", {
                    index: 0, //索引从零开始
                    row: {}
                });
                //将新插入的那一行开户编辑状态
                tbldata.datagrid("beginEdit", 0);
                //给新编辑的行赋值
                editRow = 0;
                alert("添加数据行的索引：" + editRow);
            }
        }

        //保存按钮的点击事件
        function save() {
            //保存时结束当前编辑的行，自动触发onAfterEdit事件如果要与后台交互可将数据通过Ajax提交后台
            tbldata.datagrid("endEdit", editRow);
            alert("保存的数据" + editRow);
        }

        //编辑按钮的点击事件
        function edit() {
            //  修改时要先获取到选择的行
            var updateRow = tbldata.datagrid("getSelections");
            //如果选择一行，则修改，否则不能修改
            if (updateRow.length == 1) {
                if (editRow != undefined) {
                    //修改前先判断是否有开启编辑的行，如果有先关闭开启编辑的行
                    tbldata.datagrid("endEdit", editRow);
                } else if (editRow == undefined) {  //当无编辑行时
                    //获取选择行的下标
                    var rowIndex = tbldata.datagrid("getRowIndex", updateRow[0]);
                    //开启编辑
                    tbldata.datagrid("beginEdit", rowIndex);
                    //把当前开启编辑的行的索引赋值给全局变量editRow
                    editRow = rowIndex;
                    console.log("修改的值按钮：" + editRow);
                    alert("修改的值按钮：" + editRow);
                    //当开启了当前选择行的编辑状态之后，应该取消当前列表的所有选择行，要不然双击之后无法再选择其他行进行编辑
                    tbldata.datagrid("unselectAll");
                }
            } else {
                $.messager.confirm("提示", "请选择要编辑的行", "error");
            }
        }

        //取消编辑的点击事件
        function cancelEdit() {
            //取消当前编辑行,把当前编辑行 undefined回滚改变的数据,取消选择的行
            editRow == undefined;
            //回滚自从创建以来或最后一次调用 保存请求 以来所有更改的数据。
            tbldata.datagrid("rejectChanges");
            //取消选择的行
            tbldata.datagrid("unselectAll");
        }

        //双击开启编辑
        function doubleEdit(rowIndex) {
            if (editRow != undefined) {
                //如果有开启的行，先结束编辑
                tbldata.datagrid("endEdit", editRow);
            } else if (editRow == undefined) {
                tbldata.datagrid("beginEdit", rowIndex);
                // 把当前行的索引赋值给全局变量
                editRow = rowIndex;
            }
        }
    });


</script>
