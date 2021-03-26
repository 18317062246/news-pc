<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!-- SZ -->
<div class="section-wrap section-inform " >
    <div class="section section-informSZ">
        <div class="title-box clearfix">
            <h5 class="title">热门专题</h5>
            <p class="description">楼市动态<i class="a_word"></i>一应俱全</p>
            <p class="r-more fr"><a href="//news.centanet.com/${cityen}/" >更多新鲜资讯&nbsp;<span class="fSimSun">&gt;</span></a></p>
        </div>
        <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
        <div class="inform-side fl ">
            <div class="expert">
                <div class="expert-phone">
                    <a href="//news.centanet.com/${cityen}/detail/${leftUp[0].ID}.html" target="_blank" title="${leftUp[0].Title}">
                        <c:choose>
                            <c:when test="${leftUp[0].LitPic != null && leftUp[0].LitPic.length() >= 10}">
                                <img src="${leftUp[0].LitPic}" alt="${leftUp[0].Title}">
                            </c:when>
                            <c:otherwise>
                                <img src="${defaultpic}" alt="${leftUp[0].Title}">
                            </c:otherwise>
                        </c:choose>
                    </a>
                    <span class="opacity_bg"></span>
                    <span class="txt">${leftUp[0].Title}</span>
                    <!--  <span style="color: #FFF;background-color: #000;text-align: center;position: absolute;opacity: 0.6;height: 40px;width: 574px;line-height: 30px;bottom: 0px;font-size: 18px;" title="那位指导价卖房的业主火了！指导价买房，你必须看这篇文章">那位指导价卖房的业主火了！指导价买房，你必须看这篇文章</span>-->
                </div>
                <ul class="expert-comment">
                    <c:forEach items="${leftUp}" var="l" begin="1" end="4">
                        <li><i></i><a   target="_blank"  href="//news.centanet.com/${cityen}/detail/${l.ID}.html" title="${l.Title}">${l.Title}</a></li>
                    </c:forEach>
                </ul>
                <p class="bot "><a href="//news.centanet.com/${cityen}/list/c${types[0].id}/" class="tdu ">@${types[0].columnsName}</a></p>
            </div>
        </div>
        <div class="inform-main fl ">
            <div class="inform-main-top">
                <dl class="inform-quest ">
                    <dd>
                        <ul class="expert-comment">
                            <c:forEach items="${leftDown}" var="l" begin="0" end="4">
                                <li><i></i><a   target="_blank"  href="//news.centanet.com/${cityen}/detail/${l.ID}.html" title="${l.Title}">${l.Title}</a></li>
                            </c:forEach>
                        </ul>
                        <p class="bot"><a href="//news.centanet.com/${cityen}/list/c${types[1].id}/" class="tdu">@${types[1].columnsName}</a></p>
                    </dd>
                </dl>
            </div>
            <div class="inform-main-bot">
                <dl class="inform-quest ">
                    <dd>
                        <ul class="expert-comment">
                            <c:forEach items="${right}" var="r" begin="0" end="3">
                                <li><i></i><a   target="_blank"  href="//news.centanet.com/${cityen}/detail/${r.ID}.html" title="${r.Title}">${r.Title}</a></li>
                            </c:forEach>
                        </ul>
                        <p class="bot"><a href="//news.centanet.com/${cityen}/list/c${types[2].id}/" class="tdu">@${types[2].columnsName}</a></p>
                    </dd>
                </dl>
            </div>
        </div>
        <div class="clear"></div>

    </div>
</div>
