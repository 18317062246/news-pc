<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="inform_block">
	<div class="top">
		<span class="tit">热门资讯</span><a href="//${websiteSuffix}/${cityen}/" class="more">更多 <span class="fSimSun">&gt;</span> </a>
</div>
<ul class="mid">
	<c:forEach items="${cityNewsList}" var="l" begin="0" end="4">
		<li>
			<p class="tit">
				<span class="caption">
					${fn:substring(l.Title,0,10)}
					<c:if test="${l.Title != null && l.Title.length() > 10}">
						<span>...</span>
					</c:if>
				</span>
				<span class="arr-down"></span></p >
			<p class="txt">
					${fn:substring(l.Description,0,37)}
				<c:if test="${l.Description != null && l.Description.length() > 29}">
					<span>...</span>
				</c:if>
			</p >
		</li>
	</c:forEach>
</ul>
</div>

