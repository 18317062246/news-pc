<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <!-- <meta name="renderer" content="webkit">
      目前IE最新的正常模式去浏览
   <meta http-equiv="x-ua-compatible" content="IE=edge">-->
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <meta name="keywords" content="广州最新房产新闻,广州房产资讯,广州楼市政策,广州房产资讯,广州房地产新闻">
    <link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
    <meta name="description"
          content="广州房产新闻,广州中原地产提供最及时广州房产新闻、广州房地产资讯，为您解读广州房产最新政策，预测广州房价走势，分析广州楼市成交数据。中原地产最资深最可靠的房地产网站。"/>
    <title>广州房地产资讯_广州最新房产新闻－广州中原地产</title>
    <link rel="stylesheet" href="${staticurl}/css/cent_basev3.css">
    <link rel="stylesheet" href="${staticurl}/css/icons.css">
    <link rel="stylesheet" href="${staticurl}/css/headp2.css">
    <link rel="stylesheet" href="${staticurl}/css/cent_information.css">
    <link rel="stylesheet" href="${staticurl}/sidebar/sidebar.css">
    <script src="${staticurl}/js/jquery-1.7.min.js"></script>
    <script src="${staticurl}/js/jquery.slides.min.js"></script>
    <script src="${staticurl}/sidebar/common.js"></script>
    <script src="${staticurl}/sidebar/quick_links.js"></script>
    <script src="${staticurl}/js/placeholder.js"></script>
    <script>
        function getIframe(id) {
            return document.getElementById(id).contentWindow.document;
        }

        function frameDiv() {
            getIframe("iframeA").getElementById("loginInfo").style.display = "block";
        }

    </script>
</head>
<body>
<%--head--%>
<%@include file="/WEB-INF/views/head.jsp" %>
<!-- S;centmain-wraper -->
<div class="centmain-wraper ">
    <div class="section">
        <div class="breadcrumbs clearfix">
            <div class="fl breadcrumbs-area f123 ">
                <a href="//${cityen}.centanet.com" class="f123">${citycn}中原地产</a>
                <span class="fsm">&gt;</span>
                <a href="/${cityen}/" class="f123">${citycn}资讯</a>
                <span class="fsm">&gt;</span>
                <span class="colName"></span>
            </div>
        </div>
    </div>
    <div class="centmain-inner">
        <div class="infor-index-wrapper">
            <%--left -main--%>
            <div class="infor-mid-box fl">
                <div class="infor-index-mid ">
                    <div class="infor-indexmid-top">
                        <input type="hidden" value="${tabtype}" id="tabtype">
                        <ul class="programa">
                            <c:forEach items="${types}" var="t">
                                <c:if test="${t.location != 'right'}">
                                    <li ref="${t.id}">
                                        <a ref="${t.id}" class="programa-title ${t.id eq tabtype?'active':''}">${t.columnsName}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <a href="/${cityen}/list/c${tabtype}/" class="morelink">更多</a>
                    </div>
                    <div class="infor-news">
                        <c:forEach items="${news}" var="n" varStatus="status">
                            <c:if test="${n.TypeName != '轮播广告位'}">
                                <dl class="infor-news-itemB clearfix type${n.TypeID}">
                                    <c:if test="${n.TypeName != '轮播广告位'}">
                                        <dt>
                                            <h6 class="f18"><a href="/${cityen}/detail/${n.ID}.html" class="f000" target="_blank">${n.Title}</a></h6>
                                        </dt>
                                        <dd>
                                            <p class="f14 f999">
                                                ${n.Description}<span>...</span>
                                                <a href="" class="cBlue ml_15"></a>
                                            </p>
                                        </dd>
                                    </c:if>
                                </dl>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <%--下方banner--%>
                <div class="infor-index-banner">
                    <div class="infor-scroll" id="inforSlides">
                        <c:forEach items="${news}" var="n" begin="0" end="4">
                            <div class="inforSlid">
                                <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                                <a href="/${cityen}/detail/${n.ID}.html" title="${n.Title}" target="_blank"><img src="${n.LitPic}"  alt="${n.Title}" onerror="this.src='${defaultpic}'"></a>
                                <p>${n.Title}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
                <%--right--%>
            <div class="infor-index-side fr">
                <%-- //右侧上部文章--%>
                <c:forEach items="${rightType}" var="t" varStatus="status">
                    <c:if test="${t.location=='right'}">
                        <div class="infor-side-box">
                            <h2 class="title-top"><span class="f18 f333 fb">${t.columnsName}</span>
                                <a href="/${cityen}/list/c${t.id}/" class="morelink f000">更多</a>
                            </h2>
                            <ul class="infor-side-p">
                                    <%--遍历文章--%>
                                <c:forEach items="${rightNews}" var="n" varStatus="status">
                                    <c:if test="${t.id==n.TypeID}">
                                        <li><i></i><a class="f000" title="${n.Title}"
                                                      href="/${cityen}/detail/${n.ID}.html" target="_blank">${fn:substring(n.Title,0,28)}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                    <%--  <li><i></i><a href="">北京明确实施积分落户管理</a></li>
                                      <li><i></i><a href="">北京明确实施积分落户管理</a></li>--%>
                            </ul>
                        </div>
                    </c:if>
                </c:forEach>
                <%-- 右侧下部集团jt文章--%>
                <c:forEach items="${jtTypes[0].childList}" var="t" varStatus="status">
                    <%--  <c:if test="${t.location=='right' && status.index!=0}">--%>
                    <div class="infor-side-box">
                        <h2 class="title-top"><span class="f18 f333 fb">${t.columnsName}</span>
                            <a href="/${cityen}/list/c${t.id}/" class="morelink f000">更多</a>
                                <%-- <a href="javascript:doPost('addStudent.action', {"name":"张三"})"  class="morelink">更多</a>--%>
                        </h2>
                        <ul class="infor-side-p">
                                <%--遍历文章--%>
                            <c:forEach items="${centaNews}" var="n" varStatus="status">
                                <c:if test="${t.id==n.TypeID}">
                                    <li>
                                        <c:if test="${status.index==0}">
                                            <img src="${staticurl}/images/hot.png" alt="" style="vertical-align:-11px;margin-right:3px;">
                                        </c:if>
                                        <c:if test="${status.index!=0}">
                                            <i></i>
                                        </c:if>
                                        <a class="f000" title="${n.Title}"
                                           href="/${cityen}/detail/${n.ID}.html" target="_blank">${fn:substring(n.Title,0,28)}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                                <%--  <li><i></i><a href="">北京明确实施积分落户管理</a></li>
                                  <li><i></i><a href="">北京明确实施积分落户管理</a></li>--%>
                        </ul>
                    </div>
                    <%--  </c:if>--%>
                </c:forEach>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <!-- E;centmain-inner -->
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/foot.jsp" %>
<!--[if lte IE 8]>
	<script src="${staticurl}/sidebar/ie_better.js"></script>
	<![endif]-->
<script>
    $(function () {
        if ($("#inforSlides .inforSlid").length > 1) {
            $('#inforSlides').slidesjs({
                width: 776,
                height: 405,
                navigation: {
                    active: false
                },
                play: {
                    auto: true,
                    interval: 4000,
                    swap: false
                }
            });
        }

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
        //显示上一次点击的tab  tab切换
        /* let index = $("#tabtype").val();
         $(".programa  li[ref=" + index + "]").find('a').addClass("active").parent().siblings().children("a").removeClass("active");*/
        // tab切换
        let tabType = $('.programa .active').attr('ref');
        //默认第一个栏目名
        //let colName=$('.programa li').eq(0).find('a').text();
        let colName=$('.programa .active').text();
        $('.colName').text(colName);
        $('.infor-news > .infor-news-itemB').hide();
        $('.infor-news > .type' + tabType).show();
        let cityen = '${cityen}';
        $(".programa li a").click(function () {
            //红色显示
            $(this).addClass("active").parent().siblings().children("a").removeClass("active");
            let tabindex = $(this).attr('ref');
            /* $('.infor-news > .infor-news-item').hide();
             $('.infor-news > .type' + tabindex).show();*/
            $('.infor-news > .infor-news-itemB').hide().filter('.type'+tabindex).show();
            let url = '/' + cityen + '/list/c' + tabindex + '/'
            $('.infor-indexmid-top >.morelink').attr('href', url);
            $('.colName').text($(this).text());
        })
    });
</script>
<script src="${staticurl}/js/cent_lists.js"></script>
</body>
</html>