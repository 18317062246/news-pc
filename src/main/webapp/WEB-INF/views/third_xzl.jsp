<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="inform_block">
    <div class="top">
        <span class="tit">热门资讯</span><a href="//news.centanet.com/${cityen}" class="more" target="_blank">更多 <span class="fSimSun">&gt;</span> </a>
    </div>
    <ul class="mid">
        <c:forEach items="${cityNewsList}" var="k" begin="0" end="4">

            <li>
                <p class="tit"><a href="//news.centanet.com/${cityen}/detail/${k.ID}.html"
                                  class="caption" target="_blank">${fn:substring(k.Title, 0, 10)}
                    <c:if test="${k.Title != null && k.Title.length()>10}">
                        <span>...</span>
                    </c:if>
                </a></p >
            </li>
        </c:forEach>


    </ul>
</div>

