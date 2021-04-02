<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- S;information -->
<div class="section-wrap section-inform" >
	<div class="section">
		<div class="title-box clearfix">
			<h5 class="title">${citycn}热点资讯</h5>
			<p class="description">提供房产新闻</p>
			<p class="r-more fr"><a href="//news.centanet.com/${cityen}/" class="f999">更多热门资讯&nbsp;<span class="fSimSun">&gt;</span></a></p>
		</div>
		<c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
		<div class="inform-side fl">
			<h5 class="caption">${types[0].columnsName}</h5>
			<div class="expert">
				<div class="expert-phone">
					<a href="//news.centanet.com/${cityen}/detail/${leftUp[0].ID}.html" target="_blank">
						<c:choose>
							<c:when test="${leftUp[0].LitPic != null && leftUp[0].LitPic.length() >= 10}">
								<img src="${leftUp[0].LitPic}" alt="${leftUp[0].Title}">
							</c:when>
							<c:otherwise>
								<img src="${defaultpic}" alt="${leftUp[0].Title}">
							</c:otherwise>
						</c:choose>
					</a>
					<p class="txt"><a href="//news.centanet.com/${cityen}/detail/${leftUp[0].ID}.html" target="_blank">${fn:substring(leftUp[0].Title,0,28)}</a></p>
					<p class="opacity_bg"></p>
				</div>
				<ul class="expert-comment">
					<c:forEach items="${leftUp}" var="l" begin="1" end="4">
						<li><label for=""></label><a href="//news.centanet.com/${cityen}/detail/${l.ID}.html" target="_blank">${fn:substring(l.Title,0,28)}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="inform-main fr">
			<h5 class="caption">${types[2].columnsName}</h5>
			<div class="informbox">
				<div class="inform-special">
					<div class="special-item">
						<a href="//news.centanet.com/${cityen}/detail/${leftDown[0].ID}.html" target="_blank" title="${leftDown[0].Title}">
							<p class="photo fl">
								<c:choose>
									<c:when test="${leftDown[0].LitPic != null && leftDown[0].LitPic.length() >= 10}">
										<img src="${leftDown[0].LitPic}" alt="${leftDown[0].Title}">
									</c:when>
									<c:otherwise>
										<img src="${defaultpic}" alt="${leftDown[0].Title}">
									</c:otherwise>
								</c:choose>
							</p>
							<p class="title fl">${fn:substring(leftDown[0].Title,0,28)}</p>
							<p class="txt fl">
								${fn:substring(leftDown[0].Description , 0 , 52)}
								<c:if test="${leftDown[0].Description != null && leftDown[0].Description.length() >= 53}">...</c:if>
							</p></a>
					</div>
				</div>
				<div class="inform-main-bot clearfix">
					<dl class="inform-quest fl">
						<dd>
							<c:forEach items="${leftDown}" var="ri" begin="1" end="4">
								<p><i></i><a href="//news.centanet.com/${cityen}/detail/${ri.ID}.html" target="_blank">${fn:substring(ri.Title,0,28)}</a></p>
							</c:forEach>
						</dd>
					</dl>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
