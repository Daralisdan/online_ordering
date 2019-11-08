<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/4
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>特价区</title>

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

    <%--引入富文本编辑器框架包--%>
    <link rel="stylesheet" href="../../kindeditor/themes/default/default.css">
    <script src="../../kindeditor/kindeditor-all-min.js"></script>
    <script src="../../kindeditor/lang/zh-CN.js"></script>

</head>
<body>
<div style="width:1600px;height: 250px;font-size: 25px; text-align: center;">
    <form>
        <table class="easyui-datagrid" style="width:1600px;" border="1" cellspacing="0"
               data-options="url:' ',fitColumns:true,singleSelect:true">
            <tr>
                <td data-options="field:'code'" style="width:500px;height:35px;text-align: right">菜品类别</td>
                <td data-options="field:'name'">
                    <select style="height:30px;width: 125px">
                        <option>请选择菜品类别</option>
                        <option>主菜</option>
                        <option>面食</option>
                        <option>炒菜</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td data-options="field:'code'" style="width:500px;text-align: right">菜品名称</td>
                <td data-options="field:'name'" style="height:30px;"><input type="text" id="foodsName"/></td>
            </tr>
            <tr>
                <td data-options="field:'code'" style="width:500px;text-align: right">菜品介绍</td>
                <td data-options="field:'name'">
                    <textarea style="width:450px;height: 260px; resize: none;" id="textareaid" rows="30" cols="40"
                              class="ckeditor" name="textareaid"></textarea>
                </td>
            </tr>
            <tr>
                <td data-options="field:'code'" style="width:500px;text-align: right">菜品图片</td>
                <td data-options="field:'name'">
                    <input type="file" name="imgfile" accept="image/*"/>
                    <input type="submit" value="上传" name="upload" style="background:#00bbee">
                </td>
            </tr>
            <tr>
                <td data-options="field:'code'" style="width:500px;text-align: right">单价</td>
                <td data-options="field:'name'" style="height:30px;"><input type="text" id="price"/></td>
            </tr>
            <tr>
                <td data-options="field:'code'" style="width:500px;text-align: right">适合人群</td>
                <td data-options="field:'name'"><select style="height:30px;width: 125px">
                    <option selected="selected">所有</option>
                    <option>儿童</option>
                    <option>妇女</option>
                    <option>老年人</option>
                </select></td>
            </tr>
            <tr>
                <td data-options="field:'code'" style="width:500px;text-align: right"></td>
                <td data-options="field:'name'" style="height:30px;">
                    <input type="submit" value="提交" style="background:#00bbee">&nbsp;&nbsp;
                    <input type="reset" value="重置">
                </td>
            </tr>

        </table>
    </form>
</div>

<script type="text/javascript">
</script>
</body>
</html>
