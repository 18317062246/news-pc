<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: wbliuyu
  Date: 2023/5/11
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="right-col fr">
    <div class="tit-top">
        <h5>天津楼市</h5>
        <a href="https://news.centanet.com/tj/list/c1010/" target="_blank" class="more-link">查看更多<span class="fSimSun">&gt;</span></a>
    </div>
    <ul class="brokerquestion-list">
            <c:forEach items="${leftUp}" var="l" begin="0" end="15">
                <li class="ask-item"><a href="//${websiteSuffix}/${cityen}/detail/${l.ID}.html" target="_blank">${l.Title}</a><span class="date"><jsp:useBean id="myDate" class="java.util.Date"/>
                <c:set target="${myDate}" property="time" value="${l.PublishDate*1000}"/>
                <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/></span></li>
            </c:forEach>
    </ul>
</div>