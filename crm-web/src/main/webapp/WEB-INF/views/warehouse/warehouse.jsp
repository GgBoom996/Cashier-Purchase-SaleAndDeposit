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
                                        {{keyword}}
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
                                                    <el-table-column prop="contacts" label="管理员" show-overflow-tooltip></el-table-column>
                                                    <el-table-column prop="warehouseAddress" label="地址" width="180"></el-table-column>
                                                    <el-table-column prop="addTime" label="最后入库时间" width="280"></el-table-column>
                                                    <el-table-column prop="warehouseStatus" label="状态" width="180"></el-table-column>
                                                    <el-table-column prop="storemanage.storeName" label="所属店铺" width="180"></el-table-column>
                                                    <el-table-column prop="productValue" label="库存价值" width="180"></el-table-column>
                                                    <el-table-column  label="操作" width="180">
                                                        <template slot-scope="scope">
                                                            <el-button size="mini" @click="check(scope.$index, scope.row)">库存明细</el-button>
                                                            <%--<el-button size="mini" @click="Edit(scope.$index, scope.row)" >编辑</el-button>
                                                            <el-button size="mini" type="danger" @click="Delete(scope.$index, scope.row)">删除</el-button>--%>
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

        <el-dialog
                title="库存明细"
                :visible.sync="dialogVisible"
                width="30%"
                :before-close="handleClose">
            <template>
                <el-table
                        :data="zxx"
                        style="width: 100%">
                    <el-table-column
                            prop="product.productName"
                            label="商品名"
                            width="80">
                    </el-table-column>
                    <el-table-column
                            prop="product.productCode"
                            label="商品编号"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="product.inputPrice"
                            label="进货价">
                    </el-table-column>
                    <el-table-column
                            prop="productNum"
                            label="商品数量">
                    </el-table-column>
                    <el-table-column
                            prop="productValue"
                            label="商品总价">
                    </el-table-column>
                </el-table>
            </template>
            <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
            </span>
        </el-dialog>


                    <%--弹出框--%>
                    <el-dialog  :visible.sync="messageVisible" width="33%" center
                                class="user-dialog">
                        <el-form :model="messageForm" :label-width="messageLabelWidth" ref="messageForm"
                                 :validate-on-rule-change=false>

                            <el-form-item label="管理员" prop="contacts">
                                <el-input v-model="messageForm.contacts" placeholder="请输入用户名称"></el-input>
                            </el-form-item>
                            <el-form-item label="地址" prop="warehouseAddress">
                                <el-input v-model="messageForm.warehouseAddress" placeholder="请输入用户名称"></el-input>
                            </el-form-item>
                            <el-form-item label="所属店铺" prop="storeId">
                                <el-select placeholder="所属门店" @click.native="showstore()" v-model="storename">
                                    <el-option
                                            v-for="(v,i) in storelist"
                                            @click.native="store(i)">{{v.storeName}}
                                    </el-option>
                                </el-select>
                            </el-form-item>
                            <el-form-item label="仓库状态" prop="warehouseStatus">
                                <el-radio v-model="radio" :label=false>关闭</el-radio>
                                <el-radio v-model="radio" :label=true>开启</el-radio>
                            </el-form-item>



                        </el-form>
                        <div slot="footer" class="dialog-footer">
                            <el-button @click="messageVisible = false">取 消</el-button>
                            <el-button type="primary" @click=saveServer>确 定</el-button>
                        </div>
                    </el-dialog>

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
                radio:true,
                detail:[],
                dialogVisible: false,
                zxx:[],
                /* tableData: [],*/
                messageVisible: false,
                messageForm: {},
                messageLabelWidth: '90px',
                multipleSelection: [],
                keyword:'',
                currentPage:1,
                pageSize:10,
                total:10,

                storelist:[],
                storename:'',
                storeid:''
            }
        },


        created: function () {
            // 组件创建完后获取数据，
            // 此时 data 已经被 observed 了
            this.fetchData();
        },
        methods: {
            store(index){
                console.log(index)
                this.storename = this.storelist[index].storeName;
                this.storeid = this.storelist[index].id;
            },
            showstore(){
                this.$http.get('/util/findAllStore',{}).then(({body}) => {
                        console.log(body)
                        this.storelist = body;
                    }
                )
            },
            createServer(row) {
                console.log(123123);
                this.messageVisible = true;
                this.operate = 'create';
                let _form = Object.assign({}, row);
                this.messageForm = _form;
            },
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
                this.$http.post('/warehouse/list',{
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
                this.$http.post('/warehouse/list',{
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
           /* handleDelete(row, column, event) {
                console.log(row.id,);
                let params = {
                    id: row.id,
                };
                this.delete('/warehouse/saveOrUpdate', params);
            },*/


            Edit(index,row) {
                console.log(row);
                this.createServer(row);

            },
            check(index,row){
                this.zxx = row.warehousedetails;
                this.dialogVisible = true;
            },

           /* Delete(index,row) {
                console.log(row.id,);
                let params = {
                    id: row.id,
                };
                this.delete('/warehouse/saveOrUpdate', params);
            },*/

            saveServer() {
                console.log('save');
                let params = {
                    id:this.messageForm.id,
                    contacts: this.messageForm.contacts,
                    warehouseAddress: this.messageForm.warehouseAddress,
                    storeId: this.storeid,
                    warehouseStatus: this.radio,
                };
                this.$refs['messageForm'].validate((valid) => {
                    if (valid) {

                        if (this.messageForm.id) {
                            console.log(params);
                            let s = JSON.parse(JSON.stringify(params));
                            this.save('/warehouse/saveUpdate', s, 'messageVisible');
                        } else {
                            params.serverStatus = this.messageForm.serverStatus;
                            console.log(params);
                            let s = JSON.parse(JSON.stringify(params));
                            this.save('/warehouse/saveUpdate', s, 'messageVisible');
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
                    this.$message.error('添加成功');
                    /*location.reload();*/
                })
            },

            /*delete(url, params) {
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
            },*/
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
