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

    <title>我的主页</title>
    <%--引入公共依赖--%>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <jsp:include page="/static/common/common_header.jsp" />
    <script src="https://cdn.bootcss.com/vue-resource/1.5.1/vue-resource.js"></script>
    <style>
        p:first-child{
            margin-left: 80px;
        }
    </style>
</head>
<body>
<%--datagrid--%>
<%--toolbar--%>
<%--<div id="toolbar">
    <a data-cmd="add" href="javascript:void(0)" class="el-icon-circle-plus" iconCls="icon-add" plain="true"></a>
    <a data-cmd="edit" href="javascript:void(0)" class="easyui-linkbutton c2" iconCls="icon-edit" plain="true" >编辑</a>
    <a data-cmd="delete" href="javascript:void(0)" class="easyui-linkbutton c3" iconCls="icon-remove" plain="true" >删除</a>
    <a data-cmd="refresh" href="javascript:void(0)" class="easyui-linkbutton c4" iconCls="icon-reload" plain="true" >刷新</a>
</div>--%>
<%--添加或者编辑的dialog--%>
<!--店铺信息-->
<div id="main">
    <el-container style="height: 100%">
        <el-header>
            <img src="/static/images/9.bmp">
            <%--头部--%>
        </el-header>
        <el-container >
            <el-aside width="200px" high="500px">
                <%--菜单--%>
                <el-tree :data="data" :props="defaultProps" @node-click="handleNodeClick"></el-tree>
            </el-aside>
            <input type="hidden" name="id" >
            <%--面板--%>
            <div id="pan" style="margin-top:-20px;margin-left:-20px;height: auto;width: auto">

                <el-container>
                    <el-container>
                        <el-main>

                            <template>
                                <%--列表--%>
                                <template>
                                    <div id="asd">
                                        <el-table ref="multipleTable" border :data="tableData" style="width: 100%"
                                                  @row-dblclick="handleDelete"
                                                  @row-contextmenu="handleEdit"
                                                  @selection-change="handleSelectionChange">
                                            <el-table-column  width="180">
                                                <%--店铺信息:&nbsp;&nbsp;<el-button type="primary" size="small" @click="Edit(scope.$index, scope.row)" slot="reference">修改</el-button>--%>
                                                <template slot-scope="scope">
                                                    &nbsp;&nbsp; <el-button size="mini" @click="Edit(scope.$index, scope.row)" >修改</el-button>
                                                </template>
                                            </el-table-column>
                                            <el-table-column prop="shopName" label="店铺名称" show-overflow-tooltip></el-table-column></br>
                                            <el-table-column prop="shopkeepersName" label="店主姓名" show-overflow-tooltip></el-table-column></br>
                                            <el-table-column prop="wechatAccount" label="微信" show-overflow-tooltip></el-table-column>
                                            <el-table-column prop="industryType" label="行业类型" show-overflow-tooltip></el-table-column>
                                            <el-table-column prop="shopAbbreviation" label="店铺简称" show-overflow-tooltip></el-table-column>
                                            <el-table-column prop="shopPhone" label="店铺电话" show-overflow-tooltip></el-table-column>
                                            <el-table-column prop="registrationTime" width="200" label="注册时间" show-overflow-tooltip></el-table-column>
                                            <el-table-column prop="shopAddress" label="店铺地址" show-overflow-tooltip></el-table-column>
                                        </el-table>
                                    </div>
                                </template>
                            </template>
                        </el-main>
                    </el-container>
                </el-container>
                <%--弹出框--%>
                <el-dialog  :visible.sync="messageVisible" width="33%" center
                            class="user-dialog">
                    <el-form :model="messageForm" :label-width="messageLabelWidth" ref="messageForm"
                             :validate-on-rule-change=false>
                        <el-form-item label="店铺名称" prop="shopName">
                            <el-input v-model="messageForm.shopName" placeholder="店铺名称"></el-input>
                        </el-form-item>
                        <el-form-item label="店主姓名" prop="shopkeepersName">
                            <el-input v-model="messageForm.shopkeepersName" placeholder="店主姓名"></el-input>
                        </el-form-item>
                        <el-form-item label="行业类型" prop="industryType">
                            <el-input v-model="messageForm.industryType" placeholder="行业类型"></el-input>
                        </el-form-item>
                        <el-form-item label="店铺简称" prop="shopAbbreviation">
                            <el-input v-model="messageForm.shopAbbreviation" placeholder="店铺简称"></el-input>
                        </el-form-item>
                        <el-form-item label="店铺电话" prop="shopPhone">
                            <el-input v-model="messageForm.shopPhone" placeholder="店铺电话"></el-input>
                        </el-form-item>
                        <el-form-item label="店铺地址" prop="shopAddress">
                            <el-input v-model="messageForm.shopAddress" placeholder="店铺地址"></el-input>
                        </el-form-item>
                    </el-form>
                    <div slot="footer" class="dialog-footer">
                        <el-button @click="messageVisible = false">取 消</el-button>
                        <el-button type="primary" @click=saveServer>确 定</el-button>
                    </div>
                </el-dialog>
</div>

<!--店铺信息-->
<%--dialog的button--%>
<%--<div id="dlg-buttons">
    <a href="javascript:void(0)" class="el-icon-success" iconCls="icon-ok" data-cmd="submit" style="width:90px">提交</a>
    <a href="javascript:void(0)" class="el-icon-error" iconCls="icon-cancel" data-cmd="cancel" style="width:90px">取消</a>
</div>--%>
</body>
<script src="/static/js/model/myPage/myPage.js"></script>
</html>
