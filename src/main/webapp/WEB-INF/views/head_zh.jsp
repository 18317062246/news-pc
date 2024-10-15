<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <script src="${staticurl}/js/xss.js"></script>
</head>
<body>
<%--head--%>
<div class="section-wrap section-header visible-desktop">
    <div class="section">
        <ul class="nav-header fl">
            <li><a href="//zh-testweb.centaline.com.cn/" target="_blank">首页</a></li>
            <li><a href="//${cityen}.centanet.com/xinfang/" target="_blank">新房</a>
                <div class="subnav" >
                    <a href="//zh.centanet.com/xinfang/" target="_blank">全部新房</a>
                    <a href="//zh.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                    <a href="://esf.centanet.com/tools/grandbay/?zh" target="_blank">粤港澳大湾区</a>
                    <i class="arrow"></i>
                </div>
            </li>
            <li><a href="//zh.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
            <li><a href="//zh.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
            <li><a href="${researchUrl}" target="_blank">中原研究院</a>
            <li><a href="javascript:;" rel="nofollow"><i class="phone-icon"></i>APP下载</a>
                <div class="subnav">
                    <img alt="" src="https://static.centanet.com/pcweb/test/20241008152847/images/download_app1.jpg?v20241008152847">
                    <i class="arrow"></i>
                </div>
            </li>
        </ul>

        <p class="hot-phone fr">
            咨询热线：4008191012转8888&nbsp;&nbsp;&nbsp;&nbsp;
        </p>

        <div class="login-iframe fr" id="loginInfo">

            <div class="login-info">
                <a class="first" href="//passport.centanet.com/login?reurl=http://zh.centanet.com/xinfang/"><i class="user-ico"></i>我的中原</a>
                <div class="login_tip" style="display: none;">
                    <div class="mui-mbar-arr">◆</div>
                    <a href="//passport.centanet.com/login?reurl=http://zh.centanet.com/xinfang/" style="display:block" class="yellow_btn">登录</a>
                    <a href="//passport.centanet.com/entrust?reurl=http://zh.centanet.com/xinfang/">我的房源</a>
                    <a href="//passport.centanet.com/searchhistory?reurl=http://zh.centanet.com/xinfang/">我的意向</a>
                    <a href="//passport.centanet.com/care/ershoufang/?reurl=http://zh.centanet.com/xinfang/">我的关注</a>
                </div>
            </div>
        </div>
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
