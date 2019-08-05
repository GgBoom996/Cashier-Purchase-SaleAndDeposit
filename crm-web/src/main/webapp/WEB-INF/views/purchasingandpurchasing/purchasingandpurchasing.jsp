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
    <script src="/static/js/model/purchasingandpurchasing/purchasingandpurchasing.js"></script>
</head>
<body>
<%--datagrid--%>
<table id="purchasingandpurchasingDatagrid"></table>
<%--toolbar--%>
<div id="toolbar">
    <a data-cmd="add" href="javascript:void(0)" class="easyui-linkbutton c1" iconCls="icon-add" plain="true">添加</a>
    <a data-cmd="edit" href="javascript:void(0)" class="easyui-linkbutton c2" iconCls="icon-edit" plain="true" >编辑</a>
    <a data-cmd="delete" href="javascript:void(0)" class="easyui-linkbutton c3" iconCls="icon-remove" plain="true" >删除</a>
    <a data-cmd="refresh" href="javascript:void(0)" class="easyui-linkbutton c4" iconCls="icon-reload" plain="true" >刷新</a>
</div>
<%--添加或者编辑的dialog--%>
<div id="purchasingandpurchasingDlg" class="easyui-dialog" style="width: 400px"
     closed="true" buttons="#dlg-buttons">
    <form id="purchasingandpurchasingForm" method="post" novalidate style="margin:0;padding:20px 50px">
        <input id="eid" type="hidden" name="id">
        <table cellpadding="5">
            <tr>
                <td>订单编号:</td>
                <td><input class="easyui-textbox" type="text"  name="documentNumber"></td>
            </tr>
            <tr>
                <td>商品总数:</td>
                <td><input class="easyui-textbox" type="text"  name="totalAmount"></td>
            </tr>
            <tr>
                <td>总金额:</td>
                <td><input class="easyui-textbox" type="text"  name="paymentAmount"></td>
            </tr>
            <tr>
                <td>采购时间:</td>
                <td><input class="easyui-datebox" type="text"  name="makeTime"></td>
            </tr>
            <tr>
                <td>备注:</td>
                <td><input class="easyui-textbox" type="text"  name="remarks"></td>
            </tr>
            <tr>
                <td>采购门店:</td>
                <td>
                    <input class="easyui-combobox" name="storemanage.id"
                           data-options="
                            url:'/util/findAllStore',
                            method:'get',
                            valueField:'id',
                            textField:'storeName',
                            panelHeight:'auto'
                        ">

                </td>
            </tr>

        </table>
        <table id="billItems"></table>
    </form>
</div>
<%--dialog的button--%>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" data-cmd="submit" style="width:90px">提交</a>
    <a href="javascript:void(0)" class="easyui-linkbutton c8" iconCls="icon-cancel" data-cmd="cancel" style="width:90px">取消</a>
</div>
</body>
</html>
