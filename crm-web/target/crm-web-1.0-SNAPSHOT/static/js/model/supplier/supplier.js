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

            pickerOptions: {
                disabledDate(time) {
                    return time.getTime() > Date.now();
                },
            },
            value1: '',
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
            this.$http.post('/supplier/page',{
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
            this.$http.post('/supplier/page',{
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
            this.delete('/supplier/delete', params);
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
            this.delete('/supplier/remove', params);
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
                supplier: this.messageForm.supplier,
                payable: this.messageForm.payable,
                refundsReceivable: this.messageForm.refundsReceivable,
                contacts: this.messageForm.contacts,
                addTime: this.messageForm.addTime,
                employeeId: this.messageForm.employeeId,
                remarks: this.messageForm.remarks,
            };
            this.$refs['messageForm'].validate((valid) => {
                if (valid) {
                    if (this.messageForm.id) {
                        console.log(params);
                        let s = JSON.parse(JSON.stringify(params));
                        this.save('/supplier/saveUpdate', s, 'messageVisible');
                    } else {
                        params.serverStatus = this.messageForm.serverStatus;
                        console.log(params);
                        let s = JSON.parse(JSON.stringify(params));
                        this.save('/supplier/saveUpdate', s, 'messageVisible');
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
                this.$message.success('添加成功');
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