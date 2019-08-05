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
    <title>角色管理</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <jsp:include page="/static/common/common_header.jsp" />
    <script src="https://cdn.bootcss.com/vue-resource/1.5.1/vue-resource.js"></script>
    <style>
        .el-header, .el-footer {
            background-color: #B3C0D1;
            color: #333;
            text-align: center;
            line-height: 60px;
        }

        .el-aside {
            background-color: #D3DCE6;
            color: #333;
            text-align: center;
            line-height: 200px;
        }

        .el-main {
            background-color: #E9EEF3;
            color: #333;
            text-align: center;
            line-height: 160px;
        }

        body > .el-container {
            margin-bottom: 40px;
        }

        .el-container:nth-child(5) .el-aside,
        .el-container:nth-child(6) .el-aside {
            line-height: 260px;
        }

        .el-container:nth-child(7) .el-aside {
            line-height: 320px;
        }

        .el-header {
            background-color: #B3C0D1;
            color: #333;
            line-height: 60px;
        }

        .el-aside {
            color: #333;
        }
    </style>


</head>
<body>

<div id="main">
    <el-container style="height: 100%">
        <el-header high="30px">
            <%--头部--%>
        </el-header>
        <el-container >
            <el-aside width="200px" high="500px">
                <%--菜单--%>
                <el-tree :data="data" :props="defaultProps" @node-click="handleNodeClick"></el-tree>

            </el-aside>
            <el-main>
                <%--面板--%>
                <div id="pan" style="margin-top:-20px;margin-left:-20px;height: auto;width: auto">

                    <el-container>

                        <el-container>
                            <el-main>
                                <div>
                                    <el-button type="primary" size="small" @click="createServer" slot="reference">新增</el-button>

                                    <el-input v-model="keyword"
                                              style="width: 200px"
                                              placeholder="请输入内容">
                                    </el-input>
                                    <el-button slot="append" icon="el-icon-search"
                                               @click="fetchData"
                                    ></el-button>
                                </div>
                                <template>
                                    <%--列表--%>
                                    <template>
                                        <div id="asd">
                                            <el-table ref="multipleTable" :data="tableData" border style="width: 100%"
                                                      @row-dblclick="handleDelete"
                                                      @row-contextmenu="handleEdit"
                                                      @selection-change="handleSelectionChange">
                                                <el-table-column
                                                        type="index"
                                                        width="50"></el-table-column>
                                                <el-table-column prop="id" label="编号" width="180" sortable></el-table-column>
                                                <el-table-column prop="name" label="角色名称" show-overflow-tooltip></el-table-column>
                                                <el-table-column prop="sn" label="角色编号" width="180"></el-table-column>
                                                <el-table-column  label="操作" width="180">
                                                    <template slot-scope="scope">
                                                        <el-button size="mini" @click="Edit(scope.$index, scope.row)" >编辑</el-button>
                                                        <el-button size="mini" type="danger" @click="Delete(scope.$index, scope.row)">删除</el-button>
                                                    </template>
                                                </el-table-column>
                                            </el-table>
                                            <el-pagination background
                                                           @size-change="handleSizeChange"
                                                           @current-change="handleCurrentChange"
                                                           :current-page="currentPage"
                                                           :page-sizes="[5, 10, 15, 20]"
                                                           :page-size="pageSize"
                                                           layout="total, sizes, prev, pager, next, jumper"
                                                           :total="total">
                                            </el-pagination>
                                        </div>
                                    </template>
                                </template>
                            </el-main>
                        </el-container>
                    </el-container>
        </el-container>



        <%--弹出框--%>
        <el-dialog  :visible.sync="messageVisible" width="33%" center
                    class="user-dialog">
            <el-form :model="messageForm" :label-width="messageLabelWidth" ref="messageForm"
                     :validate-on-rule-change=false>
                <el-form-item label="角色名称" prop="name">
                    <el-input v-model="messageForm.name" placeholder="请输入角色名称"></el-input>
                </el-form-item>
                <el-form-item label="角色编号" prop="sn">
                    <el-input v-model="messageForm.sn" placeholder="请输入角色编号"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="messageVisible = false">取 消</el-button>
                <el-button type="primary" @click=saveServer>确 定</el-button>
            </div>
        </el-dialog>

</div>



</el-main>
</el-container>
</el-container>
</div>


</body>
<script src="/static/js/model/role/role.js"></script>
</html>
