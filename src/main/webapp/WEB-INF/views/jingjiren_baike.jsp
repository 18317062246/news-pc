<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="right-col fr">
    <div class="tit-top">
        <h5>购房百科</h5>
        <a href="//news.centanet.com/${cityen}/baike/" class="more-link" target="_blank">更多购房百科<span class="fSimSun">></span></a>
    </div>

    <c:forEach items="${baikeNewsList}" var="n">
        <div class="baiki-block">
            <a href="//news.centanet.com/${cityen}/baike/c${n.TypeID}/p1/" class="blue-label" target="_blank">${n.TypeName}</a><a href="//news.centanet.com/${cityen}/detail/${n.ID}.html" class="f3" target="_blank">
                ${fn:substring(n.Title , 0 ,22)}
                <c:if test="${n.Title.length() > 22}">
                    ...
                </c:if>
        </a>
            <p class="f9" target="_blank"> ${n.Description}...</p>
        </div>
    </c:forEach>


    <div class="clear"></div>
</div>
