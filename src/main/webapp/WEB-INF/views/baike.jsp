<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <meta name="keywords" content="">
    <meta name="description" content=""/>
    <link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
    <title>${typeName}-中原地产资讯列表</title>
    <link rel="stylesheet" href="${staticurl}/css/cent_basev3.css">
    <link rel="stylesheet" href="${staticurl}/css/icons.css">
    <link rel="stylesheet" href="${staticurl}/css/cent_information.css">

    <link rel="stylesheet" href="${staticurl}/css/headp2.css">
    <link rel="stylesheet" href="${staticurl}/css/encyclop2.css">
    <link rel="stylesheet" href="${staticurl}/sidebar/sidebar.css">
    <script src="${staticurl}/js/jquery-1.7.min.js"></script>
    <script src="${staticurl}/sidebar/common.js"></script>
    <script src="${staticurl}/sidebar/quick_links.js"></script>
    <script src="${staticurl}/js/placeholder.js"></script>
    <script src="${staticurl}/js/head.js"></script>
    <script src="${staticurl}/js/totalexchange.js"></script>


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
<div class="centmain-wraper centmain-wraper-infor">
    <div class="centmain-inner">
        <div class="encyclo-banner"><img src="//pic.centanet.com/other/news/uploads/allimg/170420/111f4201r6050l_300x210_c.jpg" alt="" style="max-width: 1120px;"/></div>
        <div class="breadcrumbs clearfix f123" style="margin-bottom:10px">
            <div class="fl breadcrumbs-area f123 " id="navigation">
                <a href="/${cityen}/" class="f123">${citycn}资讯</a><span class="fsm"> &gt; </span><a href="/${cityen}/baike/" class="f123">购房百科</a><span class="fsm"> &gt; </span>
                <c:if test="${typeid == 0}">
                    <a href="/${cityen}/baike/p${page}/"  class="f123">${typeName}</a>
                </c:if>
                <c:if test="${typeid != 0}">
                    <a href="/${cityen}/baike/c${typeid}/p${page}/" class="f123">${typeName}</a>
                </c:if>

            </div>
        </div>

        <c:choose>
            <c:when test="${p.pageCount>=1}">

                <div class="encyclo-main fr" style="display: ${news.size()>0?'block':'none'}">
                    <h5 class="title">${typeName}</h5>
                    <ul class="encyclo-list">
                        <%--百科新闻列表--%>
                        <c:forEach items="${news}" var="n">
                            <li>
                                <p class="tit">
                                    <a href="/${cityen}/detail/${n.ID}.html" title="${n.Title}" target="_blank">${n.Title}</a>
                                </p>
                                <p class="hd">
                                    <a href="/${cityen}/detail/${n.ID}.html" title="${n.Title}" target="_blank">${n.Description} <span>...</span></a>
                                </p>
                                <p class="fd">
                                    <i></i>
                                    <span class="mr15">
                                        <jsp:useBean id="myDate" class="java.util.Date"/>
                                        <c:set target="${myDate}" property="time" value="${n.PublishDate*1000}"/>
                                        <fmt:formatDate pattern="yyyy年MM月dd日" value="${myDate}" type="both"/>
                                    </span>阅读：${n.Click}次</p>
                            </li>
                        </c:forEach>
                    </ul>
                        <c:if test="${p.pageCount>1}">
                            <div class="section-wrap section-pager">
                                <div class="pager-box">
                                    <div class="pager-inner">

                                        <c:if test="${p.hasPrePage}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                    <a href="/${cityen}/baike/p${p.currpageNum-1}" class="fsm fb">&lt;</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum-1}" class="fsm fb">&lt;</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>

                                        <c:if test="${p.currpageNum>2}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                    <a href="/${cityen}/baike/p${p.currpageNum-2}">${p.currpageNum-2}</a>
                                                </c:when>
                                                <c:otherwise>
                                                   <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum-2}">${p.currpageNum-2}</a>
                                                </c:otherwise>
                                             </c:choose>
                                        </c:if>

                                        <c:if test="${p.currpageNum>1}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                     <a href="/${cityen}/baike/p${p.currpageNum-1}">${p.currpageNum-1}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum-1}">${p.currpageNum-1}</a>
                                                </c:otherwise>
                                             </c:choose>
                                         </c:if>

                                        <span class="curr">${p.currpageNum}</span>
                                        <c:if test="${p.pageCount-p.currpageNum>=1}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                    <a href="/${cityen}/baike/p${p.currpageNum+1}">${p.currpageNum+1}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum+1}">${p.currpageNum+1}</a>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:if>
                                        <c:if test="${p.pageCount-p.currpageNum>=2}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                    <a href="/${cityen}/baike/p${p.currpageNum+2}">${p.currpageNum+2}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum+2}">${p.currpageNum+2}</a>
                                                </c:otherwise>
                                            </c:choose>

                                           <%-- <a class="normal" href="">...</a>--%>
                                        </c:if>
                                        <c:if test="${p.hasNextPage}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                    <a href="/${cityen}/baike/p${p.currpageNum+1}" class="fsm fb">&gt;</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum+1}" class="fsm fb">&gt;</a>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                </div>
            </c:when>
            <c:otherwise>
                <div class="centmain-wraper centmain-wraper-infor"  style="width: 30%;float: right; margin-right: 530px;">
                    <div class="centmain-inner" style="width: 800px;padding-top: 0px;margin-top: 0px;height: 370px;">
                        <div class="infor-wrapper" style="width: 800px;padding-top: 0px;margin-top: 0px;height: 370px;">
                            <div class="node-dl-wrapper"  style="width: 800px;padding-top: 0px;margin-top: 0px;height: 370px;text-align: center;">
                                <dl class="none_dl clearfix" style="margin-top: 60px;">
                                    <dt>
                                        <img  src="${staticurl}/images/noplay.jpg" alt="">
                                    </dt>
                                    <dd>

                                        <h3 class="f000 f16">
                                            对不起，暂无“<span class="cRed">${typeName}</span>”相关的资讯内容</h3>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="infor-space"></div>
                    <!-- E;centmain-inner -->
                </div>

            </c:otherwise>
        </c:choose>
        <%--left 左侧栏--%>
        <%-- <c:if test="${types!= null && fn:length(types) > 0}">--%>
        <div class="encyclo-side fl">
            <c:set var="dbcitys" value="sy,cc,hrb,cs,dl"></c:set>
            <dl class="encyclo-classify ${fn:contains(dbcitys, cityen)?'encyclo-classify_cs':''}">
                <%--判断栏目长度是否>=1--%>
                <c:if test="${typesSize > 1}">
                    <%--   <c:if test="${!fn:contains(dbcitys, cityen)}">--%>
                    <c:forEach items="${types}" var="item">
                        <%--一级 top--%>
                        <c:if test="${item.id == typeid}">
                            <dt class="curr"><span style="color: red;">${item.columnsName}</span></dt>
                        </c:if>
                        <c:if test="${item.id != typeid}">
                            <dt><span>${item.columnsName}</span></dt>
                        </c:if>
                        <%--二级 child--%>
                        <dd>
                            <c:forEach items="${item.childList}" var="ch">
                                <c:if test="${ch.id == typeid}">
                                    <a href="/${cityen}/baike/c${ch.id}/p1" class="curr" style="color: red;" title="${ch.columnsName}">${ch.columnsName}</a>
                                </c:if>
                                <c:if test="${ch.id != typeid}">
                                    <a href="/${cityen}/baike/c${ch.id}/p1" title="${ch.columnsName}">${ch.columnsName}</a>
                                </c:if>
                            </c:forEach>
                        </dd>
                    </c:forEach>
                    <%--</c:if>--%>
                </c:if>

                    <%--判断栏目长度是否==1--%>
                    <c:if test="${typesSize == 1}">
                        <%--   <c:if test="${!fn:contains(dbcitys, cityen)}">--%>
                        <c:forEach items="${types}" var="item">
                            <%--一级 top--%>
                            <c:if test="${item.id == typeid}">
                                <dt class="curr"><span style="color: red;">${item.columnsName}</span></dt>
                            </c:if>
                            <c:if test="${item.id != typeid}">
                                <dt><span>${item.columnsName}</span></dt>
                            </c:if>
                            <%--二级 child--%>

                                <c:forEach items="${item.childList}" var="ch">
                                    <dd>
                                    <c:if test="${ch.id == typeid}">
                                        <a href="/${cityen}/baike/c${ch.id}/p1" class="curr" style="color: red;" title="${ch.columnsName}">${ch.columnsName}</a>
                                    </c:if>
                                    <c:if test="${ch.id != typeid}">
                                        <a href="/${cityen}/baike/c${ch.id}/p1" title="${ch.columnsName}">${ch.columnsName}</a>
                                    </c:if>
                                    </dd>
                                </c:forEach>

                        </c:forEach>
                        <%--</c:if>--%>
                    </c:if>

            </dl>

        </div>
        <%--</c:if>--%>
        <div class="clear mb_28"></div>
    </div>
    <!-- E;centmain-inner -->
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/foot.jsp" %>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
<!--右侧贴边导航quick_links.js控制-->
<!--[if lte IE 8]>
<script src="sidebar/ie_better.js"></script>
<![endif]-->
<script src="${staticurl}/js/cent_lists.js"></script>
<script src="${staticurl}/js/listp2.js"></script>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</body>
</html>