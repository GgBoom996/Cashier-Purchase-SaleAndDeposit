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
    <title>供应商</title>
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
                                                <el-table-column prop="supplier" label="供应商" show-overflow-tooltip></el-table-column>
                                                <el-table-column prop="payable" label="应付欠款" show-overflow-tooltip></el-table-column>
                                                <el-table-column prop="refundsReceivable" label="应收退款" show-overflow-tooltip></el-table-column>
                                                <el-table-column prop="contacts" label="联系人" show-overflow-tooltip></el-table-column>
                                                <el-table-column prop="contactNumber" label="联系人电话" show-overflow-tooltip></el-table-column>
                                                <el-table-column  type="datetime"  prop="addTime"   label="添加时间" value-format="yyyy-MM-dd HH:mm:ss" width="200px" show-overflow-tooltip></el-table-column>
                                                <el-table-column prop="employeeId" label="操作人员" show-overflow-tooltip></el-table-column>
                                                <el-table-column prop="remarks" label="备注" show-overflow-tooltip></el-table-column>
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
                <el-form-item label="供应商" prop="supplier">
                    <el-input v-model="messageForm.supplier" placeholder="请输入供应商名称"></el-input>
                </el-form-item>
                <el-form-item label="应付欠款" prop="payable">
                    <el-input v-model="messageForm.payable" placeholder="请输入应付欠款"></el-input>
                </el-form-item>
                <el-form-item label="应收退款" prop="refundsReceivable">
                    <el-input v-model="messageForm.refundsReceivable" placeholder="请输入应收退款"></el-input>
                </el-form-item>
                <el-form-item label="联系人" prop="contacts">
                    <el-input v-model="messageForm.contacts" placeholder="请输入联系人"></el-input>
                </el-form-item>
                <el-form-item label="联系人电话" prop="contactNumber">
                    <el-input v-model="messageForm.contactNumber" placeholder="请输入联系人电话"></el-input>
                </el-form-item>
                <el-form-item label="操作人员" prop="employeeId">
                    <el-input v-model="messageForm.employeeId" placeholder="操作人员"></el-input>
                </el-form-item>
                <el-form-item label="备注" prop="remarks">
                    <el-input v-model="messageForm.remarks" placeholder="请输入备注"></el-input>
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
<script src="/static/js/model/supplier/supplier.js"></script>
</html>
