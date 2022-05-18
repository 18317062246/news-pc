<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <script src="${staticurl}/js/xss.js"></script>
</head>
<body>
<%--head--%>
    <div class="section-wrap section-header">
        <div class="section" style="width: 1120px">
            <ul class="nav-header fl">
                <%
                    //获取城市名称
                    String cityName = (String) request.getAttribute("cityName");
                    //获取城市简称
                    String cityen = (String) request.getAttribute("cityen");

                %>
                <c:choose>



                    <c:when test="${cityen == 'sz'}">
                <li><a href="//${cityen}.centanet.com/" target="_blank">首页</a></li>
                <li ><a href="//${cityen}.centanet.com/ershoufang/" target="_blank">二手房</a>
                    <div class="subnav" >
                        <a href="//${cityen}.centanet.com/ershoufang/" target="_blank">在售房源</a>
                        <a href="//${cityen}.centanet.com/ershoufang-ditie/" target="_blank">地铁找房</a>
                        <a href="//${cityen}.centanet.com/entrust/sale/" target="_blank">发布房源</a>
                        <i class="arrow"></i>
                    </div>
                </li>
                <li><a href="//${cityen}.centanet.com/xinfang/" target="_blank">新房</a>
                    <div class="subnav" >
                        <a href="//${cityen}.centanet.com/xinfang/" target="_blank">全部新房</a>
                        <a href="//${cityen}.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                        <a href="//esf.centanet.com/zhuanti/dawanqu/?${cityen}" target="_blank">粤港澳大湾区</a>
                        <i class="arrow"></i>
                    </div>
                </li>
                <li><a href="//${cityen}.centanet.com/zufang/" target="_blank">租房</a></li>
                <li><a href="//szworld.centanet.com/" target="_blank">海外</a></li>
                <li><a href="//${cityen}.centanet.com/xiaoqu/" target="_blank">小区</a></li>
                <c:choose>
                    <c:when test="${baiketype}">
                        <li class="curr"><a href="/${cityen}/">资讯<span>·</span>百科</a>
                            <div class="subnav" >
                                <a href="/${cityen}/" target="_blank">资讯</a>
                                <a href="/${cityen}/baike/" target="_blank">购房百科</a>
                                <i class="arrow"></i>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="curr"><a href="/${cityen}/" target="_blank">资讯</a></li>
                    </c:otherwise>
                </c:choose>
                <li><a href="//${cityen}.centanet.com/xiezilou/" target="_blank">写字楼</a></li>
                <li><a href="//${cityen}.centanet.com/gongshangpu/" target="_blank">商铺</a></li>
                <li><a href="//${cityen}.centanet.com/entrust/" target="_blank">发布房源</a></li>
                <li><a href="//${researchUrl}" target="_blank">中原研究院</a></li>
                    <%--                <iframe src="https://passport.centanet.com/top/" id="iframeA" name="iframeA"  loginsrc="https://passport.centanet.com/top/" marginwidth="0" marginheight="0" scrolling="no" frameborder="0"></iframe>--%>

                </c:when>
                    </c:choose>
            </ul>
            <div class="login-iframe_sz fl">
                <div class="login-info " id="loginInfo">

                    <div class="login-info">
                        <a class="first" href="//passport.centanet.com/login?reurl=https://sz.centanet.com/ershoufang/"><i class="user-ico"></i>我的中原</a>
                        <div class="login_tip" style="display: none;">
                            <div class="mui-mbar-arr">◆</div>
                            <a href="//passport.centanet.com/login?reurl=https://sz.centanet.com/ershoufang/" style="display:block" class="yellow_btn">登录</a>
                            <a href="//passport.centanet.com/entrust?reurl=https://sz.centanet.com/ershoufang/">我的房源</a>
                            <a href="//passport.centanet.com/searchhistory?reurl=https://sz.centanet.com/ershoufang/">我的意向</a>
                            <a href="//passport.centanet.com/care/ershoufang/?reurl=https://sz.centanet.com/ershoufang/">我的关注</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="appdown">
                <i class="phone-icon"></i>
                APP下载
                <div class="subnav">
                    <p class="js_gio_code" date-type="topdownload">
                        <img alt="" src="https://static.centanet.com/pcweb/v8.6.6/images/download_app1.jpg?v8.6.6">
                    </p>
                    <i class="arrow"></i>
                </div>
            </div>


            <c:if test="${cityen == 'sz'}">
                <p class="hot-phone fr">
                    咨询热线：4006622712转8888&nbsp;&nbsp;&nbsp;&nbsp;
                    监督举报电话：0755-3398 0900
                </p>
            </c:if>



        </div>
    </div>

<%--search--%>
<div class="section-wrap section-search">
    <div class="section">
        <h2 class="logo fl"><a href="">中原地产</a></h2>
        <c:if test="${cityen == 'szworld'}">
            <label for="" class="szworldLogo">新房</label>
        </c:if>

        <div class="clear"></div>
        <div class="search-box fl">
            <div class="search-entry">
                <div class="sear_choosebox" id="">
                    <c:if test="${cityen == 'szworld'}">
                        <span class="type-txt">新房</span>
                        <input id="J_searchtype" value="1" type="hidden"/>
                    </c:if>
                    <c:if test="${cityen != 'szworld'}">
                        <span class="type-txt">资讯</span>
                        <input id="J_searchtype" value="0" type="hidden"/>
                    </c:if>

                </div>
                <span class="line"></span>
                <span class="icons-search"></span>
                <c:if test="${cityen != 'szworld'}">
                    <input class="search-ipt" placeholder="请输入资讯标题或内容" type="text" value="${key}">
                </c:if>
                <c:if test="${cityen == 'szworld'}">
                    <input class="search-ipt" placeholder="请输入国家/城市/楼盘名" type="text">
                </c:if>
            </div><button type="image" class="icons-searchred-btn"><span>马上搜</span></button>
        </div>
        <%--<a href="" class="icons-map fl"></a>--%>
        <div class="clear"></div>
    </div>
</div>
<script type="text/javascript">

    $(function() {
        $('.login-info ').mouseenter(function(){
            $(this).find('.login_tip').show();
        });
        $('.login-info ').mouseleave(function(){
            $(this).find('.login_tip').hide();
        });

        $(".nav-header li").mouseover(function() {
            if ($(this).children().hasClass('subnav')) {

                $(this).addClass('on').siblings().removeClass('on');
            } else {
                $(this).addClass('on').siblings().removeClass('on');
            }
        });
        $(".nav-header li").mouseout(function() {
            //$(".subnav").hide();
            $(this).removeClass('on');
        });
        $(".section-header .appdown").mouseenter(function() {
            $(this).addClass('on');
        });
        $(".section-header .appdown").mouseleave(function() {
            $(this).removeClass('on');
        });
    })

    //判断是否为ie浏览器
    if(window.ActiveXObject || "ActiveXObject" in window){
        //如果是ie浏览器，设置iframe的透明度
        var ifra=document.getElementsByTagName('iframeA');
        for(var i=0,l=ifra.length;i<l;i++) {
            ifra[i].setAttribute('allowTransparency','true');
        }
    }
    //点击搜索
    $(".icons-searchred-btn").click(function () {
        let type = $("#J_searchtype").val() || 0;
        location.href = getlink(type);
    })

    //获取请求链接
    function getlink(type) {
        let searchkey = $('.search-ipt').val();
        let cityen = '${cityen}';
        let obj = {
            0: "/"+ cityen +"/list/?key=" + filterXSS(searchkey),
            1: "//"+ cityen +".centanet.com/xinfang/?key=" + filterXSS(searchkey)
        };
        return obj[type];
    }
</script>
<style type="text/css">
    .szworldLogo {
        color: #999;
        border: 1px solid #999;
        display: block;
        float: left;
        padding: 0 5px;
        line-height: 18px;
        background: #f6f6f6;
        border-radius: 6px;
        margin-left: 10px;
        font-size: 12px;
    }
    .phone-icon {
        display: inline-block;
        vertical-align: -2px;
        margin-right: 2px;
        width: 10px;
        height: 13px;
        background: url(https://static.centanet.com/pcweb/v8.6.6/images/phone-icon.png);
    }
</style>
</body>

</html>
