<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="mfn" uri="/WEB-INF/mfn.tld"%>
<html>
<head>
    <meta http-equiv="Cache-Control" content="max-age=1000"/>
    <meta http-equiv="x-ua-compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
    <meta name="keywords" content="${citycn}最新房产新闻,${citycn}房产资讯,${citycn}楼市政策,${citycn}房产资讯,${citycn}房地产新闻">
    <meta name="description"
          content="${citycn}房产新闻,${citycn}中原地产提供最及时${citycn}房产新闻、${citycn}房地产资讯，为您解读${citycn}房产最新政策，预测${citycn}房价走势，分析${citycn}楼市成交数据。中原地产最资深最可靠的房地产网站。"/>
    <title>${citycn}房地产资讯_${citycn}最新房产新闻－${citycn}中原地产</title>
    <link rel="stylesheet" href="${staticurl}/css/cent_basev3.css">
    <link rel="stylesheet" href="${staticurl}/css/icons.css">
    <link rel="stylesheet" href="${staticurl}/css/headp2.css">
    <link rel="stylesheet" href="${staticurl}/css/cent_information.css">
    <link rel="stylesheet" href="${staticurl}/sidebar/sidebar.css">
    <link rel="stylesheet" href="${staticurl}/css/time_style.css">
<c:if test="${cityen == 'sh'}">
    <link rel="stylesheet" href="${staticurl}/css/footer.css">
</c:if>
    <script src="${staticurl}/js/jquery-1.7.min.js"></script>
    <script src="${staticurl}/js/jquery.slides.min.js"></script>
    <script src="${staticurl}/sidebar/common.js"></script>
    <script src="${staticurl}/sidebar/quick_links.js"></script>
    <script src="${staticurl}/js/placeholder.js"></script>
    <script src="${staticurl}/js/head.js"></script>
<%--    <script src="/js/jquery.lazyload.min.js"></script>--%>
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

<!-- S;centmain-wraper -->
<!-- S;centmain-wraper -->

<div class="centmain-wraper ">
    <div class="centmain-inner">
        <%-- 面包屑--%>
        <div class="breadcrumbs clearfix f123">

            <div class="fl breadcrumbs-area">
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
                <span class="colName"></span>
            </div>
        </div>
        <div class="infor-index-wrapper">
            <div class="infor-index-top clearfix" style="display:none;">

            </div>
            <div class="info-container">
                <div class="infor-mid-box fl">
                    <div class="infor-index-mid">
                        <div class="infor-indexmid-top">
                            <input type="hidden" value="${tabtype}" id="tabtype">
                            <ul class="programa">
                                <c:forEach items="${types}" var="type" varStatus="status">

                                    <c:if test="${type.location != 'right' && type.location != 'baike'}">
                                        <li ref="${type.id}">
                                            <a ref="${type.id}" href="javascript:void(0);" title="${type.columnsName}"
                                               class="programa-title ${status.index==0?'active':''}">${fn:substring(type.columnsName,0,18)}</a>
                                        </li>
                                    </c:if>

                                </c:forEach>
                            </ul>
                            <c:if test="${types !=null && types.size()>0}">
                                <a href="/${cityen}/list/c${tabtype}/" class="morelink f000">更多</a>
                            </c:if>
                        </div>
                        <div class="infor-news">
                            <c:forEach items="${news}" var="item" varStatus="status">
                                <dl class="infor-news-item clearfix type${item.TypeID}" <%--style="display: none"--%>>
                                    <dt class="fl">
                                        <a href="/${cityen}/detail/${item.ID}.html" target="_blank" title="${item.Title}">
                                            <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                                                <c:choose>
                                                  <c:when test="${item.LitPic != null && item.LitPic.length() >= 10}">
                                                         <div class="img-box">
                                                           <img class=" news-img" src="${fn:substring(item.LitPic, 0 , mfn:lastIndexOf(item.LitPic, "."))}_450x320_w${fn:substring(item.LitPic,mfn:lastIndexOf(item.LitPic, ".") , fn:length(item.LitPic))}" alt="${item.Title}"
                                                                data-original="${fn:substring(item.LitPic, 0 , mfn:lastIndexOf(item.LitPic, "."))}_450x320_w${fn:substring(item.LitPic,mfn:lastIndexOf(item.LitPic, ".") , fn:length(item.LitPic))}" alt="${item.Title}"/>
                                                         </div>
                                                    </c:when>

                                                    <c:otherwise>
                                                        <img  src="${defaultpic}"
                                                             data-original="${defaultpic}" alt="${item.Title}" />
                                                    </c:otherwise>
                                                </c:choose>


                                        </a>
                                    </dt>
                                    <dd class="fl">
                                        <h6 class="f18">
                                            <a href="/${cityen}/detail/${item.ID}.html" class="f000" target="_blank" title="${item.Title}">
                                                 ${fn:substring(item.Title , 0 , 27)}
                                                     <c:if test="${item.Title != null && item.Title.length() >= 28}">
                                                         <span>...</span>
                                                     </c:if>
                                            </a>
                                        </h6>
                                        <p class="f14 f999">
                                                ${item.Description}
                                                    <c:if test="${item.Description != null && item.Description.length() >= 64}">
                                                        <span>...</span>
                                                    </c:if>

                                            <a href="" class="cBlue ml_15"></a>
                                        </p>
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
                        </div>
                    </div>
                    <c:if test="${cityen == 'gz'}">
                        <div class="infor-index-banner fr">
                            <div class="infor-scroll" id="inforSlides">
                                <c:forEach items="${dealinfo}" var="n">
                                    <div class="inforSlid">
                                        <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                                        <a href="${n.targetUrl}" title="" target="_blank">
                                            <img class="lazy news-img" src="${defaultpic}"
                                                 data-original="${n.imageUrl}?x-oss-process=style/master"
                                                 alt="" onerror="this.src='${defaultpic}'"></a>
                                         <p></p>
                                     </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${news !=null && news.size() >15}">
                    <div class="page_ul f1">
                        <div class="page_ul_div" style="display: none">
                            ——————<span></span>
                            <a href="/${cityen}/list/c${tabtype}/" name="a_moreinfo" target="_blank" class="f000">查看更多</a>
                            <span></span>——————
                        </div>
                    </div>
                </c:if>
                </div>
            </div>
            <%--right--%>
            <div class="infor-index-side fr">
                <%--右边第一个保留广告位  成交走势--%>
                <c:set var="str" value="dg,hz"></c:set>
                <c:if test="${fn:contains(str, cityen)}">
                    <div class="infor-side-box">
                            <%-- <h2 class="title-top"><span class="f18 f333 fb">成交走势</span></h2>--%>
                        <div class="infor-chart">
                            <c:if test="${dealinfo[0].targetUrl != null && dealinfo[0].targetUrl.length() >= 10}">
                                <a target="_blank" href="${dealinfo[0].targetUrl}" title="">
                                    <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                                    <c:choose>
                                        <c:when test="${dealinfo[0].imageUrl != null && dealinfo[0].imageUrl.length() >= 10}">
                                            <img  src="${dealinfo[0].imageUrl}?x-oss-process=style/180x130"
                                                 data-original="${dealinfo[0].imageUrl}?x-oss-process=style/180x130" alt=""/>
                                        </c:when>
                                        <c:otherwise>
                                            <img  src="${defaultpic}" alt=""/>
                                        </c:otherwise>
                                    </c:choose>

                                </a>
                            </c:if>
                            <c:if test="${dealinfo[0].targetUrl == null || dealinfo[0].targetUrl.length() < 10}">

                                <a  href="javascript:void(0);" title="">
                                    <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                                    <c:choose>
                                        <c:when test="${dealinfo[0].imageUrl != null && dealinfo[0].imageUrl.length() >= 10}">
                                            <img  src="${dealinfo[0].imageUrl}?x-oss-process=style/180x130" alt=""/>
                                        </c:when>
                                        <c:otherwise>
                                            <img  src="${defaultpic}" data-original="${defaultpic}" alt=""/>
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                            </c:if>
                        </div>
                        <%--<p class="tr mt_15 f999">数据来源于中原成交系统</p>--%>
                    </div>
                </c:if>
                <%--right右边广告位下的第一个模块 热门专题--%>
                <c:forEach items="${rightType}" var="t" varStatus="status">
                    <c:if test="${t.location=='right' && status.index==0}">
                        <c:choose>
                            <c:when test="${cityen == 'szworld'}"></c:when>
                            <c:otherwise>
                                <div class="infor-side-box">
                                    <p class="title-top">
                                        <span class="f18 f333 fb">${t.columnsName}</span>
                                        <a href="/${cityen}/list/c${t.id}/" class="morelink f000" style="top:5px;">更多</a>
                                    </p>
                                    <dl class="infor-side-pB">
                                            <%--遍历文章--%>
                                        <c:forEach items="${rightNews}" var="n" begin="0" end="5" varStatus="status">
                                            <c:if test="${t.id==n.TypeID}">
                                                <dt class="${status.count==1?'curr':''}"><i></i>
                                                    <a href="javacript:void(0);" class="f333 f000" title="${n.Title}">${fn:substring(n.Title,0,23)}
                                                        <c:if test="${n.Title.length() >= 24}">
                                                            <span>...</span>
                                                        </c:if>
                                                        <span class="index_time">
                                                            <c:set target="${myDate}" property="time" value="${n.PublishDate*1000}"/>
                                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                                                        </span>
                                                    </a>
                                                </dt>
                                                <dd style="display: block;">
                                                    <a href="/${cityen}/detail/${n.ID}.html" target="_blank" title="${n.Title}">
                                                        <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                                                        <c:choose>
                                                            <c:when test="${n.LitPic != null && n.LitPic.length() >= 10}">
                                                                <img src="${fn:substring(n.LitPic, 0 , mfn:lastIndexOf(n.LitPic, "."))}_300x210_c${fn:substring(n.LitPic,mfn:lastIndexOf(n.LitPic, ".") , fn:length(n.LitPic))}"
                                                                     alt="${n.Title}"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="${defaultpic}" data-original="${defaultpic}" alt="${n.Title}"
                                                                />
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </a>
                                                </dd>
                                            </c:if>
                                        </c:forEach>
                                    </dl>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </c:if>
                </c:forEach>

                <%-- //右侧上部文章--%>
                <c:forEach items="${rightType}" var="t" varStatus="status">
                    <c:if test="${t.location=='right' && status.index!=0}">
                        <c:choose>
                            <c:when test="${cityen == 'sz'}">
                                <c:if test="${t.columnsName != '测评报告'}">
                                    <div class="infor-side-box">
                                        <h2 class="title-top"><span class="f18 f333 fb">${t.columnsName}</span>
                                            <a href="/${cityen}/list/c${t.id}/" class="morelink f000">更多</a>
                                        </h2>
                                        <ul class="infor-side-p">
                                                <%--遍历文章--%>
                                            <c:forEach items="${rightNews}" var="n" varStatus="status" >
                                                <c:if test="${t.id==n.TypeID}">
                                                    <li><i></i><a class="f000"
                                                                  href="/${cityen}/detail/${n.ID}.html" target="_blank" title="${n.Title}">${fn:substring(n.Title,0,23)}
                                                        <c:if test="${n.Title.length() >= 24}">
                                                            <span>...</span>
                                                        </c:if>
                                                        <span class="index_time">
                                                                 <c:set target="${myDate}" property="time" value="${n.PublishDate*1000}"/>
                                                                <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                                                        </span>
                                                    </a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </c:if>
                            </c:when>
                            <c:when test="${cityen == 'szworld'}"></c:when>

                            <c:when test="${cityen == 'gz'}">
                                <c:if test="${t.columnsName != '热门专题'}">
                                    <div class="infor-side-box">
                                        <h2 class="title-top"><span class="f18 f333 fb">${t.columnsName}</span>
                                            <a href="/${cityen}/list/c${t.id}/" class="morelink f000">更多</a>
                                        </h2>
                                        <ul class="infor-side-p">
                                                <%--遍历文章--%>
                                            <c:forEach items="${rightNews}"  var="n" varStatus="status">
                                                <c:if test="${t.id==n.TypeID}">
                                                    <li><i></i><a class="f000"
                                                                  href="/${cityen}/detail/${n.ID}.html" target="_blank" title="${n.Title}">${fn:substring(n.Title,0,23)}
                                                        <c:if test="${n.Title.length() >= 24}">
                                                            <span>...</span>
                                                        </c:if>
                                                        <span class="index_time">
                                                                 <c:set target="${myDate}" property="time" value="${n.PublishDate*1000}"/>
                                                                <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                                                        </span>
                                                    </a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </c:if>
                            </c:when>

                            <c:otherwise>
                                <div class="infor-side-box">
                                    <h2 class="title-top"><span class="f18 f333 fb">${t.columnsName}</span>
                                        <a href="/${cityen}/list/c${t.id}/" class="morelink f000">更多</a>
                                    </h2>
                                    <ul class="infor-side-p">
                                            <%--遍历文章--%>
                                        <c:forEach items="${rightNews}" var="n" varStatus="status">
                                            <c:if test="${t.id==n.TypeID}">
                                                <li><i></i><a class="f000"
                                                              href="/${cityen}/detail/${n.ID}.html" target="_blank" title="${n.Title}">${fn:substring(n.Title,0,23)}
                                                    <c:if test="${n.Title.length() >= 24}">
                                                        <span>...</span>
                                                    </c:if>
                                                    <span class="index_time">
                                                        <c:set target="${myDate}" property="time" value="${n.PublishDate*1000}"/>
                                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                                                    </span>
                                                </a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </c:if>
                    </c:forEach>


                <%-- 右侧下部集团jt文章--%>
                <c:forEach items="${jtTypes[0].childList}" var="t" varStatus="status">
                    <c:choose>
                        <%--深圳、深圳海外、北京海外、长沙、惠州、东莞隐藏品牌部、研究院、专家点评--%>
                        <c:when test="${
                        cityen == 'sz' || cityen == 'szworld' || cityen == 'bjworld' || cityen == 'cs' || cityen == 'hz' || cityen == 'dg'|| cityen == 'gz'||
                        cityen == 'nb' || cityen == 'xa' || cityen == 'zs' || cityen == 'zq' || cityen == 'zz' || cityen == 'hq'|| cityen == 'nc'||
                        cityen == 'fz' || cityen == 'sy' || cityen == 'nn' || cityen == 'fs' || cityen == 'hrb' || cityen == 'xm'|| cityen == 'wx'||
                        cityen == 'xy' || cityen == 'zh' || cityen == 'zj' || cityen == 'ganzhou' || cityen == 'hf' || cityen == 'jn'|| cityen == 'km'||
                        cityen == 'sh' || cityen == 'bj' || cityen == 'tj' || cityen == 'cd' || cityen == 'cq' || cityen == 'nj'|| cityen == 'wh'||
                        cityen == 'cc' || cityen == 'dl'
                        }">

                        </c:when>
                        <c:otherwise>
                            <div class="infor-side-box">
                                <h2 class="title-top"><span class="f18 f333 fb">${t.columnsName}</span>
                                    <a href="/${cityen}/list/c${t.id}/" class="morelink f000">更多</a>
                                </h2>
                                <ul class="infor-side-p">
                                        <%--遍历文章--%>
                                    <c:forEach items="${centaNews}" var="n" varStatus="status">
                                        <c:if test="${t.id==n.TypeID}">
                                            <li>
                                                <c:if test="${status.index==0}">
                                                    <img src="${staticurl}/images/hot.png" alt="${n.Title}" style="vertical-align:-11px;margin-right:3px;width: auto;">
                                                </c:if>
                                                <c:if test="${status.index!=0}">
                                                    <i></i>
                                                </c:if>
                                                <a class="f000" title="${n.Title}"
                                                   href="/${cityen}/detail/${n.ID}.html" target="_blank">${fn:substring(n.Title,0,23)}
                                                    <c:if test="${n.Title.length() >= 24}">
                                                        <span>...</span>
                                                    </c:if>
                                                    <span class="index_time">
                                                            <c:set target="${myDate}" property="time" value="${n.PublishDate*1000}"/>
                                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                                                    </span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:otherwise>
                    </c:choose>


                    <%--  </c:if>--%>
                </c:forEach>

                <%--广州热门专题栏目、惠州Ben钟话市栏目、深圳海外右上部栏目文章--%>
                <c:forEach items="${rightType}" var="t" varStatus="status">
                    <c:if test="${t.location=='right' && status.index!=0}">
                        <c:if test="${cityen == 'gz'}">
                            <c:if test="${t.columnsName == '热门专题'}">
                                <div class="infor-side-box">
                                    <h2 class="title-top"><span class="f18 f333 fb">${t.columnsName}</span>
                                        <a href="/${cityen}/list/c${t.id}/" class="morelink f000">更多</a>
                                    </h2>
                                    <ul class="infor-side-p">
                                            <%--遍历文章--%>
                                        <c:forEach items="${rightNews}" var="n" varStatus="status" >
                                                <c:if test="${t.id==n.TypeID}">
                                                    <li><i></i><a class="f000"
                                                                  href="/${cityen}/detail/${n.ID}.html" target="_blank" title="${n.Title}">${fn:substring(n.Title,0,23)}
                                                        <c:if test="${n.Title.length() >= 24}">
                                                            <span>...</span>
                                                        </c:if>
                                                        <span class="index_time">
                                                            <c:set target="${myDate}" property="time" value="${n.PublishDate*1000}"/>
                                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                                                        </span>
                                                    </a>
                                                    </li>
                                                </c:if>

                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                        </c:if>
                    </c:if>
                </c:forEach>
                    <c:if test="${cityen == 'szworld'}">
                        <c:forEach items="${rightType}" var="t" varStatus="status">
                            <div class="infor-side-box">
                                <h2 class="title-top"><span class="f18 f333 fb">${t.columnsName}</span>
                                    <c:forEach items="${rightNewAllCounts}" var="n">
                                        <c:if test="${t.id==n.typeId}">
                                            <c:if test="${n.total > 10}">
                                                <a href="/${cityen}/list/c${t.id}/" class="morelink f000">更多</a>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </h2>
                                <ul class="infor-side-p">
                                        <%--遍历文章--%>
                                    <c:forEach items="${rightNews}"  var="n" varStatus="status">
                                        <c:if test="${t.id==n.TypeID}">
                                            <li><i></i><a class="f000"
                                                          href="/${cityen}/detail/${n.ID}.html" target="_blank" title="${n.Title}">${fn:substring(n.Title,0,23)}
                                                <c:if test="${n.Title.length() >= 24}">
                                                    <span>...</span>
                                                </c:if>
                                                <span class="index_time">
                                                    <c:set target="${myDate}" property="time" value="${n.PublishDate*1000}"/>
                                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                                                </span>
                                            </a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:forEach>
                    </c:if>



            </div>
            <div class="clear"></div>
        </div>
    </div>
    <!-- E;centmain-inner -->
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/foot.jsp" %>


<script>

    $(function () {

        if ($("#inforSlides .inforSlid").length > 1) {
            $('#inforSlides').slidesjs({
                width: 604,
                height: 314,
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
        var allPanelsStaB = $('.infor-side-pC > dd').hide();
        var fistPanelsB = $('.infor-side-pC dd:first').show();
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
        $('.infor-side-pC > dt > a').click(function () {
            var allPanels = $('.infor-side-pC > dd');
            //allPanels.slideUp();
            var that = $(this).parent().next();
            var otherPanels = allPanels.not(that);
            otherPanels.slideUp();
            $('.infor-side-pC > dt').removeClass('curr');
            $(this).parent().next().slideDown();
            $(this).parent().addClass('curr');
            return false;
        });

        //显示上一次点击的tab  tab切换
        /* let index = $("#tabtype").val();
         $(".programa  li[ref=" + index + "]").find('a').addClass("active").parent().siblings().children("a").removeClass("active");*/
        // tab切换
        //默认第一个tabtype
        //let tabType=$('.programa li').eq(0).find('a').attr('ref');
        let tabType = $('.programa .active').attr('ref');
        //默认第一个栏目名
        //let colName=$('.programa li').eq(0).find('a').text();
        let colName=$('.programa .active').text();
        $('.colName').text(colName);
        $('.infor-news > .infor-news-item').hide();
        $('.infor-news > .type' + tabType).show();
        let cityen = '${cityen}';
        if($('.infor-news > .type' + tabType).size()>15){
            $('.page_ul_div').show();
        }
        $(".programa li a").click(function () {
            //红色显示
            $(this).addClass("active").parent().siblings().children("a").removeClass("active");
            let tabindex = $(this).attr('ref');
           /* $('.infor-news > .infor-news-item').hide();
            $('.infor-news > .type' + tabindex).show();*/
            $('.infor-news > .infor-news-item').hide().filter('.type'+tabindex).show();
            let url = '/' + cityen + '/list/c' + tabindex + '/'
            $('.infor-indexmid-top >.morelink').attr('href', url);
            $('.page_ul_div >a').attr('href', url);
            $('.colName').text($(this).text());
            if($('.infor-news > .type' + tabindex).size()>15){
                $('.page_ul_div').show();
            }
        })
        //图片延迟加载
        $("img.lazy").lazyload({effect: "fadeIn"});
    });


</script>
<script src="${staticurl}/js/cent_lists.js"></script>
<script src="${staticurl}/js/listp2.js"></script>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</body>
</html>
