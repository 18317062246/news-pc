<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="right-col fr">
    <div class="tit-top">
        <h5>房产资讯</h5>
        <a href="//news.centanet.com/${cityen}/" class="more-link" target="_blank">更多房产资讯<span class="fSimSun">></span></a>
    </div>

    <c:forEach items="${leftDown}" var="n" begin="0" end="5">
        <div class="baiki-block">
            <a href="//news.centanet.com/${cityen}/list/c${n.TypeID}/p1/" class="blue-label" target="_blank">${n.TypeName}</a><a href="//news.centanet.com/${cityen}/detail/${n.ID}.html" class="f3" target="_blank">
                ${fn:substring(n.Title , 0 ,20)}
                <c:if test="${n.Title.length() > 20}">
                    ...
                </c:if>
            </a>
            <p class="f9" target="_blank"> ${n.Description}...</p>
        </div>
    </c:forEach>


    <div class="clear"></div>
</div>
