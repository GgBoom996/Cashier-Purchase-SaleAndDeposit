<%--
  Created by IntelliJ IDEA.
  User: WeigJ
  Date: 2019/7/10
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/static/common/common_header.jsp"/>
    <title>main</title>
    <style>
        .el-header {
            color: #333;
            text-align: center;
            line-height: 60px;
            box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
        }

        .el-footer {
            color: #333;
            text-align: center;
            line-height: 60px;
        }

        .el-aside {
            background-color: #fff;
            color: #fff;
            text-align: center;
        }

        .el-main {
            background-color: #fff;
            color: #333;
            text-align: center;
            line-height: 160px;
        }

        body > .el-container {
            margin-bottom: 40px;
            background: #fff;
        }

        .el-container:nth-child(5) .el-aside,
        .el-container:nth-child(6) .el-aside {
            line-height: 260px;
        }

        .el-container:nth-child(7) .el-aside {
            line-height: 320px;
        }

        html, body, #app, .el-container {
            margin: 0px;
            padding: 0px;
            height: 100%;
        }

    </style>
</head>
<body>
<div id="app">
    <el-container>
        <%--头部--%>
        <el-header>
            <el-row class="tac">
                <el-col :span="15" :offset="3">
                    <span>性感俊俊，在线买货</span>
                </el-col>
                <el-col :span="6">
                    <el-menu :default-active="1" class="el-menu-demo" mode="horizontal"
                    <%--@select="handleSelect"--%>
                             active-text-color="#409EFF"
                    >
                        <el-menu-item index="1">处理中心</el-menu-item>
                        <el-submenu index="2">
                            <template slot="title">我的工作台</template>
                            <el-menu-item index="2-1">假装有功能</el-menu-item>
                            <el-menu-item index="2-2">假装有功能</el-menu-item>
                            <el-menu-item index="2-3">假装有功能</el-menu-item>
                        </el-submenu>
                        <el-submenu index="4">
                            <template slot="title">
                                <img src=static/images/12.jpg style="height:80%;margin-top: 10%">
                            </template>
                            <el-menu-item index="4-1"><i class="el-icon-user"><shiro:principal property="username"/></i> </el-menu-item>
                            <el-menu-item index="4-2"><i class="el-icon-setting"></i>安全设置</el-menu-item>
                            <el-menu-item index="4-3">
                                <el-link href="/logout" target="_blank"><i class="el-icon-switch-button"></i>退出登陆
                                </el-link>
                            </el-menu-item>
                        </el-submenu>
                    </el-menu>
                </el-col>
            </el-row>
        </el-header>

        <el-container>

            <%--菜单--%>
            <el-aside width="200px">
                <el-row class="tac">
                    <el-col :span="24">
                        <el-menu default-active="2"
                                 class="el-menu-vertical-demo"
                                 background-color="#fff"
                                 router
                                 :unique-opened="true">
                            <el-menu-item index="/homepage/index" @click="open(homepage)"><i class="el-icon-s-home"></i>主页</el-menu-item>
                            <el-submenu v-for="firstMenu in menus" :key="firstMenu.id" :index="firstMenu.name">
                                <template slot="title">
                                    <i class="el-icon-s-unfold"></i>
                                    <span>{{firstMenu.name}}</span>
                                </template>
                                <el-menu-item-group>
                                    <el-menu-item v-for="secondMenu in firstMenu.children" :key="secondMenu.id"
                                                  :index="secondMenu.url" @click="open(secondMenu.url,firstMenu.name,secondMenu.name)">
                                        <span>{{secondMenu.name}}</span>
                                    </el-menu-item>
                                </el-menu-item-group>
                            </el-submenu>
                        </el-menu>
                    </el-col>
                </el-row>
            </el-aside>

            <el-container>
                <%--主页面--%>
                <el-main>
                    <el-breadcrumb separator-class="el-icon-arrow-right">
                        <el-breadcrumb-item>主页</el-breadcrumb-item>
                        <el-breadcrumb-item v-for="item in breads">{{item}}</el-breadcrumb-item>
                    </el-breadcrumb>
                    <iframe style="width:100%; height:100%; border: 0;" :src="iframeUrl"></iframe>
                    <%--http://baimeida.com.cn.segmentfault.com/login;jsessionid=867E217544C0D1AFF484550F77EA3140--%>
                </el-main>

                <%--底部--%>
                <el-footer>Footer</el-footer>
            </el-container>
        </el-container>
    </el-container>
</div>
</body>
<script src="/static/js/model/main.js"></script>
</html>
