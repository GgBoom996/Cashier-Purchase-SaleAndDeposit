<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" />
    <meta name="keyword" content="会员管理软件">
    <meta name="description" content="会员管理软件">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>会员管理软件</title>
    <!--title图标-->

    <%@include file="/static/common/common_header.jsp"%>
    <%--<script src="/static/onlineMall/js/n3common-lib.min.js"></script>
    <script src="/static/onlineMall/js/onlineMall.js"></script>--%>
    <script src="/static/onlineMall/js/swiper.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/onlineMall/css/onlineMall.css">

    <link href="/static/onlineMall/css/system-lib.min.css?v=9Xd3pdMqRJ9LjMjCGFmd_FhvNXc1ZRBDl53oaMmZpXo" rel="stylesheet" />
</head>
<body>

<!--消息-->
<div class="newscenter">
    <div class="newscenter-nav">
        <ul id="newscenter-nav">
            <li class="active">业务消息</li>
            <li class="messageli" data-type="2">系统消息</li>
            <li class="messageli" data-type="5">更新日志</li>
        </ul>
    </div>
    <!--业务消息-->
    <div class="newscenter-content active">
        <ul id="messagehtml"></ul>
    </div>
    <!--业务消息-->
    <!--系统公告-->
    <div class="newscenter-content">
        <ul id="systemMessageList_new"></ul>
    </div>
    <!--系统公告-->
    <!--升级公告-->
    <div class="newscenter-content">
        <ul id="logMessageList_new"></ul>
    </div>
    <!--升级公告-->
</div>
<!--消息-->
<!--硬件购物车-->
<div class="hardwarecart-center" id="hardwarecart-center">
    <div class="hardwarelist" style="padding-top: 60px;">
        <div class="tltle">
            <div class="selecthardware fl">
                <input type="checkbox" id="allhardwarelist" class="checkinput" value="" />
                <label for="allhardwarelist">全选</label>
            </div>
            <button id="deletehardwarelist" class="btn btn-default fr deletehardwarelist">删除选中的商品</button>
        </div>
        <div class="hardwarelist-center">
            <ul id="cartHtml"></ul>
        </div>
        <div class="gocart">
            <input type="hidden" id="cartId" value="" />
            <div class="hardwarepricebox"><span>总价: </span><i style="font-size:18px;" class="colorff" id="cartMoney">0.00</i></div>
            <a href="javascript:void(0);" id="gotohardwareprice" class="hardwarepricebox go-btn">去结算</a>
        </div>
        <div class="showblocktip">
            <ul>
                <li class="imgbg3 imgbg" id="showhardwareorderlist">
                    <div class="imgbg3 imgbg">
                        <i class="riceblock" id="hardwareCountsInput">0</i>
                    </div>
                    <p>购物车</p>
                </li>
                <li id="advisory">
                    <div class="imgbg2 imgbg"></div>
                    <p>联系我们</p>
                    <div class="lefttip" id="advisory-info">
                        <p class="title_1" style="font-size: 15px;">咨询热线</p>
                        <p class="list_box_small_2" style="font-size: 18px;color: #31C47B;">400 0521 131</p>
                        <div style="height: 60px;">
                            <p>电话咨询服务时间 </p>
                            <p>周一至周日 9:00至22:00</p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="imgbg1 imgbg"></div>
                    <p>微信商城</p>
                </li>
            </ul>
        </div>
    </div>
</div>
<!--硬件购物车-->
<!--帮助中心-->
<div class="nav-content helpcenter">
    <ul>
        <li>
            <h4 class="text-center helptitle">帮助</h4>
        </li>
        <li>
            <select name="" class="form-control input-sm selectbox">
                <option value="0">向德客团队反馈问题</option>
            </select>
        </li>
        <li>
            <textarea class="textarea form-control" name="userfeedback_content" id="userfeedback_content" placeholder="说明您的问题，并留下您的联系方式以便我们与您联系"></textarea>
        </li>
        <li>
            <button type="button" id="btnAddUserFeedback" class="btn sendbtn btn-info">发送</button>
        </li>
        <li class="helphref">
            <a data-toggle="modal" data-target="#myModalall" href="http://v.youku.com/v_show/id_XMTY3MjU5NTg4MA==.html" target="_blank"><i class="icon-facetime-video paddingright10"></i>视频教程</a>
            <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=961917159&amp;site=qq&amp;menu=yes" target="_blank"><i class="icon-wrench paddingright10"></i>技术支持</a>
            <a id="productOperationManual" target="_blank" href=""><i class="icon-book paddingright10"></i>产品操作手册</a>
            <a href="http://www.decerp.cn/res/德客软件.exe"><i class="icon-desktop paddingright10"></i>客户端下载</a>
        </li>
    </ul>
</div>
<!--外卖订单详情-->
<div class="takeawayorderinfobox" id="takeawayorderinfobox" style="right:-530px;">
    <div class="takeawayorder-title status1">
        <button type="button" class="btn returnbtn fl">返回</button><span style="color:white;">.</span>
        <button type="button" class="btn print_takeawayorder f1" style="float:left;">打印</button>
        <span class="">订单详情</span>
        <img id="sv_delivery_status" class="status" src="" alt="" />
    </div>
    <div class="takeawayorderinfo">
        <ul>
            <li><i class="iconfont icon-dingdan iii1"></i>订单编号：<i id="wt_nober"></i><i class="fr" id="wt_datetime"></i></li>
            <li><i class="iconfont icon-icon-copy iii2"></i>配送方式：<i id="meituanDeliveryMethod">商家配送</i><i class="" style="margin-left:35px;" id="wt_datetime2"></i></li>
            <li><i class="iconfont icon-zhifufangshi iii3"></i>会员信息：<i id="sv_member_info"></i></li>
            <li><i class="iconfont icon-zhifufangshi iii3"></i>支付方式：<i id="sv_payment_type"></i></li>
            <li id="paymentStatus"><i class="iconfont icon-zhifufangshi iii3"></i>付款状态：<i id="sv_shop_payment_status"></i></li>
            <li><i class="iconfont icon-mendian iii4"></i>下单门店：<i id="ThisShopName"></i></li>
            <li><i class="iconfont icon-unie609 iii5"></i><i style="color:#333;" id="address_info">收货地址：</i><i id="sv_receipt_name"></i><i style="margin-left:30px;" id="sv_receipt_phone"></i></li>
            <li class="useraddress"><i id="sv_receipt_address"></i></li>
            <!-- 物流信息-->
            <li id="sv_deliver_company_li"><i class="iconfont icon-zhifufangshi iii3"></i>物流信息：<i id="sv_deliver_company"></i><i id="sv_deliver_orderno"></i></li>
            <li id="sv_deliver_sender_li"><i class="iconfont icon-zhifufangshi iii3"></i>配送人：<i id="sv_deliver_sender"></i><i id="sv_deliver_sendertel"></i></li>
            <li id="sv_deliver_remark_li"><i class="iconfont icon-zhifufangshi iii3"></i>物流备注：<i id="sv_deliver_remark"></i></li>
        </ul>
    </div>
    <div class="foodlist scrollstyle" id="foodlistbox">
        <ul id="foodlist"></ul>
        <dl id="sv_order_remarks_text">
            <dd id="sv_order_remarks_text2"></dd>
        </dl>
        <div class="meituancaution" id="meituancaution">
            <dl id="">
                <dd id="meituandinnersNumber"></dd>
                <dd id="meituancautioninfo"></dd>
                <dd id="meituanSreduce_fee"></dd>
            </dl>
            <dl id="activeInfo"></dl>
        </div>
        <div class="morenumber">
            <span>还有<i id="productNumber"></i>件&or;</span>
        </div>
    </div>
    <div class="ordermoney">
        <ul>
            <li><i class="iconfont icon-zhifufangshi typel"></i><span class="fl">合<i class="transparent">计合</i>计：</span><span class="fr moneyinfo" id="sv_order_receivable">¥<i>0.00</i></span></li>
            <li id="freight_display_none"><span class="fl">运<i class="transparent">计合</i>费：</span><span class="fr moneyinfo">¥ <i id="meituanfreight">0.00</i></span></li>
            <li><span class="fl">优惠金额：</span><span class="fr moneyinfo">¥ <i id="discountedPrice">0.00</i></span></li>
            <li id="memberDiscount"><span class="fl">会员折扣：</span><span class="fr moneyinfo"><i id="sv_member_discount"></i></span></li>
            <li><span class="fr moneyinfo">实付：<i class="moneyred" id="sv_order_actual_money">¥ 0.00</i></span></li>
            <li style="display:none;" id="sv_order_remarks"><span class="fl">备注信息：</span><span id="sv_order_remarks_info"></span></li>
        </ul>
    </div>
</div>
<!--外卖订单详情-->
<div class="decerp-content decerpindex">
    <!--decerpindex-->
    <div class="center-content" id="index-content">
        <div id="shopSalesContent" class="shopSalesContent">
            <div class="shopSalesContenttext">
                <span id="salescontenttext"></span>
                <a class="buyshopbtn" id="buyshopbtn_pay" href="/home/VersionList_N3">立即升级</a>
            </div>
        </div>
        <style>
            .buyversionlist .buyversionlist .shareversionlist{
                width: 24.2%;
                height: 325px;
                background:#ffffff;
                padding-top: 0px;
                padding-left: 0px;
                padding-right: 0px;
            }
            .newrecommendedlist .new-shops{
                overflow:hidden;
                background:#f5f5f5;
            }
            .newrecommendedlist .new-shops li{
                float:left;
                width:20%;
                line-height:30px;
                text-align:center;
                background:#fff;
                border-right:8px solid #f5f5f5;
                border-bottom:8px solid #f5f5f5;
            }
            .newrecommendedlist .new-shops li img{
                margin-top: 35px;
                margin-bottom: 20px;
            }
            .newrecommendedlist .new-shops li .buy{
                padding-left: 15px;
                padding-right: 15px;
                line-height: 37px;
                color: #fff;
                background-color: #ff6666;
                display: block;
                width: 90px;
                margin: auto;
                background-color: #31C17B;
                margin-top: 22px;
                margin-bottom: 20px;
                width: 120px;
                height: 37px;
                text-align: center;
                border-radius:5px;
            }
            .buyversionlist .buyversionlist .shareversionlist .setposition .versionset{
                padding-top:37px;
            }
            .versionMoneynew{
                font-size:60px;
            }
            .buyversionlist .buyversionlist .shareversionlist .newversionimg{
                height:163px;
            }
        </style>
        <div class="content container-fluid">
            <!--导航栏-->
            <div class="content-title-nav">
                <div class="content-title-navlist marginAuto_Nav">
                    <%--跳转路径 --%>
                    <a class="fl" href="/onlineMall/index"><i class="borderbottom"> </i>软件购买</a>
                    <a class="fl" href="/onlineMall/hardwareService_N3">硬件超市</a>
                    <a class="fl" href="/onlineMall/hardwareService_N3">版本对比</a>
                    <a class="fl" href="/onlineMall/hardwareService_N3">个人中心</a>
                </div>
            </div>
            <!--导航栏-->
            <!--软件服务-->
            <div class="share-container hardwareService" style="margin-bottom: 160px;">
                <!--SWIPER轮播-->
                <div class="main" id="main">
                    <div class="banner" id="banner">
                        <a >
                            <div class="banner-slide slide1"></div>
                        </a>
                        <a >
                            <div class="banner-slide slide2"></div>
                        </a>
                        <a >
                            <div class="banner-slide slide3"></div>
                        </a>
                        <!-- 如果需要分页器 -->
                        <div class="swiper-pagination"></div>
                        <!-- 如果需要导航按钮 -->
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                </div>
                <script type="text/javascript" src="/static/onlineMall/js/onlineMall.js"></script>
                <!--SWIPER轮播-->
                <div class="hardwareServicebox">
                    <!--购买版本-->
                    <div class="Valueadded">
                    <span>软件购买</span>
                </div>
                    <div class="buyversionlist">
                        <div class="buyversionlist">
                            <div class="shareversionlist">
                                <div class="versioninfo">
                                    <img class="versionimg newversionimg" src="/static/onlineMall/images/1.1.png" />
                                    <div class="setposition">
                                        <p class="version color1">高级版</p>
                                        <p class="versionset">￥<i class="color1 versionMoney versionMoneynew">298</i>/年</p>
                                    </div>
                                </div>
                                <div class="versionfunctionlist versionfunctionlist1">
                                    <p>适合拥有店员的发展型店铺</p>
                                    <a class="buybtn buybtnbg1 buybtnbgbnew1" href="/Home/Payheight_N3?id=4">立即购买</a>
                                </div>
                            </div>
                            <div class="shareversionlist">
                                <div class="versioninfo">
                                    <img class="versionimg newversionimg" src="/static/onlineMall/images/1.2.png" />
                                    <div class="setposition">
                                        <p class="version color2">连锁版</p>
                                        <p class="versionset">￥<i class="color2 versionMoney versionMoneynew">298</i>/店/年</p>
                                    </div>
                                </div>
                                <div class="versionfunctionlist versionfunctionlist1">
                                    <p>适合中小型连锁店铺</p>
                                    <a class="buybtn buybtnbg2 buybtnbgbnew2" href="/Home/Payheight_N3?id=3">立即购买</a>
                                </div>
                            </div>
                            <div class="shareversionlist">
                                <div class="versioninfo">
                                    <img src="/static/onlineMall/images/1.5.png" alt="" style="position: absolute;top:0px;left: 0px;" />
                                    <img class="versionimg newversionimg" src="/static/onlineMall/images/1.3.png" />
                                    <div class="setposition">
                                        <p class="version color1">行业版</p>
                                        <p class="versionset">￥<i class="color1 versionMoney versionMoneynew">598</i>/年</p>
                                    </div>
                                </div>
                                <div class="versionfunctionlist versionfunctionlist1">
                                    <p>适合有行业管理需求的成熟店铺</p>
                                    <a class="buybtn buybtnbg1 buybtnbgbnew1" style="background:#ffd800" href="javascript:void(0)">敬请期待</a>
                                </div>
                            </div>
                            <div class="shareversionlist">
                                <div class="versioninfo">
                                    <img class="versionimg newversionimg" src="/static/onlineMall/images/1.4.png" />
                                    <div class="setposition">
                                        <p class="version color3">至尊版</p>
                                        <p class="versionset">￥<i class="color3 versionMoney versionMoneynew">1098</i>/永久</p>
                                    </div>
                                </div>
                                <div class="versionfunctionlist versionfunctionlist1">
                                    <p>适合有行业管理需求的成熟型店铺</p>
                                    <a class="buybtn buybtnbg3 buybtnbgbnew3" href="/Home/Payheight_N3?id=5">立即购买</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--购买版本-->
                    <!--选择行业-->
                    <div class="Valueadded">
                        <span>选择行业</span>
                    </div>
                    <div class="recommendedlist  newrecommendedlist table-responsive">
                        <table class="table sharetable newsharetableOne" style="max-width: 100.7%; border:none; margin-bottom: 0px;">
                            <tbody class="tablebordernone">
                            <tr>
                                <td class="text-center" style="position:relative;">
                                    <img src="/static/onlineMall/images/1.5.png" alt="" style="position: absolute;top:-34px;left: 0px;width: 46px;" />
                                    <img src="/static/onlineMall/images/2.1.png" alt="餐饮"><br>
                                    <span class="lineheigt25">餐饮</span><br>
                                    <span class="colorff lineheigt25">￥598/年/店</span><br>
                                    <a class="buy" href="javascript:void(0)">敬请期待</a>
                                </td>
                                <td class="text-center" style="position:relative;">
                                    <img src="/static/onlineMall/images/1.5.png" alt="" style="position: absolute;top:-34px;left: 0px;width: 46px;" />
                                    <img src="/static/onlineMall/images/2.2.png" alt="美业"><br>
                                    <span class="lineheigt25">美业</span><br>
                                    <span class="colorff lineheigt25">￥598/年/店</span><br>
                                    <a class="buy" href="javascript:void(0)">敬请期待</a>
                                </td>
                                <td class="text-center" style="position:relative;">
                                    <img src="/static/onlineMall/images/1.5.png" alt="" style="position: absolute;top:-34px;left: 0px;width: 46px;" />
                                    <img src="/static/onlineMall/images/2.3.png" alt="服装"><br>
                                    <span class="lineheigt25">服装</span><br>
                                    <span class="colorff lineheigt25">￥598/年/店</span><br>
                                    <a class="buy" href="javascript:void(0)">敬请期待</a>
                                </td>
                                <td class="text-center" style="position:relative;">
                                    <img src="/static/onlineMall/images/1.5.png" alt="" style="position: absolute;top:-34px;left: 0px;width: 46px;" />
                                    <img src="/static/onlineMall/images/2.4.png" alt="数码"><br>
                                    <span class="lineheigt25">3c数码</span><br>
                                    <span class="colorff lineheigt25">￥598/年/店</span><br>
                                    <a class="buy" href="javascript:void(0)">敬请期待</a>
                                </td>
                                <td class="text-center" style="position:relative;">
                                    <img src="/static/onlineMall/images/1.5.png" alt="" style="position: absolute;top:-34px;left: 0px;width: 46px;" />
                                    <img src="/static/onlineMall/images/2.5.png" alt="游乐场"><br>
                                    <span class="lineheigt25">游乐场</span><br>
                                    <span class="colorff lineheigt25">￥598/年/店</span><br>
                                    <a class="buy" href="javascript:void(0)">敬请期待</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--选择行业-->
                    <div class="Valueadded">
                        <span>增值服务</span>
                    </div>
                    <div class="recommendedlist  newrecommendedlist table-responsive" style="margin-left:8px;">
                        <ul class="new-shops">
                            <li style="position:relative;">
                                <img src="/static/onlineMall/images/1.5.png" alt="" style="position: absolute;top: -34px;left: 0px;width: 46px;" />
                                <img src="/static/onlineMall/images/3.1.png" alt="小程序"><br>
                                <span class="lineheigt25">小程序</span><br>
                                <span class="colorff lineheigt25">￥999/年/店</span><br>
                                <a class="buy" href="javascript:void(0)">敬请期待</a>
                            </li>
                            <li style="position:relative;">
                                <img src="/static/onlineMall/images/1.5.png" alt="" style="position: absolute;top: -34px;left: 0px;width: 46px;" />
                                <img src="/static/onlineMall/images/3.2.png" alt="操作人"><br>
                                <span class="lineheigt25">操作人</span><br>
                                <span class="colorff lineheigt25">￥100/年/人</span><br>
                                <a class="buy" href="javascript:void(0)">敬请期待</a>
                            </li>
                            <li class="text-center cache_name_catering_out" style="position:relative;">
                                <img src="/static/onlineMall/images/1.5.png" alt="" style="position: absolute;top: -34px;left: 0px;width: 46px;" />
                                <img src="/static/onlineMall/images/3.3.png" alt="扫码购"><br>
                                <span class="lineheigt25">扫码购</span><br>
                                <span class="colorff lineheigt25">￥999/年/店</span><br>
                                <a class="buy" href="javascript:void(0)">敬请期待</a>
                            </li>
                            <li>
                                <img src="/static/onlineMall/images/3.4.png" alt=""><br>
                                <span class="lineheigt25">短信包</span><br>
                                <span class="colorff lineheigt25">低至<i class="versionMoney">6</i>分一条</span><br>
                                <a class="buy" href="/Sms/Purchase_N3">立即购买</a>
                            </li>
                            <li>
                                <input type="hidden" id="levelNumber" value="1" />
                                <img src="/static/onlineMall/images/3.5.png" alt=""><br>
                                <span class="lineheigt25">推荐制度</span><br>
                                <input type="hidden" id="sv_user_module_code" value="RecommendPeople" />
                                <span class="colorff lineheigt25">300元开通三级套餐</span><br>
                                <a class="buy " id="Recommend_3" style="cursor:pointer;">立即购买</a>
                            </li>
                            <li class="text-center cache_name_catering_out">
                                <img src="/static/onlineMall/images/3.6.png" alt="" /><br />
                                <span class="lineheigt25">微信商城</span><br />
                                <span class="colorff height35">限时免费</span><br />
                                <a class="buy nowReceive" id="wechatshop_pay" data-sv_services_name="微商城" data-val="ValueAddedServices_Recommend_MALL" data-link="/ValueAdded/ValueAdded_N3/ValueAddedServices_Recommend_MALL" href="javascript:void(0);">立即领取</a>
                            </li>
                            <li class="text-center cache_name_catering_in">
                                <img src="/static/onlineMall/images/3.9.png" alt="" /><br />
                                <span class="lineheigt25">扫码点餐</span><br />
                                <span class="colorff height35">限时免费</span><br />
                                <a class="buy nowReceive" id="sanyShop_pay" data-sv_services_name="扫码点餐" data-val="ValueAddedServices_Recommend_TOScanOrder" data-link="/ValueAdded/ValueAdded_N3/ValueAddedServices_Recommend_TOScanOrder" href="javascript:void(0);">立即领取</a>
                            </li>
                            <li class="text-center cache_name_catering_in">
                                <img src="/static/onlineMall/images/3.10.png" alt="" /><br />
                                <span class="lineheigt25">外卖汇</span><br />
                                <span class="colorff height35">¥<i class="versionMoney">99</i>/年/店</span><br />
                                <a class="buy" href="/ValueAdded/ValueAdded_N3/ValueAddedServices_Recommend_TOFoodinOneSet">立即购买</a>
                            </li>
                            <li>
                                <img src="/static/onlineMall/images/3.11.png" alt=""><br>
                                <span class="lineheigt25">上门服务</span><br>
                                <span class="colorff height35">¥<i class="versionMoney">500</i></span><br>
                                <a class="buy" href="">立即购买</a>
                            </li>
                        </ul>
                    </div>

                    <div class="Valueadded">
                        <span>硬件超市</span>
                    </div>
                    <div class="HardwaresupermarketOne">
                        <ul>
                            <li>
                                <a href="/home/HardwareService_N3">
                                    <div class="HardwaresupermarketimgOne">
                                        <img src="/static/onlineMall/images/4.1.png" />
                                    </div>
                                    <p>商米T1</p>
                                    <p>2999.00 元</p>
                                </a>
                            </li>
                            <li>
                                <a href="/home/HardwareService_N3">
                                    <div class="HardwaresupermarketimgOne">
                                        <img src="/static/onlineMall/images/4.2.png" />
                                    </div>
                                    <p>商米mini</p>
                                    <p>1999.00 元</p>
                                </a>
                            </li>
                            <li>
                                <a href="/home/HardwareService_N3">
                                    <div class="HardwaresupermarketimgOne" style="margin-bottom: 43px;">
                                        <img src="/static/onlineMall/images/4.3.png" />
                                    </div>
                                    <p>商米V1</p>
                                    <p>799.00 元</p>
                                </a>
                            </li>

                            <li>
                                <a href="/home/HardwareService_N3">
                                    <div class="HardwaresupermarketimgOne">
                                        <img src="/static/onlineMall/images/4.4.png" />
                                    </div>
                                    <p>商米扫码盒</p>
                                    <p>149.00 元</p>
                                </a>
                            </li>
                            <li>
                                <a href="/home/HardwareService_N3">
                                    <div class="HardwaresupermarketimgOne">
                                        <img src="/static/onlineMall/images/4.5.png" />
                                    </div>
                                    <p>钱箱</p>
                                    <p>160.00 元</p>
                                </a>
                            </li>
                            <li>
                                <a href="/home/HardwareService_N3">
                                    <div class="HardwaresupermarketimgOne" style="margin-bottom: 37px;">
                                        <img src="/static/onlineMall/images/4.6.png" />
                                    </div>
                                    <p>扫码枪</p>
                                    <p>198.00元</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            <!--软件服务-->
        </div>

    </div>
</div>

<script>
    //---优化全局参数配置
    var _g_homeGetUserLoginData = null;
    var _g_homeGetUserConfigData = null;
    //--流水号
    var _g_GetStoreSerialnumberset= "";
    if(_g_homeGetUserConfigData){
        _g_GetStoreSerialnumberset = _g_homeGetUserConfigData.sv_uc_serialnumberset;
    }

    //收银台权限
    var _g_homeGetPermissionsByGroupId = null;

    var _g_homePostSettlePrintConfig={ cof : _g_homeGetUserLoginData, user : _g_homeGetUserConfigData };

</script>



<script src="/res/js/n3common-lib.min.js?v=qdnKPOj5u8-9iqaGIcx0ac9_WAOfLoy-nPvwlOOrk10"></script>




<script>
    var _noversionPower = null;
    $("#chartdecerpindexpage").height($(window).height() - 46);
    if (decerpbrowser && decerpbrowser.versions && decerpbrowser.versions.android) {
        //仅在Android真机环境下工作，需启用安卓环境下的打印
        if (true || printSet_network_devive_isandroid_enable) {
            document.write('<scri' + 'pt type="text/javascript" src="/cordova.js"></s' + 'cript>');
        }
    }

</script>

<script src="/static/onlineMall/js/swriper.js"></script>
<script>
    var mySwiper = new Swiper ('.hardware', {
        direction: 'horizontal',
        loop: true,
        autoplay: 5000,
        autoplayDisableOnInteraction: false,
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
    });
    //查询绑定
    $(document).ready(function () {
        //GetMarketingUserModuleConfigList();
        getpermissions();
    });
    //function GetMarketingUserModuleConfigList() {
    //    $.get("/UserModuleConfig/GetMarketingUserModuleConfigList", { module_code: $("#sv_user_module_code").val() }, function (data) {
    //        if (data) {
    //            if (data.childInfolist && data.childInfolist.length > 0) {
    //                $.each(data.childInfolist, function (i, d) {
    //                    if (d.sv_user_config_code) {
    //                        $("#Recommend_3").text("已购买");
    //                        $("#Recommend_3").css("background", "rgb(151, 146, 155)");
    //                        ValueAddedServices();
    //                    } else {
    //                        $("#Recommend_3").text("立即购买");
    //                        window.location.href = "/ValueAdded/Index/ValueAddedServices_Recommend_3";
    //                    }
    //                })
    //            }
    //        }
    //    });
    //}

    function getpermissions() {
        var levelNumber = $("#levelNumber").val()
        if (levelNumber == 2 || levelNumber == 3) {
            $("#Recommend_3").text("已购买");
            $("#Recommend_3").css("background", "rgb(151, 146, 155)");
            ValueAddedServices();
        } else {
            $("#Recommend_3").text("立即购买");
            linksetdemo();
        }
    }
    function ValueAddedServices() {
        $(document).unbind("click", "#Recommend_3").on("click", "#Recommend_3", function () {
            layer.confirm("您已经购买推荐制度功能，还要继续购买吗吗？", { btn: ["确认", "关闭"] }, function () {
                window.location.href = "/ValueAdded/Index/ValueAddedServices_Recommend_3";
            });
        });
    }
    function linksetdemo() {
        $(document).unbind("click", "#Recommend_3").on("click", "#Recommend_3", function () {
            window.location.href = "/ValueAdded/Index/ValueAddedServices_Recommend_3";
        });
    }
    _g_get_cache_name_def.then(function () {
        if (_g_sv_uit_cache_name == 'cache_name_catering') { // 餐饮版
            $(".cache_name_catering_in").css("display", "table-cell");
            $(".cache_name_catering_out").css("display", "none");
        } else {
            $(".cache_name_catering_in").css("display", "none");
            $(".cache_name_catering_out").css("display", "table-cell");
        }
    });


</script>

</body>

</html>
