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
        *{
            padding: 0;
            margin: 0;
        }
        .el-header, .el-footer {
            background-color: #fff;
            color: #fff;
            text-align: center;
            line-height: 60px;
            width: 100%;
        }

        .el-aside {
            background-color: #fff;
            color: #fff;
            text-align: center;
            line-height: 200px;
            height:100%;
        }

        .el-main {
            background-color: #fff;
            color: #fff;
            text-align: center;
            line-height: 160px;
        }
        .el-container.is-vertical{
            width: 100%;
            height: 100%;
        }
        /*body > .el-container {*/
            /*margin-bottom: 40px;*/
            /*height: 100%;*/
        /*}*/

        .el-container:nth-child(5) .el-aside,
        .el-container:nth-child(6) .el-aside {
            line-height: 260px;
        }

        .el-container:nth-child(7) .el-aside {
            line-height: 320px;
        }
        .el-container .el-container{
            height: 100%;
        }
    </style>
</head>
<body>
<div id="main" style="width:100%;height: 100%" >
    <el-container>
        <el-header>Header</el-header>
        <el-container>
                    <%--菜单--%>
                    <el-aside width="200px">
                        <el-row class="tac">
                            <el-col :span="24">
                                <el-menu
                                        default-active="2"
                                        class="el-menu-vertical-demo"
                                        background-color="#fff"
                                        router
                                        :unique-opened="true"
                                >
                                    <el-menu-item index="1-1"><i class="el-icon-s-home"></i>主页</el-menu-item>
                                    <el-submenu
                                            v-for="item in menus" :key="item.id"
                                            :index="item.id+''">
                                        <template slot="title">
                                            <i class="el-icon-s-unfold"></i>
                                            <span>{{item.name}}</span>
                                        </template>
                                        <el-menu-item-group>
                                            <el-menu-item v-for="subItem in item.children" :key="subItem.id"
                                                          :index="item.url+''" @click="open(subItem.url)">
                                                <i class="el-icon-tickets"></i>
                                                <span>{{subItem.url}}</span>
                                            </el-menu-item>
                                        </el-menu-item-group>
                                    </el-submenu>
                                </el-menu>
                            </el-col>
                        </el-row>
                    </el-aside>


            <el-main>
                <%--路由出口--%>
                <router-view></router-view>
            </el-main>

        </el-container>
    </el-container>
</div>
</body>

<script>
    /*创建路由的核心对象*/
    const main = function () {
        $.ajax({
            url:"/member/index",

        })
    }

    // 定义路由
    const routes = [
        { path: '/member/index', component: main() },
        { path: '/supplier/index', component: {template: `<div>wqeqweqweqeqweq</div>`} },
    ]
    //创建实列
    var router = new VueRouter({
        routes: routes
    })

    new Vue({
        el: "#main",
        router:router,
        methods:{
            clickItem:function(url){
                document.getElementById("mainFrame").src = url;
            },
            handleOpen(key, keyPath) {
                console.log(key, keyPath);
            },
            handleClose(key, keyPath) {
                console.log(key, keyPath);
            },
            handleSelect(key, keyPath) {
                console.log(key, keyPath);
            },
            open(url){
                console.debug(url)
                this.$router.push(url)
            }
        },
        data() {
            return {
                count: 0,
                menus: []
            };
        },
        created() {
            var _this = this;
            //ajax获取菜单
            $.get("/menu/findMenuByLoginUser", data => {
                console.info(data);
            _this.count = data.length;
            _this.menus = data;
        });
        },
    });

</script>



</html>
