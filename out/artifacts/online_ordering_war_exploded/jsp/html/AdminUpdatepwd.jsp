<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/29
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>密码修改</title>
    <!-- 引入JQuery -->
    <script type="text/javascript" src="../../easyui/jquery.min.js"></script>
    <!-- 引入EasyUI -->
    <script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
    <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
    <script type="text/javascript" src="../../easyui/locale/easyui-lang-zh_CN.js"></script>
    <!-- 引入EasyUI的样式文件-->
    <link rel="stylesheet" href="../../easyui/themes/default/easyui.css" type="text/css"/>
    <!-- 引入EasyUI的图标样式文件-->
    <link rel="stylesheet" href="../../easyui/themes/icon.css" type="text/css"/>
</head>
<body>
<div style="width:500px;height:500px;padding:5px;margin-bottom:50px;">
    <div class="easyui-panel" title="密码修改" style="width:400px;margin-bottom:50px;" data-options="fit:true,border:true">
        <!--提交表单的div-->
        <div style="padding:10px 60px 20px 60px;margin: 0px auto;">
            <form>
                <table cellpadding="5" class="easyui-datagrid" title="密码修改" data-options="fitColumns:true">
                    <!--登录名-->
                    <tr>
                        <td>登录名:</td>
                        <td><input class="easyui-textbox" type="text" id="name" data-options="required:true"/>
                        </td>
                    </tr>
                    <!--原密码-->
                    <tr>
                        <td>原密码:</td>
                        <td><input class="easyui-textbox" type="password" id="pwd"
                                   data-options="required:true,validType:'pwd'"/></td>
                    </tr>
                    <!--新密码-->
                    <tr>
                        <td>新密码:</td>
                        <td><input class="easyui-textbox" type="password" id="setpwd" data-options="required:true"/>
                        </td>
                    </tr>
                    <!--确认密码-->
                    <tr>
                        <td>确认密码:</td>
                        <td><input class="easyui-textbox" type="password" id="repwd" data-options="required:true"/></td>
                    </tr>
                    <!--按钮-->
                    <tr>
                        <td><input type="button" class="btn" value="提交" onclick="submitForm()"/></td>
                        <td><input type="reset" class="btn" value="重置" onclick="clearForm()"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<script>
    function submitForm() {
        // $('#update_pwd').form('submit');
        var p1 = $("#setpwd").val();
        var p2 = $("#repwd").val();
        if (p1 != p2) {
            alert("两次密码不一致");
            return;
        }
        $.ajax({
            url: '/online_ordering/action/adminAction',
            dataType: 'text',
            type: 'POST',
            async: false,
            //请求参数传给后台
            data: {
                "name": $("#name").val(),
                "pwd": $("#pwd").val(),
                "setpwd": p1
            },
            //后台传回的数据
            success: function (result) {
                if (result) {
                    console.log(result + "用户名为:" + $("#name").val() + "密码为：" + p1);
                    alert(result + "用户名为:" + $("#name").val() + "密码为：" + p1);
                } else {
                    alert(result);
                }
            }
        });
    }

    function clearForm() {
        // $('#update_pwd').form('clear');
    }
</script>
</body>
</html>
