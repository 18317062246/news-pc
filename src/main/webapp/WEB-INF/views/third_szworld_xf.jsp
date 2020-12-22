<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <div class="section section-szworldinfor">
        <div class="title-box">
            <h5 class="title">市场热点资讯</h5>
            <p class="description">海外房产新闻</p>
        </div>
        <div class="szworldinfor-cont clearfix">
            <div class="sidephoto fl">
                <div class="photo">
                    <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                    <a href="//news.centanet.com/${cityen}/detail/${cityNewsList[0].ID}.html" target="_blank">
                        <c:choose>
                            <c:when test="${cityNewsList[0].LitPic != null && cityNewsList[0].LitPic.length() >= 10}">
                                <img src="${cityNewsList[0].LitPic}" alt="${cityNewsList[0].Title}">
                            </c:when>
                            <c:otherwise>
                                <img src="${defaultpic}" alt="${cityNewsList[0].Title}">
                            </c:otherwise>
                        </c:choose>
                    </a>
                </div>
                <p class="infor">
                    <a href="//news.centanet.com/${cityen}/detail/${cityNewsList[0].ID}.html" class="title" target="_blank">
                        ${fn:substring(cityNewsList[0].Title,0,24)}
                        <c:if test="${cityNewsList[0].Title != null && cityNewsList[0].Title.length() >= 25}">
                            ...
                        </c:if>
                    </a>
                    <span class="date">
                         <jsp:useBean id="myDate" class="java.util.Date"/>
                         <c:set target="${myDate}" property="time" value="${cityNewsList[0].PublishDate*1000}"/>
                         <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                    </span>
                </p>
            </div>


            <div class="mincont fr">
                <ul class="news-lists ">
                    <c:forEach items="${cityNewsList}" var="item" begin="1" end="4">
                        <li>
                                <p class="top clearfix">
                                    <i class="dott"></i><a href="//news.centanet.com/${cityen}/detail/${item.ID}.html" class="title" target="_blank">${item.Title}</a>
                                    <span class="date">
                                          <jsp:useBean id="myDate1" class="java.util.Date"/>
                                          <c:set target="${myDate1}" property="time" value="${item.PublishDate*1000}"/>
                                          <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate1}" type="both"/>
                                    </span>
                                </p>
                                <p class="bot">
                                        ${fn:substring(item.Description,0,75)}
                                        <c:if test="${item.Description.length() > 75}">
                                                <span>...</span>
                                        </c:if>
                                </p>
                        </li>
                    </c:forEach>
                </ul>
                <p class="base tr"><a href="//news.centanet.com/${cityen}/list/c${types[0].id}/" class="cBlue" target="_blank">@房产要闻</a></p>
            </div>
        </div>

    </div>
