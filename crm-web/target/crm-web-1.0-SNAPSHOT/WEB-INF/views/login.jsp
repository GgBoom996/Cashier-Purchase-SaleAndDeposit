<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/static/common/common_header.jsp"/>
    <%-- 基于jquery的扩展js--%>
    <script type="text/javascript" src="/static/js/jquery.jdirk.js"></script>
    <title>在线商城</title>

</head>
<body>
<div align="center" style="margin-top: 100px;">
    <div class="easyui-panel" title="员工登陆" style="width: 350px; height: 240px;">
        <form id="loginForm" class="easyui-form" method="post">
            <table align="center" style="margin-top: 15px;">
                <tr height="20">
                    <td>用户名:</td>
                </tr>
                <tr height="10">
                    <td><input name="username" class="easyui-validatebox" required="true"  value="admin" /></td>
                </tr>
                <tr height="20">
                    <td>密&emsp;码:</td>
                </tr>
                <tr height="10">
                    <td><input name="password" type="password" class="easyui-validatebox" required="true" value="admin" /></td>
                </tr>
                <tr height="40">
                    <td align="center"><a href="javascript:;" class="easyui-linkbutton" onclick="submitForm();">登陆</a> <a
                            href="javascript:;" class="easyui-linkbutton" onclick="resetForm();">重置</a></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
<script>
    if(window != top){
        top.location.href = window.location.href
    }
    $(function () {
        $(document.documentElement).on("keyup", function (e) {
            if(e.keyCode==13){
                submitForm();
            }
        });
    });
    function submitForm(){
        var jsonObj = $("#loginForm").serializeObject();
        $('#loginForm').form('submit', {
            url:"/login",
            onSubmit: function(){
                return $("#loginForm").form("validate");
            },
            success:function(data){
                var result = $.parseJSON(data);
                if(result.success){//表示登录成功
                    //跳转到主界面
                    window.location.href = "index/main";
                }else{
                    $.messager.alert("错误", result.msg, "error");
                }
            }
        });

    }
</script>
</html>
