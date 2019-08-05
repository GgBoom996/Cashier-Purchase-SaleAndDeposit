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
        .el-dropdown{
            margin-left: -10px;

            width: 100%;
        }
        .el-aside {
            color: #333;
        }
        .el-dropdown-link {
            cursor: pointer;
            color: #606266;
            margin: 10px 20px;
            padding-top: 10px;
        }
        .el-icon-arrow-down {
            font-size: 12px;
        }
        .el-aaa{
            width: 20%;
            display: inline-block;
            float: left;
            position: absolute;
            top: 17px;
            left: 328px;
            height: 40px;
            margin-top: -9px;
            border: 1px solid #409EFF;
            color: #409EFF;
            border-radius: 5px;
        }

        .el-tag1{
            position: absolute;
            top: -293px;
            left: 84px;
            width: 18%;
            height: 40px;
            margin-top: 301px;
        }
        .el-tag2{
            position: absolute;
            top: -293px;
            left: 208px;
            width: 18%;
            height: 40px;
            margin-top: 301px;
        }
        .el-tag3{
            position: absolute;
            top: -293px;
            left: 332px;
            width: 18%;
            height: 40px;
            margin-top: 301px;
        }
        .el-tag4{
            position: absolute;
            top: -293px;
            left: 458px;
            width: 18%;
            height: 40px;
            margin-top: 301px;
        }
        .el-table__empty-block{
            display: none;
        }
        .el-row {
            margin-bottom: 20px;
        &:last-child {
             margin-bottom: 0;
         }
        }
        .el-col {
            border-radius: 4px;
        }
        .bg-purple-dark {
            background: #99a9bf;
        }
        .bg-purple {
            background: #d3dce6;
        }
        .bg-purple-light {
            background: #e5e9f2;
        }
        .grid-content {
            border-radius: 4px;
            min-height: 36px;
        }
        .row-bg {
            padding: 10px 0;
            background-color: #f9fafc;
        }
        .el-list{
            position: relative;
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
                                                    <el-table-column prop="documentNumber" label="订单编号"  width="180"></el-table-column>
                                                    <el-table-column prop="totalAmount" label="商品总数" width="180"></el-table-column>
                                                    <el-table-column prop="paymentAmount" label="总金额" width="180"></el-table-column>
                                                    <el-table-column prop="storemanage.storeName" label="进货门店" width="180"></el-table-column>
                                                    <el-table-column prop="makeTime" label="采购时间" width="200"></el-table-column>
                                                    <el-table-column prop="orderStatus" label="是否入库" width="120"></el-table-column>
                                                    <el-table-column prop="remarks" label="备注" width="280"></el-table-column>
                                                    <el-table-column  label="操作" show-overflow-tooltip>
                                                        <template slot-scope="scope">
                                                            <el-button size="mini" @click="check(scope.$index, scope.row,dialogVisible = true)">订单明细</el-button>
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
        <el-dialog
                title="订单明细"
                :visible.sync="dialogVisible"
                width="40%"
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
                            prop="prodctTotalnum"
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

                            <el-form-item label="订单编号" prop="documentNumber">
                                <el-input v-model="messageForm.documentNumber" placeholder="请输入订单编号"></el-input>
                            </el-form-item>
                            <el-form-item label="进货门店" prop="storemanage.storeName">
                            <el-select placeholder="进货门店" @click.native="showstore()" v-model="storename">
                                <el-option
                                        v-for="(v,i) in storelist"
                                        @click.native="store(i)">{{v.storeName}}
                                </el-option>
                            </el-select>
                            </el-form-item>
                            <el-form-item label="备注" prop="remarks">
                                <el-input v-model="messageForm.remarks" placeholder="请输入备注"></el-input>
                            </el-form-item>
                            <div class="button" style="width:5%;float:left;">
                                <P><el-button class="el-icon-plus" @click.prevent="addRow()"></el-button></P>
                            </div>&nbsp;&nbsp;&nbsp;
                            <div class="button" style="width:5%">
                                <p><el-button class="el-icon-minus" @click.prevent="delData()"></el-button></p>
                            </div>
                            <%--商品明细动态添加--%>
                            <template>
                                <div class="tableDate">
                                    <div class="table">
                                        <el-table
                                                :data="table"
                                                ref="table"
                                                tooltip-effect="dark"
                                                border
                                                stripe
                                                style="width: 100%"
                                                @selection-change='selectRow'>
                                            <el-table-column type="selection" width="45" align="center"></el-table-column>
                                            <el-table-column  label="商品名" align="center">
                                                <template slot-scope="scope">
                                                    <el-select placeholder="请选择商品" @click.native="show1()" v-model="showName">
                                                        <el-option
                                                                v-for="(v,i) in shopList"
                                                                @click.native="ok(i)">{{v.productName}}
                                                        </el-option>
                                                    </el-select>
                                                </template>
                                            </el-table-column>
                                            <el-table-column label="商品编号">
                                                <template slot-scope="scope">
                                                    <el-select placeholder="请选择商品" v-model="showCode">
                                                </template>
                                            </el-table-column>
                                            <el-table-column label="进货价">
                                                <template slot-scope="scope">
                                                    <el-select placeholder="请选择商品" v-model="showPrice">
                                                </template>
                                            </el-table-column>
                                            <el-table-column prop="name" label="数量">
                                                <template slot-scope="scope">
                                                    <el-input v-model="productNum"></el-input>
                                                </template>
                                            </el-table-column>
                                        </el-table>
                                    </div>
                                </div>
                            </template>
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
<script>
    var pan = new Vue({
        el: '#pan',
        data() {
            return {
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
                input: '',
                shopList:[],
                showName:'',
                showCode:"",
                showPrice:"",
                storelist:[],
                storename:"",
                storeid:'',
                table: [],
                selectlistRow: [],

                productid:1,
                productNum:'',

                productorderdetail: [{"productId":'',"productnum":''}]


            }
        },
        created: function () {
            // 组件创建完后获取数据，
            // 此时 data 已经被 observed 了
            this.fetchData();
        },
        methods: {
            selectRow (val) {
                this.selectlistRow = val
            },
            // 增加行
            addRow () {
                var list = {
                    rowNum: '',
                    address: this.address,
                    name: this.name,
                    weather: this.weather,
                    phone: this.phone,
                    date: this.date,
                    mdate: this.mdate,
                    loveer: this.loveer}
                this.table.unshift(list)
            },
            // 删除方法
            // 删除选中行
            delData () {
                for (let i = 0; i < this.selectlistRow.length; i++) {
                    let val = this.selectlistRow
                    // 获取选中行的索引的方法
                    // 遍历表格中tableData数据和选中的val数据，比较它们的rowNum,相等则输出选中行的索引
                    // rowNum的作用主要是为了让每一行有一个唯一的数据，方便比较，可以根据个人的开发需求从后台传入特定的数据
                    val.forEach((val, index) => {
                        this.table.forEach((v, i) => {
                            if (val.rowNum === v.rowNum) {
                                // i 为选中的索引
                                this.table.splice(i, 1)
                            }
                        })
                    })
                }
                // 删除完数据之后清除勾选框
                this.$refs.table.clearSelection()
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
            ok(index){
                console.log(index);
                this.showName = this.shopList[index].productName;
                this.showCode = this.shopList[index].productCode;
                this.showPrice = this.shopList[index].inputPrice;
                this.productorderdetail.push({"productId":''});
                this.productorderdetail[0].productId = this.shopList[index].id;
            },
            store(index){
                console.log(index)
                this.storename = this.storelist[index].storeName;
                this.storeid = this.storelist[index].id;

            },
            handleSelectionChange(val) {
                this.multipleSelection = val;
            },
            callbackFunction(result) {
                alert(result + "aaa");
            },
            fetchData(currentPage,pageSize,keywrod){
                this.$http.post('/purchasingandpurchasing/list',{
                    page:this.currentPage,
                    row:this.pageSize,
                    keyword:this.keyword,
                }).then(({body}) => {
                    pan.tableData=body.rows,
                        pan.total=body.total,
                        console.log(this.keyword)
                })
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
                this.$http.post('/purchasingandpurchasing/list',{
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
                this.delete('/purchasingandpurchasing/delete', params);
            },

            check(index,row){
                this.zxx= row.orderdetails;
                dialogVisible = true;
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
                this.delete('/purchasingandpurchasing/delete', params);
            },
            createServer(row) {
                console.log(row);
                this.messageVisible = true;
                this.operate = 'create';
                let _form = Object.assign({}, row);
                this.messageForm = _form;
            },
            /*改*/show1(){
                this.$http.get('/util/findProductAll',{}).then(({body}) => {
                    /*json=>array*/
                    /*for (key in body){
                        pan.shopList.push(key)*/
                    console.log(body)
                    this.shopList = body;
                    }
                )
            },
            showstore(){
                this.$http.get('/util/findAllStore',{}).then(({body}) => {
                        console.log(body)
                        this.storelist = body;
                    }
                )
            },
            add(){

            },
            saveServer() {
                this.productorderdetail.push({"productnum":''});
                this.productorderdetail[0].productnum = this.productNum;
                console.log('save');
                let params = {
                    id:this.messageForm.id,
                    documentNumber: this.messageForm.documentNumber,
                    storemanageId: this.storeid,
                    remarks: this.messageForm.remarks,
                    orderdetails: this.productorderdetail,
                };
                console.log(this.orderdetails);
                this.$refs['messageForm'].validate((valid) => {
                    if (valid) {

                        if (this.messageForm.id) {
                            console.log(params);
                            let s = JSON.parse(JSON.stringify(params));
                            this.save('/purchasingandpurchasing/saveUpdate', s, 'messageVisible');
                        } else {
                            params.serverStatus = this.messageForm.serverStatus;
                            console.log(params);
                            let s = JSON.parse(JSON.stringify(params));
                            this.save('/purchasingandpurchasing/saveUpdate', s, 'messageVisible');
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
                    /*location.reload();*/
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
                        /*location.reload();*/
                    })
                }).catch(() => {
                    this.$message.info('已取消删除')
                })
            },
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
