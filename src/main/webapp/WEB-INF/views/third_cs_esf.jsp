<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="section-wrap section-informHS section-inform-national">
	<div class="section ">
		<div class="title-box clearfix">
			<h5 class="title">长沙热点资讯</h5>
			<p class="description">提供房产新闻</p>
		</div>

		<div class="inform-main fl">
			<%--左上--%>
			<div class="inform-main-top">
				<dl class="inform-quest ">
					<dt class="caption"><a href="//news.centanet.com/${cityen}/detail/${leftUp[0].ID}.html" target="_blank" title="${leftUp[0].Title}">${leftUp[0].Title}</a></dt>
					<dd>
						<p>&nbsp; &nbsp; &nbsp; ${leftUp[0].Description}</p>
						<p style="margin-left:0px;margin-top:25px;"><a href="//news.centanet.com/${cityen}/list/c${types[0].id}/" class="tdu">@${types[0].columnsName}</a></p>
					</dd>
				</dl>
			</div>
				<%--左下--%>
			<div class="inform-main-bot">
				<dl class="inform-quest ">
					<dt class="caption"><a href="//news.centanet.com/${cityen}/detail/${leftDown[0].ID}.html" target="_blank" title="${leftDown[0].Title}">${leftDown[0].Title}</a></dt>
					<dd>
						<p>&nbsp; &nbsp; &nbsp; ${leftDown[0].Description}</p>

						<p style="margin-left:0px;margin-top:25px;"><a href="//news.centanet.com/${cityen}/list/c${types[1].id}/" class="tdu">@${types[1].columnsName}</a></p>
					</dd>
				</dl>
			</div>
		</div>
		<div class="inform-side fl">
			<div class="expert">
				<c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
				<%--右上图片--%>
				<div class="expert-phone">
					<a href="//news.centanet.com/${cityen}/detail/${right[0].ID}.html" target="_blank" title="${right[0].Title}">
						<c:choose>
							<c:when test="${right[0].LitPic != null && right[0].LitPic.length() >= 10}">
								<img src="${right[0].LitPic}" alt="${right[0].Title}">
							</c:when>
							<c:otherwise>
								<img src="${defaultpic}" alt="${right[0].Title}" width="1088.98px" height="727px">
							</c:otherwise>
						</c:choose>
					</a>
				</div>
				<ul class="expert-comment">
					<c:forEach items="${right}" var="r" begin="1" end="4">
						<li><a href="//news.centanet.com/${cityen}/detail/${r.ID}.html" target="_blank" title="${r.Title}">${r.Title}</a></li>
					</c:forEach>
				</ul>
				<p class="bot "><a href="//news.centanet.com/${cityen}/list/c${types[2].id}/" class="tdu f666">@${types[2].columnsName}</a></p>
			</div>
		</div>
		<div class="clear"></div>
		<p class="bot_link tc"><a href="//news.centanet.com/${cityen}/" class="white_btn">更多新鲜资讯</a></p>
	</div>
</div>
