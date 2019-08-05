function formatterPermissions(v,r,i){
        return v.storeName;


    /*var permissions = [];
    $.each(v, function (i, o) {
        permissions.push(o.name);
    });
    return permissions;*/
}

$(function () {
    //变量的抽取:
    var memberDatagrid=$('#memberDatagrid');
    var memberDlg=$('#memberDlg');
    var  memberForm=$('#memberForm');


    //datagrid


    //按钮的事件
    var cmdObj={
        'add':function () {
            //弹出一个dialog,里面装form表单  memberDlg
            memberDlg.dialog('open').dialog('center').dialog('setTitle','会员添加');
            //清空表单
            memberForm.form('clear');
        },
        'edit':function () {
            //先获取编辑的数据
            var row = memberDatagrid.datagrid('getSelected');
            //做一个判断:是否选中
            if (row){
                //弹出dialog,进行数据的回显
                //弹出一个dialog,里面装form表单  memberDlg
                memberDlg.dialog('open').dialog('center').dialog('setTitle','会员修改');
                //清空表单
                memberForm.form('clear');
                //表单数据的回显:
                memberForm.form('load',row);

            }else{
                $.messager.alert('温馨提示','请选中需要编辑的行!!','warning');
            }
        },
        'delete':function () {
            //先获取删除的数据
            var row = memberDatagrid.datagrid('getSelected');
            //做一个判断:是否选中
            console.log(row)
            if (row){
                $.messager.confirm('温馨提示','你确定删除:[<font color="pink">'+row.nickName+"</font>]吗?",function(r){
                    // 选中:确认的操作:调用后台的删除方法:发送ajax调用
                    if (r){
                        // 发送ajax调用 $.get(url,params,function(d){},type)
                        $.get('member/delete?id='+row.id,function (d) {
                            //d的处理
                            if(d.success){
                                //true:成功
                                $.messager.alert('操作提示',"删除成功",'info ');
                                //页面刷新
                                cmdObj.refresh();
                            }else{
                                //false:失败:提示
                                $.messager.alert('错误提示',"删除失败",'error');
                            }

                        },'json')
                    }
                });
            }else{
                $.messager.alert('温馨提示','请选中需要删除的行!!','warning');
            }
        },
        'refresh':function () {
            //datagrid的重新加载: $("selector").datagrid('funName');
            memberDatagrid.datagrid('reload');
        },
        'submit':function(){
            //提交:表单的提交:
            memberForm.form('submit', {
                url:'member/saveOrUpdate',
                success:function(data){
                    // {"success":true,"msg":"操作成功"}==>json字符串
                    var result = $.parseJSON(data);
                    console.log(result)
                    //弹框提示和刷新
                    if(result.success){
                        $.messager.alert("提示","操作成功","info");
                    }else{
                        $.messager.alert("提示","操作失败","info");

                    }

                    memberDlg.dialog('close');
                    //页面刷新
                    cmdObj.refresh();
                }
            });
        },
        'cancel':function(){
            //关闭dialog,不清空form,在打开dialog的时候清空
            memberDlg.dialog('close');
        },
        'search':function () {
            //获取关键字
            var keyword = $("#keyword").val();
            //查询
            memberDatagrid.datagrid("load",{"keywords":keywords});
        },

    };

    //toolbar绑定事件:如果按钮禁用了怎么办?下午具体实现
    $("a[data-cmd]").on('click',function () {
        //data-cmd="add"
        var dataCmd=$(this).data('cmd');
        cmdObj[dataCmd]();
    });

    memberDatagrid.datagrid({
        url: 'member/list',
        fit:true,
        title:'会员管理',
        rownumbers:true,
        pagination:true,
        singleSelect:true,
        toolbar:"#toolbar",
        columns: [[
            /*使用遍历:遍历的是Velocity中上下文的对象:
            * fieldList
            *          {field: 'id', title: 'id', width: '10%',align:  'center'},
            * */
            {field: 'userName', title: '会员账号', width: '10%',align:  'center'},
            {field: 'nickName', title: '会员昵称', width: '10%',align:  'center'},
            //{field: 'password', title: '会员密码', width: '10%',align:  'center'},
            {field: 'tel', title: '会员电话', width: '10%',align:  'center'},
            {field: 'state', title: '会员等级', width: '10%',align:  'center'},
            {field: 'integral', title: '会员积分', width: '10%',align:  'center'},
            {field: 'balance', title: '会员余额', width: '10%',align:  'center'},
            {field: 'storemanage', title: '所属商店', width: '10%',align:  'center',formatter:formatterPermissions},
            //{field: 'total', title: '总充值金额', width: '10%',align:  'center'},
            {field: 'birthday', title: '会员生日', width: '10%',align:  'center'},
        ]]
    });
});