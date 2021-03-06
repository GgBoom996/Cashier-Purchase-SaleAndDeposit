<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2019/1/16
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title>Title</title>
    <%--引入公共依赖--%>
   <%@include file="/static/common/common_header.jsp"%>
    <script src="/static/js/model/storemanage/storemanage.js"></script>
</head>
<body>
<%--datagrid--%>
<table id="storemanageDatagrid"></table>
<%--toolbar--%>
<div id="toolbar">
    <a data-cmd="add" href="javascript:void(0)" class="easyui-linkbutton c1" iconCls="icon-add" plain="true">添加</a>
    <a data-cmd="edit" href="javascript:void(0)" class="easyui-linkbutton c2" iconCls="icon-edit" plain="true" >编辑</a>
    <a data-cmd="delete" href="javascript:void(0)" class="easyui-linkbutton c3" iconCls="icon-remove" plain="true" >删除</a>
    <a data-cmd="refresh" href="javascript:void(0)" class="easyui-linkbutton c4" iconCls="icon-reload" plain="true" >刷新</a>
</div>
<%--添加或者编辑的dialog--%>
<div id="storemanageDlg" class="easyui-dialog" style="width: 400px"
     closed="true" buttons="#dlg-buttons">
    <form id="storemanageForm" method="post" novalidate style="margin:0;padding:20px 50px">
        <%--编辑隐藏域的处理--%>
        <input type="hidden" name="id" >
        <table>
            <tr>
                <td>
                    店铺名:<input type="text" name="storeName">
                </td>
            </tr>
            <tr>
                <td>
                    店长:<input type="text" name="buinour">
                </td>
            </tr>
            <tr>
                <td>
                    联系方式:<input type="text" name="buinourPhone">
                </td>
            </tr>
            <tr>
                <td>
                    店铺状态:启用<input type="radio" name="storeCondition" value="1"> 关闭<input type="radio" name="storeCondition" value="0">
                </td>
            </tr>
            <tr>
                <td>
                    店铺地址:<input type="text" name="storeAddress">
                </td>
            </tr>
            <tr>
                <td>
                    注册时间:<input type="date" name="registrationDate">
                </td>
            </tr>
        </table>
    </form>
</div>
<%--dialog的button--%>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" data-cmd="submit" style="width:90px">提交</a>
    <a href="javascript:void(0)" class="easyui-linkbutton c8" iconCls="icon-cancel" data-cmd="cancel" style="width:90px">取消</a>
</div>
</body>
</html>
