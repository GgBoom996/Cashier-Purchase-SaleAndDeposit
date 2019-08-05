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
    <script src="/static/js/model/member/member.js"></script>
</head>
<body>
<%--datagrid--%>
<table id="memberDatagrid"></table>
<%--toolbar--%>
<div id="toolbar">
    <a data-cmd="add" href="javascript:void(0)" class="easyui-linkbutton c1" iconCls="icon-add" plain="true">添加</a>
    <a data-cmd="edit" href="javascript:void(0)" class="easyui-linkbutton c2" iconCls="icon-edit" plain="true" >编辑</a>
    <a data-cmd="delete" href="javascript:void(0)" class="easyui-linkbutton c3" iconCls="icon-remove" plain="true" >删除</a>
    <a data-cmd="refresh" href="javascript:void(0)" class="easyui-linkbutton c4" iconCls="icon-reload" plain="true" >刷新</a>

    关键字：<input type="text" id="keywords" value="" placeholder="输入账号/昵称" />
    <a href="javascript:void(0)" class="easyui-linkbutton"  data-cmd="search"  data-options="iconCls:'icon-search',plain:true">查询</a>
</div>
<%--添加或者编辑的dialog--%>
<div id="memberDlg" class="easyui-dialog" style="width: 400px"
     closed="true" buttons="#dlg-buttons">
    <form id="memberForm" method="post" novalidate style="margin:0;padding:20px 50px">
        <%--编辑隐藏域的处理--%>
        <input type="hidden" name="id" >
        <table>
            <tr>
                <td>
                    会员账号:<input type="text" name="userName">
                </td>
            </tr>
            <tr>
                <td>
                    会员昵称:<input type="text" name="nickName">
                </td>
            </tr>
            <tr>
                <td>
                    会员密码:<input type="password" name="password">
                </td>
            </tr>
            <tr>
                <td>
                    会员电话:<input type="text" name="tel">
                </td>
            </tr>
            <tr>
                <td>
                    会员等级:<input type="text" name="state">
                </td>
            </tr>
            <tr>
                <td>
                    会员积分:<input type="text" name="integral">
                </td>
            </tr>
            <tr>
                <td>
                    会员余额:<input type="text" name="balance">
                </td>
            </tr>
            <tr>
                <td>
                    所属商店:<input type="text" name="storemanageId">
                </td>
            </tr>
            <tr>
                <td>
                    总充值金额:<input type="text" name="total">
                </td>
            </tr>
            <tr>
                <td>
                    会员生日:<input type="text" name="birthday">
                </td>
            </tr>
            <tr>
                <td>
                    操作:<input type="text" name="birthday">
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
