<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<body >


<div class="section-wrap section-informHS section-inform-national">
	<div class="section ">
		<div class="title-box clearfix">
		<h5 class="title">${citycn}热点资讯</h5>
		<p class="description">提供房产新闻</p>
		<p class="r-more fr"><a href="//${websiteSuffix}/${cityen}/?entry=资讯tag" class="f999">更多热门资讯 <span class="fSimSun">></span></a></p>
		</div>

		<div class="inform-main fl">
			<div class="inform-main-top">
				<dl class="inform-quest ">
					<dt class="caption"><a href="//${websiteSuffix}/${cityen}/detail/${leftUp[0].ID}.html" target="_blank" title="${leftUp[0].Title}">${fn:substring(leftUp[0].Title,0,28)}</a></dt>
					<dd>
						<%--<c:forEach items="${leftUp}" var="l" begin="0" end="0">--%>
							<p><a href="javascript:void(0);" target="_blank" title="${leftUp[0].Title}">${leftUp[0].Description}</a></p>
						<%--</c:forEach>--%>

						<p class="bot"><a href="//${websiteSuffix}/${cityen}/list/c${types[0].id}/?entry=资讯tag" class="tdu">@${types[0].columnsName}</a></p>
					</dd>
				</dl>
			</div>
			<div class="inform-main-bot">
				<dl class="inform-quest ">
					<c:forEach items="${leftDown}" var="left" begin="0" end="3">
						<dt class="caption"><a href="//${websiteSuffix}/${cityen}/detail/${left.ID}.html" target="_blank" title="${left.Title}">${left.Title}</a></dt>
					</c:forEach>
					<dd>
						<p class="bot"><a href="//${websiteSuffix}/${cityen}/list/c${types[1].id}/?entry=资讯tag" class="tdu">@${types[1].columnsName}</a></p>
					</dd>
				</dl>
			</div>		
		</div>
		<bottom-right>
		<div class="inform-side fl">			
			<div class="expert">
				<div class="expert-phone">
					<c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
					<a href="//${websiteSuffix}/${cityen}/detail/${right[0].ID}.html" target="_blank" title="${right[0].Title}">
						<c:choose>
							<c:when test="${right[0].LitPic != null && right[0].LitPic.length() >= 10}">
								<img src="${right[0].LitPic}" alt="${right[0].Title}">
							</c:when>
							<c:otherwise>
								<img src="${defaultpic}" alt="${right[0].Title}">
							</c:otherwise>
						</c:choose>
					</a>
				</div>
					<ul class="expert-comment">
					<c:forEach items="${right}" var="ri" begin="0" end="3">
						<li><a href="//${websiteSuffix}/${cityen}/detail/${ri.ID}.html" target="_blank">${fn:substring(ri.Title,0,28)}</a></li>
					</c:forEach>
				</ul>
				<p class="bot "><a href="//${websiteSuffix}/${cityen}/list/c${types[2].id}/?entry=资讯tag" class="tdu f666">@${types[2].columnsName}</a></p>
			</div>
		</div>
		</bottom-right>
		<div class="clear"></div>

	</div>
</div>
