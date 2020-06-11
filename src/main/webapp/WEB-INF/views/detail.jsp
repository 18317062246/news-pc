<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <!-- <meta name="renderer" content="webkit">
      目前IE最新的正常模式去浏览
   <meta http-equiv="x-ua-compatible" content="IE=edge">-->
    <meta http-equiv="Cache-Control" content="max-age=100"/>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <meta name="keywords" content="${citycn}最新房产新闻,${citycn}房产资讯,${citycn}楼市政策,${citycn}房产资讯,${citycn}房地产新闻">
    <meta name="description"
          content="${citycn}房产新闻,${citycn}中原地产提供最及时${citycn}房产新闻、${citycn}房地产资讯，为您解读${citycn}房产最新政策，预测${citycn}房价走势，分析${citycn}楼市成交数据。中原地产最资深最可靠的房地产网站。"/>
    <title> 全国楼市－${citycn}中原地产</title>
    <link rel="stylesheet" href="${staticurl}/css/cent_basev3.css">
    <link rel="stylesheet" href="${staticurl}/css/icons.css">
    <link rel="stylesheet" href="${staticurl}/css/headp2.css">
    <link rel="stylesheet" href="${staticurl}/css/cent_information.css">
    <link rel="stylesheet" href="${staticurl}/sidebar/sidebar.css">
    <script src="${staticurl}/js/jquery-1.7.min.js"></script>
    <script src="${staticurl}/sidebar/common.js"></script>
    <script src="${staticurl}/sidebar/quick_links.js"></script>
    <script src="${staticurl}/js/placeholder.js"></script>
    <script src="${staticurl}/js/head.js"></script>
    <script src="${staticurl}/js/jquery.lazyload.min.js"></script>
    <script>
        function getIframe(id) {
            return document.getElementById(id).contentWindow.document;
        }

        function frameDiv() {
            getIframe("iframeA").getElementById("loginInfo").style.display = "block";
        }
    </script>
    <style>
        #more:hover{
            color: #999;
        }
    </style>
</head>
<body>
<%--head--%>
<%@include file="/WEB-INF/views/head.jsp" %>
<!-- S;centmain-wraper -->
<div class="centmain-wraper centmain-wraper-infor">
    <div class="centmain-inner">
        <div class="breadcrumbs clearfix">
           <%-- <div class="fl breadcrumbs-area f123 ">
                <a href="/${cityen}/" class="f123 f000">${citycn}中原地产</a>
                <span class="fsm">&gt;</span>
                <a href="" class="f123f123">${citycn}资讯</a><span class="fsm">&gt;</span>
                <a href="" class="f123">${detail.Typename}</a><span class="fsm">&gt;</span>
                <span>正文</span>
            </div>--%>
           <div class="fl breadcrumbs-area f123 ">
               <a href="//${cityen}.centanet.com" class="f123">${citycn}中原地产</a>
               <span class="fsm">&gt;</span>
               <a href="/${cityen}/" class="f123">${citycn}资讯</a>
               <span class="fsm">&gt;</span>
               <a href="/${cityen}/list/c${detail.Typeid}/" class="f123">${detail.Typename}</a><span class="fsm">&gt;</span>
               <span>正文</span>
           </div>
        </div>
        <div class="infor-main fl">
            <div class="infor-detail-cont">
                <div class="infor-detail-top">
                    <h1 class="title ">${detail.Title}</h1>
                   <%-- <p class="f666 ">来源:${detail.Sources}</p>--%>
                    <p class="f666 ">
                        <jsp:useBean id="myDate" class="java.util.Date"/>
                        <c:set target="${myDate}" property="time" value="${detail.PublishDate*1000}"/>
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <fmt:formatDate pattern="hh:mm" value="${myDate}" type="both"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        来源:${detail.Sources}</p>
                <%--    <p class="share clearfix">
                        <a href=""></a>
                        <a href=""></a>
                        <a href=""></a>
                        <a href=""></a>
                    </p>--%>
                   <%-- <p class="mt_15">
                        <img src="${staticurl}/images/boss.jpg" alt=""/>
                    </p>--%>
                </div>
                <div class="infor-detail-mid">

                    ${detail.Content}
                </div>
            </div>
        </div>
        <div class="infor-side fr">
            <div class="rankingList">
                <h2 class="title">热点排行榜</h2>
                <div class="ranking-list">
                    <c:set var="classArray" value="${fn:split('hightlight,hightlightB,hightlightC', ',')}" />
                    <c:forEach items="${news}" var="n" varStatus="status">
                        <p><i class="${classArray[status.index]}">${status.count}</i>
                            <a title="${n.Title}" class="f000" href="/${cityen}/detail/${n.ID}.html">${fn:substring(n.Title, 0, 18)}</a></p>
                    </c:forEach>
                </div>
            </div>
            <c:if test="${infoNews!=null&& infoNews.size()>0}">
                <div class="hotSpecial clearfix">
                    <h2 class="title">热门专题</h2>
                    <div class="hotspecial-list">
                        <dl class="infor-side-pB">
                            <c:forEach items="${infoNews}" var="info" varStatus="status">
                                <dt class="${status.index==0?'curr':''}"><a class="f000" href="javacript:void(0);" title="${info.Title}">${fn:substring(info.Title, 0, 18)}</a></dt>
                                <dd><a href="/${cityen}/detail/${info.ID}.html" class="f000" title="${info.Title}">
                                    <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                                    <img class="lazy" src="${info.LitPic}?x-oss-process=style/300x210"
                                         data-original="${info.LitPic}?x-oss-process=style/300x210" alt="${item.Title}" onerror="this.src='${defaultpic}'"/>
                                </a>
                                </dd>
                            </c:forEach>
                        </dl>
                        <a href="/${cityen}/list/c${hotType}/" id="more" class="morelink">更多</a>
                    </div>
                </div>
            </c:if>
        </div>
        <div class="clear mb_28"></div>
    </div>
    <!-- E;centmain-inner -->
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/foot.jsp" %>
<script type="text/javascript">
  /*  jQuery(document).ready(function ($) {
        $("img.lazy").lazyload({effect: "fadeIn"});
    });*/
</script>
<script type="text/javascript">
    $(function () {
        var allPanelsSta = $('.infor-side-pB > dd').hide();
        var fistPanels = $('.infor-side-pB dd:first').show();
        $('.infor-side-pB > dt > a').click(function () {
            var allPanels = $('.infor-side-pB > dd');
            //allPanels.slideUp();
            var that = $(this).parent().next();
            var otherPanels = allPanels.not(that);
            otherPanels.slideUp();
            $('.infor-side-pB > dt').removeClass('curr');
            $(this).parent().next().slideDown();
            $(this).parent().addClass('curr');
            return false;
        });
        //图片延迟加载
        $("img.lazy").lazyload({effect: "fadeIn"});
    });


    //点击搜索
/*    $(".icons-searchred-btn").click(function () {
        console.log('search btn');
        let keyword = $('.search-ipt').val();
        let type = $("#J_searchtype").val() || 0;
        location.href = getlink(type);
    })
    //search button text
    let arr = [
        "请输入楼盘名/地址",
        "请输入楼盘名/地址",
        "请输入经纪人姓名",
        "请输入门店名",
        "请输入资讯标题或内容",
        "请请输入小区名称/学校/区域",
        "请输入小区名称",
        "请输入学校名称",
        "请输入商铺名称",
        "请输入写字楼名称"
    ];
    //切换文本框填充
    function searchType(type) {
        //如果是新房为1，小区为2，经纪人为3，门店为4，查成交为5，二手房为6，租房为7，学校为8，商铺为9，写字楼为10，默认为0
        $("#J_searchtype").val(type);
        $(".search-ipt").prop('placeholder', arr[type]);
    }
    //获取请求链接
    function getlink(type) {
        let searchkey = $('.search-ipt').val();
        let cityen = '${cityen}';
        let obj = {
            0: "/"+ cityen +"/list/?key=" + searchkey,
            1: "//" + cityen + ".centanet.com/xinfang/?key=" + searchkey,
            2: "//" + cityen + ".centanet.com/xiaoqu/?key=" + searchkey,
            3: "//" + cityen + ".centanet.com/jingjiren/?key=" + searchkey,
            4: "//" + cityen + ".centanet.com/mendian/?key=" + searchkey,
            5: "//" + cityen + ".centanet.com/chengjiao/contrast/?key=" + searchkey,
            6: "//" + cityen + ".centanet.com/ershoufang/?key=" + searchkey,
            7: "//" + cityen + ".centanet.com/zufang/?key=" + searchkey,
            8: "//" + cityen + ".centanet.com/ershoufang-xuexiao/?key=" + searchkey,
            9: "//" + cityen + ".centanet.com/gongshangpu/chushou/?key=" + searchkey,
            10: "//" + cityen + ".centanet.com/xiezilou/loupan/?key=" + searchkey
        };
        return obj[type];
    }*/

</script>
<script src="${staticurl}/js/cent_lists.js"></script>
</body>
</html>