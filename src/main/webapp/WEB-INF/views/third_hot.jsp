<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1" />
	<meta name="renderer" content="webkit">
	<title>官网首页</title>
	<%--<link rel="stylesheet" href="${staticurl}/css/basev6.css" >
	<link rel="stylesheet" href="${staticurl}/css/xfhome.css" >--%>


</head>
<body >


<div class="section-wrap section-informHS section-inform-national">
	<div class="section ">
		<div class="title-box clearfix">
		<h5 class="title">${citycn}热点资讯</h5>
		<p class="description">提供房产新闻</p>		
		</div>

		<div class="inform-main fl">
			<div class="inform-main-top">
				<dl class="inform-quest ">
					<dt class="caption"><a href="//news.centanet.com/${cityen}/detail/${leftUp[0].ID}.html/" target="_blank" title="${leftUp[0].Title}">${fn:substring(leftUp[0].Title,0,28)}</a></dt>
					<dd>
						<%--<c:forEach items="${leftUp}" var="l" begin="0" end="0">--%>
							<p><a href="javascript:void(0);" target="_blank" title="${leftUp[0].Title}">${leftUp[0].Description}</a></p>
						<%--</c:forEach>--%>

						<p class="bot"><a href="//news.centanet.com/${cityen}/list/c${types[0].id}/" class="tdu">@${types[0].columnsName}</a></p>
					</dd>
				</dl>
			</div>
			<div class="inform-main-bot">
				<dl class="inform-quest ">
					<dt class="caption"><a href="//news.centanet.com/${cityen}/detail/${leftDown[0].ID}.html/" target="_blank" title="${leftDown[0].Title}">${leftDown[0].Title}</a></dt>
					<dd>
						<p>${leftDown[0].Description}</p>
						<p class="bot"><a href="//news.centanet.com/${cityen}/list/c${types[1].id}/" class="tdu">@${types[1].columnsName}</a></p>
					</dd>
				</dl>
			</div>		
		</div>
		<bottom-right>
		<div class="inform-side fl">			
			<div class="expert">
				<div class="expert-phone">
					<a href="//news.centanet.com/${cityen}/detail/${right[0].ID}.html/" target="_blank" title="${right[0].Title}"><img src="${right[0].LitPic}" alt="${right[0].Title}"></a>
				</div>
					<ul class="expert-comment">
					<c:forEach items="${right}" var="ri" begin="1" end="4">
						<li><a href="//news.centanet.com/${cityen}/detail/${ri.ID}.html/" target="_blank">${fn:substring(ri.Title,0,28)}</a></li>
					</c:forEach>
				</ul>
				<p class="bot "><a href="//news.centanet.com/${cityen}/list/c${types[2].id}/" class="tdu f666">@${types[2].columnsName}</a></p>
			</div>
		</div>
		</bottom-right>
		<div class="clear"></div>
		 <p class="bot_link tc"><a href="//news.centanet.com/${cityen}/" class="white_btn">更多新鲜资讯</a></p>
	</div>
</div>
</body>
</html>
