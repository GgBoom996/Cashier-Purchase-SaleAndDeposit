<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/2
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  request.getScheme() -> http
  request.getServerName() -> 服务名 ： localhost
  request.getServerPort() -> 端口
  request.getContextPath() -> 获取上下路径
--%>
<%
    //http://localhost:80/crm/
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>" >

<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/icon.css">
<script type="text/javascript" src="static/js/jquery.min.js"></script>

<script type="text/javascript" src="static/js/easyui/jquery.easyui.min.js"></script>

<script type="text/javascript" src="static/js/vue.js"></script>

<script type="text/javascript" src="static/js/vue-router.js"></script>

<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>


<%-- 汉化包js--%>
<script type="text/javascript" src="static/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<%--标题图标--%>
<link rel="icon" type="image/png" href="/static/onlineMall/images/title.png" />
