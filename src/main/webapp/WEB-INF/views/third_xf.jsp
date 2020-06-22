<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


 <!-- S;information -->
<div class="section-wrap section-inform " >
	<div class="section">
		<div class="title-box clearfix">
		<h5 class="title">${citycn}热点资讯</h5>
		<p class="description">提供房产新闻</p>		
	</div>
		<%--left--%>
		<c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
		<div class="inform-main fl">
			<div class="inform-special">
				<h5 class="caption">${types[0].columnsName}</h5>
					<div class="special-item">
					<a href="//news.centanet.com/${cityen}/detail/${leftUp[0].ID}.html/" target="_blank">
						<p class="photo fl">
							<img src="${leftUp[0].LitPic}" onerror="this.src='${defaultpic}'" alt="${leftUp[0].Title}">
						</p>
						<p class="title fl">${leftUp[0].Title}</p>
						<p class="txt fl">${leftUp[0].Description}</p></a>
					</div>				
			   </div>			
			<div class="inform-main-bot clearfix">
				<dl class="inform-quest fl">				
					<dd>
						<c:forEach items="${leftUp}" var="l" begin="1" end="5">
							<p><i></i><a href="//news.centanet.com/${cityen}/detail/${l.ID}.html/" target="_blank">${l.Title}</a></p>
						</c:forEach>
					</dd>
				</dl>
			</div>			
		</div>
		<%--right--%>

		<div class="inform-side fr">
			<h5 class="caption">${types[1].columnsName}</h5>
			<div class="expert">
				<div class="expert-phone">
					<a href="//news.centanet.com/${cityen}/detail/${leftDown[0].ID}.html/" target="_blank"><img src="${leftDown[0].LitPic}" onerror="this.src='${defaultpic}'" alt="${leftDown[0].Title}" style="width: 400px;height: 266px;"></a>
					<p class="txt"><a href="//news.centanet.com/${cityen}/detail/${leftDown[0].ID}.html/" target="_blank">${leftDown[0].Title}</a></p>
					<p class="opacity_bg"></p>
				</div>
				<ul class="expert-comment">
					<c:forEach items="${leftDown}" var="item" begin="1" end="4">
						<li><a href="//news.centanet.com/${cityen}/detail/${item.ID}.html/" target="_blank" title="${item.Title}">${item.Title}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="clear"></div>

	</div>
</div>
 <p class="bot_link tc"><a href="//news.centanet.com/${cityen}" class="white_btn">更多新鲜资讯</a></p>

