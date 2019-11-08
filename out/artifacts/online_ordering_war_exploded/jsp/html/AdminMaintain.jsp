<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/29
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员维护</title>

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
    <table id="sys_table" class="easyui-datagrid" title="管理员维护" data-options="fitColumns:true,editor:'text'">
    </table>
</div>

<script type="text/javascript">
    $(function () {
        var tbldata;  //全局变量 datagraid
        //全局变量，初始化索引：当前编辑的行
        var editRow = undefined;

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

        //初始化数据表格
        tbldata = $('#sys_table').datagrid({
            url: '/online_ordering/action/adminMaintainAction',
            method: 'get',
            dataType: 'JSON',
            toolbar: tbar, //工具按钮操作
            idField: 'aid', //主键
            striped: true,//奇偶行使用不同背景色
            // singleSelect: true,//单选
            fit: false, //datagrid自适应宽度 垂直滚动条默认true
            fitColumns: true, //水平滚动条，默认false
            frozenColumns: [[{ //复选框
                field: 'ck',
                checkbox: true
            }
            ]],
            columns: [[ //字段数据列
                {field: 'aid', title: '用户ID', width: 533, editor: {type: 'validatebox', options: {required: true}}},
                {field: 'aname', title: '用户名', width: 533, editor: {type: 'validatebox', options: {required: true}}},
                {field: 'apwd', title: '密码', width: 533, editor: {type: 'validatebox', options: {required: true}}}
                // ,
                // {  //行内编辑
                //     field: 'operate', title: '操作', width: 200, fitColumns: true, formatter: function (value, row, index) {
                //         var d = '<a href="#" name="del" onclick="delRow()" class="easyui-linkbutton">删除</a>';
                //         // var e = '<a href="#" name="edit" onclick="editRow('+index+',this)" class="easyui-linkbutton">编辑</a>';
                //         return d;
                //
                //     }
                //     } //在列属性下定义，formatter格式化函数，格式化行
            ]],
            // onLoadSuccess: function () {
            //     $("a[name='del']").linkbutton({text: '删除', plain: true, iconCls: 'icon-remove'});
            //     // $("a[name='edit']").linkbutton({text: '编辑', plain: true, iconCls: 'icon-edit'});
            // },
            // 当用户完成编辑一行时触发，rowIndex：编辑行的索引，从 0 开始;rowData：编辑行对应的记录;changes：更改的字段/值对
            onAfterEdit: function (rowIndex, rowData, changes) {
                alert("id:" + rowData.aid);
                console.info(rowData);
                editRow = undefined;
                // 获取用户id
                var id = rowData.aid;

                //把数据通过ajax发送到后台，更新数据库
                $.ajax({
                    url: "/online_ordering/action/adminMaintainSaveAction",
                    method: "POST", //发送的请求方式
                    dataType: "text", //服务器返回的数据类型
                    data: {  //向后台发送请求的参数
                        "aid": rowData.aid,
                        "aname": rowData.aname,
                        "apwd": rowData.apwd
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
            //获取所有的行
            var rows = tbldata.datagrid('getSelections');
            //判断是否选中要删除的行
            if (rows.length > 0) {
                $.messager.confirm('确认', '确认删除？', function (row) {
                    if (row) {
                        //定义要存放行数据的数组
                        var ids = [];
                        //循环遍历行数据，并存放到数组中
                        for (var i = 0; i < rows.length; i++) {
                            ids.push(rows[i].aid);
                        }
                        //分隔转换成字符串，目前前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
                        alert("要删除的行的id：" + ids.join(','));
                        //向后台发送ajax请求，请求要删除的数据
                        $.ajax({
                            url: "/online_ordering/action/adminMaintainAction",
                            method: 'POST',
                            dataType: 'text',
                            traditional: true, //传数组进后台需要设置该属性
                            data: { //向后台发送的数据
                                "ids": ids
                            },
                            success: function (result) { //请求成功之后后台返回的结果
                                console.log("后台返回的结果" + result)
                                //返回数据成功，重新加载页面
                                tbldata.datagrid('reload');
                            },
                            error: function () {
                                alert("响应失败");
                            }
                        });
                    }
                });
            } else {
                $.messager.confirm("提示", "请选择要删除的行", "error");
            }
        }

        //添加按钮
        function addBtn() {
            // 添加时先判断是否有开启编辑的行，如果有则把开户编辑的那行结束编辑
            if (editRow != undefined) {
                tbldata.datagrid("endEdit", editRow);
            } else if (editRow == undefined) {
                //添加时如果没有正在编辑的行，则在datagrid的第一行插入一行
                tbldata.datagrid("insertRow", {
                    index: 0,
                    row: {}
                });
                //开启编辑
                //将新插入的那一行开户编辑状态
                tbldata.datagrid("beginEdit", 0);
                //把添加行的索引赋值给全局变量
                editRow = 0;
            }
        }

        //保存按钮的点击事件
        function saveBtn() {
            //保存时结束当前编辑的行，自动触发onAfterEdit事件如果要与后台交互可将数据通过Ajax提交后台
            tbldata.datagrid("endEdit", editRow);
        }

        //编辑按钮的点击事件
        function edit() {
            //  修改时要先获取到选择的行
            var updateRow = tbldata.datagrid("getSelections");
            //如果选择一行，则修改，否则不能修改
            if (updateRow.length == 1) {
                //判断是否闭开启编辑的行，如果有，先关闭
                if (editRow != undefined) {
                    tbldata.datagrid("endEdit", editRow);
                } else if (editRow == undefined) {
                    //当无编辑行时,获取选择行的下标
                    var rowIndex = tbldata.datagrid("getRowIndex", updateRow[0]);
                    //开启编辑状态
                    tbldata.datagrid("beginEdit", rowIndex);
                    //把当前开启编辑的行的索引赋值给全局变量editRow
                    editRow = rowIndex;
                    console.log("修改的值索引：" + editRow);
                    //当开启了当前选择行的编辑状态之后，应该取消当前列表的所有选择行，要不然双击之后无法再选择其他行进行编辑
                    tbldata.datagrid("unselectAll");
                }
            } else {
                $.messager.confirm("提示", "请选择要编辑的行", "error");
            }
        }

        //取消编辑按钮的点击事件
        function celBtn() {
            //取消当前编辑行,把当前编辑行 undefined回滚改变的数据,取消选择的行
            //编辑的行的索引
            editRow = undefined;
            //回滚数据,回滚自从创建以来或最后一次调用 保存请求 以来所有更改的数据。
            tbldata.datagrid("rejectChanges");
            //关闭编辑的选中行
            tbldata.datagrid("endEdit", editRow);

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
</body>
</html>
