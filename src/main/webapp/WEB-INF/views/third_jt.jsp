<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 资讯-->
<div class="section-wrap section-zixunlayer">
    <div class="section">
        <div class="title-box clearfix">
            <h5 class="title">热门资讯</h5>
            <p class="r-more fr"><a href="//${websiteSuffix}/${cityen}/?entry=资讯tag" target="_blank">更多资讯&nbsp;<span class="fSimSun">&gt;</span></a></p>
        </div>
        <div class="zixun-content-box clearfix">
            <div class="zixuncolumn-left fl">
                <div class="zixun-bigpic-item" style="background-image:url(${leftUpTemp[0].LitPic});background-position: center center;background-size: cover;">
                    <a href="//${websiteSuffix}/${cityen}/detail/${leftUpTemp[0].ID}.html" target="_blank" class="zixun_link"></a>
                    <p class="title">${leftUpTemp[0].Title}</p>
                </div>
                <div class="zixun-bigpic-item hide" style="background-image:url(${leftDownTemp[0].LitPic});background-position: center center;background-size: cover;">
                    <a href="//${websiteSuffix}/${cityen}/detail/${leftDownTemp[0].ID}.html" target="_blank" class="zixun_link"></a>
                    <p class="title">${leftDownTemp[0].Title}</p>
                </div>
                <div class="zixun-bigpic-item hide" style="background-image:url(${rightTemp[0].LitPic});background-position: center center;background-size: cover;">
                    <a href="//${websiteSuffix}/${cityen}/detail/${rightTemp[0].ID}.html" target="_blank" class="zixun_link"></a>
                    <p class="title">${rightTemp[0].Title}</p>
                </div>
            </div>
            <div class="zixuncolumn-right fr">
                <ul class="zixuntab-bar clearfix">
                    <li class="active" index="0">${leftUp[0].TypeName}</li>
                    <li class="" index="1">${leftDown[0].TypeName}</li>
                    <c:if test="${right.size() != 0}">
                        <li index="2" class="">${right[0].TypeName}</li>
                    </c:if>
                </ul>
                <ul class="zixun-cont-list">
                    <c:forEach items="${leftUp}" var="lp" begin="1" end="6">
                        <li><a href="//${websiteSuffix}/${cityen}/detail/${lp.ID}.html" target="_blank">${lp.Title}</a></li>
                    </c:forEach>
                </ul>
                <ul class="zixun-cont-list hide">
                    <c:forEach items="${leftDown}" var="ld" begin="1" end="6">
                        <li><a href="//${websiteSuffix}/${cityen}/detail/${ld.ID}.html" target="_blank">${ld.Title}</a></li>
                    </c:forEach>
                </ul>
                <ul class="zixun-cont-list hide">
                    <c:forEach items="${right}" var="r" begin="1" end="6">
                        <li><a href="//${websiteSuffix}/${cityen}/detail/${r.ID}.html" target="_blank">${r.Title}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>

