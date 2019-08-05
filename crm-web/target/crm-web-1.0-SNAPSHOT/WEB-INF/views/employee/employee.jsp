<%--
  Created by IntelliJ IDEA.
  User: S
  Date: 2019/7/6
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <jsp:include page="/static/common/common_header.jsp" />
    <script src="https://cdn.bootcss.com/vue-resource/1.5.1/vue-resource.js"></script>



    <%--<script src="https://unpkg.com/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui@1.4.12/lib/index.js"></script>--%>
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
                                    <div align="left">
                                        <el-button type="primary" size="small" @click="createServer" slot="reference" >新增</el-button>

                                      <%--  <el-input v-model="keyword"
                                                  style="width: 200px"
                                                  placeholder="请输入内容">
                                        </el-input>
                                        <el-button slot="append" icon="el-icon-search"
                                                   @click="fetchData"
                                        ></el-button>--%>

                                    </div>
                                    <template>
                                        <%--列表--%>
                                        <template>
                                            <div id="app">
                                                <el-table ref="multipleTable" :data="tableData" border style="width: 100%"
                                                          @row-dblclick="handleDelete"
                                                          @row-contextmenu="handleEdit"
                                                          @selection-change="handleSelectionChange">
                                                    <el-table-column
                                                            type="index"
                                                            width="50"></el-table-column>
                                                    <el-table-column prop="id" label="编号" width="150" sortable></el-table-column>
                                                    <el-table-column prop="username" label="姓名"  width="150"></el-table-column>
                                                    <%--<el-table-column prop="password" label="密码" width="180"></el-table-column>--%>
                                                    <el-table-column prop="age" label="年龄" width="150"></el-table-column>
                                                    <el-table-column prop="postId" label="岗位" width="150"></el-table-column>
                                                    <el-table-column prop="iphone" label="电话" width="150"></el-table-column>
                                                    <el-table-column prop="pay" label="薪酬" width="150"></el-table-column>
                                                    <el-table-column prop="shopId" label="店铺" width="150"></el-table-column>
                                                    <el-table-column prop="initiationtime" label="入职时间" width="150"></el-table-column>
                                                    <el-table-column prop="addtime" label="添加时间" width="150">

                                                    </el-table-column>





                                                    <el-table-column  label="操作" show-overflow-tooltip>
                                                        <template slot-scope="scope">
                                                            <%--<el-button size="mini" @click="check(scope.$index, scope.row)">订单明细</el-button>--%>
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

                            <el-form-item label="姓名" prop="username">
                                <el-input v-model="messageForm.username" placeholder="请输入"></el-input>
                            </el-form-item>
                            <el-form-item label="密码" prop="password">
                                <el-input v-model="messageForm.password" placeholder="请输入"></el-input>
                            </el-form-item>
                            <el-form-item label="年龄" prop="age">
                                <el-input v-model="messageForm.age" placeholder="请输入"></el-input>
                            </el-form-item>
                            <el-form-item label="岗位" prop="postId">
                                <el-select v-model="messageForm.postId" placeholder="请选择">
                                    <el-option
                                            v-for="item in options"
                                            :key="item.value"
                                            :label="item.label"
                                            :value="item.value">
                                    </el-option>


                                <%--<el-input v-model="messageForm.postId" placeholder="请输入"></el-input>--%>
                            </el-form-item>
                            <el-form-item label="电话" prop="iphone">
                                <el-input v-model="messageForm.iphone" placeholder="请输入"></el-input>
                            </el-form-item>
                            <el-form-item label="薪酬" prop="pay">
                                <el-input v-model="messageForm.pay" placeholder="请输入"></el-input>
                            </el-form-item>
                            <el-form-item label="店铺" prop="shopId">
                                <%--<el-option
                                        v-for="item in options"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>--%>

                                <el-input v-model="messageForm.shopId" placeholder="请输入"></el-input>
                            </el-form-item>
                            <el-form-item label="入职时间" prop="initiationtime">
                                <el-date-picker
                                        v-model="messageForm.initiationtime"
                                        type="date"
                                        placeholder="选择日期"
                                        value-format="yyyy-MM-dd">
                                </el-date-picker>


                                <%--<el-input v-model="messageForm.initiationtime" placeholder="请输入"></el-input>--%>
                            </el-form-item>
                           <%-- <el-form-item label="添加时间" prop="addtime" >
                              <el-date-picker
                                        v-model="messageForm.addtime"
                                        type="date"
                                        placeholder="选择日期"
                                        value-format="yyyy-MM-dd">
                                </el-date-picker>
                                &lt;%&ndash;<el-input v-model="messageForm.addtime" placeholder="请输入"></el-input>&ndash;%&gt;
                            </el-form-item>--%>





                        </el-form>
                        <div slot="footer" class="dialog-footer">
                            <el-button @click="messageVisible = false">取 消</el-button>
                            <el-button type="primary" @click=saveServer>确 定</el-button>
                        </div>
                    </el-dialog>

        <%--采购订单明细展示框--%>
      <%--  <el-dialog  :visible.sync="messageVisible" width="33%" center
                    class="user-dialog">
            <el-form :model="messageForm" :label-width="messageLabelWidth" ref="messageForm"
                     :validate-on-rule-change=false>

                <el-form-item label="用户名" prop="productName">
                    <el-input v-model="messageForm.productName" placeholder="请输入用户名称"></el-input>
                </el-form-item>
                <el-form-item label="年龄" prop="dirId">
                    <el-input v-model="messageForm.dirId" placeholder="请输入用户名称"></el-input>
                </el-form-item>
                <el-form-item label="状态" prop="state">
                    <el-input v-model="messageForm.state" placeholder="请输入用户名称"></el-input>
                </el-form-item>
                <el-form-item label="姓名" prop="salePrice">
                    <el-input v-model="messageForm.salePrice" placeholder="请输入用户名称"></el-input>
                </el-form-item>



            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="messageVisible = false">取 消</el-button>
                <el-button type="primary" @click=saveServer>确 定</el-button>
            </div>
        </el-dialog>--%>

                </div>
            </el-main>
        </el-container>
    </el-container>
</div>


</body>
<script>
    var pan = new Vue({
        el: '#pan',
        data() {
            return {
                tableData: [],
                messageVisible: false,
                messageForm: {},
                messageLabelWidth: '90px',
                multipleSelection: [],
                keyword:'',




                currentPage:1,
                pageSize:10,
                total:10,


                form: {

                },
                options: [{
                    value: '店长',
                    label: '店长'
                }, {
                    value: '分店主管',
                    label: '分店主管'
                }, {
                    value: '收银',
                    label: '收银'
                }, {
                    value: '管理',
                    label: '管理'
                }, {
                    value: '收银2',
                    label: '收银2'
                }],
                value: '',
                value1: []


               /* op: [{
                    value: '店长',
                    label: '店长'
                }, {
                    value: '分店主管',
                    label: '分店主管'
                }, {
                    value: '收银',
                    label: '收银'
                }, {
                    value: '管理',
                    label: '管理'
                }, {
                    value: '收银2',
                    label: '收银2'
                }],
               /!* value: '',
                value1: []*!/*/




            }
        },
        created: function () {
            // 组件创建完后获取数据，
            // 此时 data 已经被 observed 了
            this.fetchData();
        },
        methods: {
            oggleSelection(rows) {
                if (rows) {
                    rows.forEach(function (row) {
                        this.$refs.multipleTable.toggleRowSelection(row);
                    });
                } else {
                    this.$refs.multipleTable.clearSelection();
                }
            },
            handleSelectionChange(val) {
                this.multipleSelection = val;
            },
            callbackFunction(result) {
                alert(result + "aaa");
            },
            fetchData(currentPage,pageSize,keywrod){
                this.$http.post('employee/page',{
                    page:this.currentPage,
                    row:this.pageSize,
                    keyword:this.keyword,
                }).then(({body}) => {
                    pan.tableData=body.rows,
                        pan.total=body.total,
                        console.log(this.keyword)
                })
                /* $.ajax({
                     url: "/product/list",
                     data: {
                         "page": currentPage,
                         "rows": pageSize,
                     },
                     dataType: "json",
                     error: function () {
                     },
                     success:function (pageList) {

                         pan.tableData = []
                         var tablelist = pan.tableData;
                         pan.total = pageList.total
                         console.log(pan.total)
                         for (var i = 0; i < pageList.rows.length; i++) {
                             pan.tableData.push(pageList.rows[i])
                         }
                     }
                 })*/
            },
            handleSizeChange(val) {
                this.pageSize = val;
                this.currentPage = 1;
                this.fetchData(1, val);
                console.log(`每页 ${val} 条`);
            },
            handleCurrentChange(val) {
                this.currentPage = val;
                this.fetchData(val, this.pageSize);
                console.log(`当前页: ${val}`);
            },
            keyfind(keyword){
                this.$http.post('employee/list',{
                    keyword:this.keyword,
                }).then(({body}) => {
                    pan.tableData=body.rows,
                        pan.total=body.total,
                        console.log(this.keyword)
                })
            },

            /*编辑*/
            handleEdit(row, column, event) {
                console.log(row);
                this.createServer(row);

            },
            handleDelete(row, column, event) {
                console.log(row.id,);
                let params = {
                    id: row.id,
                };
                this.delete('employee/remove', params);
            },
            check(index,row){
                console.log(row.orderdetails[0].product);
            },

            Edit(index,row) {
                console.log(row);
                this.createServer(row);



            },
            Delete(index,row) {
                console.log(row.id,);
                let params = {
                    id: row.id,
                };
                this.delete('employee/remove', params);
            },
            createServer(row) {
                console.log(row);
                this.messageVisible = true;
                this.operate = 'create';
                let _form = Object.assign({}, row);
                this.messageForm = _form;
            },
            saveServer() {
                console.log('save');
                let params = {
                    id:this.messageForm.id,
                    username: this.messageForm.username,
                    password: this.messageForm.password,

                    age: this.messageForm.age,
                    postId: this.messageForm.postId,
                    iphone: this.messageForm.iphone,
                    pay: this.messageForm.pay,
                    shopId: this.messageForm.shopId,
                    initiationtime: this.messageForm.initiationtime,
                    addtime: this.messageForm.addtime,


                };
                this.$refs['messageForm'].validate((valid) => {
                    if (valid) {

                        if (this.messageForm.id) {
                            console.log(params);
                            let s = JSON.parse(JSON.stringify(params));
                            this.save('employee/saveUpdate', s, 'messageVisible');
                        } else {
                            params.serverStatus = this.messageForm.serverStatus;
                            console.log(params);
                            let s = JSON.parse(JSON.stringify(params));
                            this.save('employee/saveUpdate', s, 'messageVisible');
                        }

                    }
                })
            },


            save(url, params, visible) {
                this.$http.post(url, params).then(({body}) => {
                    if (body.success === true) {
                        this.$message.success(body.message);
                        this.queryList();
                        if (visible !== '') {
                            this[visible] = false;
                        }
                    } else this.$message.error(body.message);
                }).catch(() => {
                    this.$message.error('删除成功');
                    location.reload();
                })
            },

            delete(url, params) {
                this.$confirm('该信息删除后无法恢复，确定要删除吗？', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning',
                }).then(() => {
                    this.$http.post(url, {}, {params: params}).then(({body}) => {
                        if (body.success === true) {
                            this.$message.success(body.message);
                        } else {
                            this.$message.error(body.message);
                        }
                    }).catch(() => {
                        this.$message.success('删除成功');
                        location.reload();
                    })
                }).catch(() => {
                    this.$message.info('已取消删除');
                })
            }
        }
    })
    /*$.ajax({
        url:"/product/list",
        dataType:"json",
        error:function(){
        },
        success:function(data){
                methods: {
                    current_change(currentPage){
                        this.currentPage = currentPage;
                    },
                   /!* current_change(currentPage,pagesize){
                        this.$http.post('/product/page',{
                            page:currentPage,
                            rows:this.pagesize,
                        }).then(({body}) => {
                            /!*console.log(body.rows);*!/
                            this.tableData= body.rows;
                            console.log(this.tableData);
                        });
                        this.currentPage = currentPage;
                        console.log(currentPage);
                        console.log(pagesize);
                    },*!/
                    keyfind(keyword){
                        this.$http.post('/product/page',{
                            keyword:this.keyword,
                        }).then(({body}) => {
                            console.log(this.keyword)
                        })
                    },
                    handleEdit(row, column, event) {
                        console.log(row);
                        this.createServer(row);

                    },
                    handleDelete(row, column, event) {
                        console.log(row.id,);
                        let params = {
                            id: row.id,
                        };
                        this.delete('/product/update', params);
                    },
                    createServer(row) {
                        console.log(row);
                        this.messageVisible = true;
                        this.operate = 'create';
                        let _form = Object.assign({}, row);
                        this.messageForm = _form;
                    },
                    saveServer() {
                        console.log('save');
                        let params = {
                            id:this.messageForm.id,
                            productName: this.messageForm.productName,
                            dirId: this.messageForm.dirId,
                            state: this.messageForm.state,
                            salePrice: this.messageForm.salePrice,
                        };
                        this.$refs['messageForm'].validate((valid) => {
                            if (valid) {

                                    if (this.messageForm.id) {
                                        console.log(params);
                                        let s = JSON.parse(JSON.stringify(params));
                                        this.save('/product/saveUpdate', s, 'messageVisible');
                                    } else {
                                        params.serverStatus = this.messageForm.serverStatus;
                                        console.log(params);
                                        let s = JSON.parse(JSON.stringify(params));
                                        this.save('/product/saveUpdate', s, 'messageVisible');
                                    }

                            }
                        })
                    },


                    save(url, params, visible) {
                        this.$http.post(url, params).then(({body}) => {
                            if (body.success === true) {
                                this.$message.success(body.message);
                                this.queryList();
                                if (visible !== '') {
                                    this[visible] = false;
                                }
                            } else this.$message.error(body.message);
                        }).catch(() => {
                            this.$message.error('删除成功');
                            location.reload();
                        })
                    },

                    delete(url, params) {
                        this.$confirm('该信息删除后无法恢复，确定要删除吗？', '提示', {
                            confirmButtonText: '确定',
                            cancelButtonText: '取消',
                            type: 'warning',
                        }).then(() => {
                            this.$http.post(url, {}, {params: params}).then(({body}) => {
                                if (body.success === true) {
                                    this.$message.success(body.message);
                                } else {
                                    this.$message.error(body.message);
                                }
                            }).catch(() => {
                                this.$message.success('删除成功');
                                location.reload();
                            })
                        }).catch(() => {
                            this.$message.info('已取消删除')
                        })
                    },
                }


            })
        }
    });*/



</script>


</html>
