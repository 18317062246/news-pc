<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mfn" uri="/WEB-INF/mfn.tld"%>
<html>
<head>
    <meta http-equiv="x-ua-compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
    <meta name="keywords" content="${citycn}最新房产新闻,${citycn}房产资讯,${citycn}楼市政策,${citycn}房产资讯,${citycn}房地产新闻">
    <meta name="description"
          content="${citycn}房产新闻,${citycn}中原地产提供最及时${citycn}房产新闻、${citycn}房地产资讯，为您解读${citycn}房产最新政策，预测${citycn}房价走势，分析${citycn}楼市成交数据。中原地产最资深最可靠的房地产网站。"/>
    <title>${colName}_${citycn}资讯列表－${citycn}中原地产</title>
    <link rel="stylesheet" href="${staticurl}/css/cent_basev3.css">
    <link rel="stylesheet" href="${staticurl}/css/pager_inner.css">
    <link rel="stylesheet" href="${staticurl}/css/icons.css">
    <link rel="stylesheet" href="${staticurl}/css/headp2.css">
    <link rel="stylesheet" href="${staticurl}/css/cent_information.css">
    <link rel="stylesheet" href="${staticurl}/css/time_style.css">
    <link rel="stylesheet" href="${staticurl}/sidebar/sidebar.css">
    <c:if test="${cityen == 'sh'}">
        <link rel="stylesheet" href="${staticurl}/css/footer.css">
    </c:if>
    <script src="${staticurl}/js/jquery-1.7.min.js"></script>
    <script src="${staticurl}/js/jquery.slides.min.js"></script>
    <script src="${staticurl}/sidebar/common.js"></script>
    <script src="${staticurl}/sidebar/quick_links.js"></script>
    <script src="${staticurl}/js/placeholder.js"></script>
    <script src="${staticurl}/js/head.js"></script>
    <script src="${staticurl}/js/jquery.lazyload.min.js"></script>
    <script type="text/javascript" src="${staticurl}/js/sale_house_cookie.js" language="javascript"></script>
    <%--图片放大效果--%>
    <link rel="stylesheet" href="${staticurl}/css/news_list_photo_enlarge.css">
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

<div class="centmain-wraper centmain-wraper-infor">
    <div class="centmain-inner">
        <div class="breadcrumbs clearfix">
          <%--  <div class="fl breadcrumbs-area f123 ">
                <a href="/${cityen}/" class="f123 f000">${citycn}中原地产</a>
                <span class="fsm">&gt;</span>
                <a href="" class="f123">${citycn}资讯</a><span class="fsm">&gt;</span>
                <span>${colName}</span>
            </div>--%>
            <div class="fl breadcrumbs-area f123 ">
                <c:choose>
                    <c:when test="${cityen == 'jtdr'}">
                        <a href="//esf.centanet.com/tools/grandbay/" class="f123">中原地产</a>
                    </c:when>
                    <c:otherwise>
                        <a href="//${cityen}.centanet.com" class="f123">${citycn}中原地产</a>
                    </c:otherwise>
                </c:choose>

                <c:if test="${cityen == 'szworld'}">
                    <span class="fsm">&gt;</span>
                    <a href="//${cityen}.centanet.com/xinfang/" class="f123">${citycn}新房</a>
                </c:if>
                <span class="fsm">&gt;</span>
                <a href="/${cityen}/" class="f123">${citycn}资讯</a>
                <span class="fsm">&gt;</span>
                <c:if test="${colName == '搜索列表'}">
                    <a href="/${cityen}/list/p${page}/?key=${key}" class="f123">${colName}</a>
                </c:if>
                <c:if test="${colName != '搜索列表'}">
                    <a href="/${cityen}/list/c${type}/p${page}/" class="f123">${colName}</a>
                </c:if>

            </div>
        </div>
        <div class="infor-main fl"
                <c:if test="${news == null || news.size() == 0}">
                    style="width:1000px;"
                </c:if>
        >
            <div class="infor-lists">
                <div class="infor-news">
                <c:forEach items="${news}" var="item">
                    <dl class="infor-news-item clearfix">
                        <dt class="fl">
                            <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                            <a href="/${cityen}/detail/${item.ID}.html" target="_blank" title="${item.Title}">

                                <c:choose>
                                    <c:when test="${item.LitPic != null && item.LitPic.length() >= 10}">
                                        <div class="img-box">
                                            <img class="lazy news-img"
                                                 src="${defaultpic}"
                                                 data-original="${fn:substring(item.LitPic, 0 , mfn:lastIndexOf(item.LitPic, "."))}_450x320_w${fn:substring(item.LitPic,mfn:lastIndexOf(item.LitPic, ".") , fn:length(item.LitPic))}"
                                                 alt="${item.Title}" />
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <img class="lazy"
                                             alt="${item.Title}" src="${defaultpic}" data-original="${defaultpic}"/>
                                    </c:otherwise>
                                </c:choose>

                            </a>
                        </dt>
                        <dd class="fl">
                            <h6 class="f18"><a href="/${cityen}/detail/${item.ID}.html" class="f000" target="_blank">${item.Title}</a></h6>
                            <p class="f14 f999">${item.Description}
                                <c:if test="${item.Description != null && item.Description.length() >= 64}">
                                    <span>...</span>
                                </c:if>
                                <a href="" class="cBlue ml_15"></a></p>
                            <div class="tag clearfix">
                                <p class="news_time">
                                    <jsp:useBean id="myDate" class="java.util.Date"/>
                                    <c:set target="${myDate}" property="time" value="${item.PublishDate*1000}"/>
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                                </p>
                                <ul>
                                    <c:forEach items="${item.LabelList}" var="l">
                                        <li><span class="tag_item">${l.title}</span></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </dd>
                    </dl>
                </c:forEach>

                <c:if test="${news == null || news.size()==0}">

                    <div class="node-dl-wrapper" style="margin-right: 200px;">
                        <dl class="none_dl clearfix" style="width: 300px;">
                            <dt>
                                <img  src="${staticurl}/images/noplay.jpg" alt="">
                            </dt>
                            <dd style="text-align: center;">

                                <h3 class="f000 f16" >
                                    对不起，暂无“<span class="cRed" style="color: red;">${key}</span>”相关的资讯内容</h3>
                            </dd>
                        </dl>
                    </div>

                        <div class="infor-space"></div>
                        <!-- E;centmain-inner -->
                </c:if>

                </div>
            </div>
            <c:if test="${p.pageCount>1}">
                <div class="section-wrap section-pager">
                    <div class="pager-box">
                        <div class="pager-inner">
                            <c:if test="${p.hasPrePage}">
                                <c:choose>
                                    <c:when test="${key != null}">
                                        <a href="/${cityen}/list/p${p.currpageNum-1}/?key=${key}" class="fsm fb">&lt;</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/${cityen}/list/c${type}/p${p.currpageNum-1}/" class="fsm fb">&lt;</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>

                            <c:if test="${p.currpageNum>2}">
                                <c:choose>
                                    <c:when test="${key != null}">
                                        <a href="/${cityen}/list/p${p.currpageNum-2}/?key=${key}">${p.currpageNum-2}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/${cityen}/list/c${type}/p${p.currpageNum-2}/">${p.currpageNum-2}</a>
                                    </c:otherwise>
                                </c:choose>

                            </c:if>
                            <c:if test="${p.currpageNum>1}">
                                <c:choose>
                                    <c:when test="${key != null}">
                                        <a href="/${cityen}/list/p${p.currpageNum-1}/?key=${key}">${p.currpageNum-1}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/${cityen}/list/c${type}/p${p.currpageNum-1}/">${p.currpageNum-1}</a>
                                    </c:otherwise>
                                </c:choose>

                            </c:if>
                            <span class="curr">${p.currpageNum}</span>
                            <c:if test="${p.pageCount-p.currpageNum>=1}">
                                <c:choose>
                                    <c:when test="${key != null}">
                                        <a href="/${cityen}/list/p${p.currpageNum+1}/?key=${key}">${p.currpageNum+1}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/${cityen}/list/c${type}/p${p.currpageNum+1}/">${p.currpageNum+1}</a>
                                    </c:otherwise>
                                </c:choose>

                            </c:if>
                            <c:if test="${p.pageCount-p.currpageNum>=2}">
                                <c:choose>
                                    <c:when test="${key != null}">
                                        <a href="/${cityen}/list/p${p.currpageNum+2}/?key=${key}">${p.currpageNum+2}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/${cityen}/list/c${type}/p${p.currpageNum+2}/">${p.currpageNum+2}</a>
                                    </c:otherwise>
                                </c:choose>

                            </c:if>
                            <c:if test="${p.hasNextPage}">
                                <c:choose>
                                    <c:when test="${key != null}">
                                        <a href="/${cityen}/list/p${p.currpageNum+1}/?key=${key}" class="fsm fb">&gt;</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/${cityen}/list/c${type}/p${p.currpageNum+1}/" class="fsm fb">&gt;</a>
                                    </c:otherwise>
                                </c:choose>

                            </c:if>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
        <%--right--%>
        <c:if test="${p.pageCount>=1}">
            <div class="infor-side fr">
                <div class="rankingList">
                    <h2 class="title">热点排行榜</h2>
                    <div class="ranking-list">
                        <c:set var="arr" value="${fn:split('hightlight,hightlightB,hightlightC',',')}"></c:set>
                        <c:forEach items="${topList}" var="t" varStatus="status">
                            <p style="margin: 0 auto;">
                                <i class="${arr[status.index]}">${status.count}</i>
                                <a href="/${cityen}/detail/${t.ID}.html" target="_blank" class="f000" title="${t.Title}">${fn:substring(t.Title,0,18)}</a>
                                <br/>

                            </p>
                            <p  class="toplist_time" style="margin: 0 auto;">
                                <c:set target="${myDate}" property="time" value="${t.PublishDate*1000}"/>
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                            </p>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>
        <div class="clear mb_28"></div>
    </div>
    <!-- E;centmain-inner -->
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/foot.jsp" %>

<script type="text/javascript">
    $(function () {
        $('.infor-lists .infor-item').hover(function () {
            $(this).addClass('curr');
        }, function () {
            $(this).removeClass('curr');
        });
        //图片延迟加载
        $("img.lazy").lazyload({effect: "fadeIn"});
    })
</script>
<script src="${staticurl}/js/cent_lists.js"></script>
<script src="${staticurl}/js/listp2.js"></script>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</body>
</html>
