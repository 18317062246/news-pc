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
					<dt class="caption"><a href="//news.centanet.com/${cityen}/detail/${right[0].ID}.html/" target="_blank" title="${right[0].Title}">${fn:substring(right[0].Title,0,20)}</a></dt>
					<dd>
						<c:forEach items="${leftUp}" var="l" begin="0" end="6">
							<p><a href="//news.centanet.com/${cityen}/detail/${right[1].ID}.html/" target="_blank" title="${l.Title}"></a>${fn:substring(l.Title,0,20)}</p>
						</c:forEach>

						<p class="bot"><a href="//news.centanet.com/${cityen}/list/c${types[0].id}/" class="tdu">@${types[0].columnsName}</a></p>
					</dd>
				</dl>
			</div>
			<div class="inform-main-bot">
				<dl class="inform-quest ">
					<dt class="caption"><a href="//news.centanet.com/${cityen}/detail/${right[0].ID}.html/" target="_blank" title="${right[0].Title}">${fn:substring(right[0].Title,0,20)}</a></dt>
					<dd>
						<p>${right[0].Description}</p>
						<p class="bot"><a href="//news.centanet.com/${cityen}/list/c${types[2].id}/" class="tdu">@${types[2].columnsName}</a></p>
					</dd>
				</dl>
			</div>		
		</div>
		<bottom-right>
		<div class="inform-side fl">			
			<div class="expert">
				<div class="expert-phone">
					<a href="//news.centanet.com/${cityen}/detail/${right[1].ID}.html/" target="_blank" title="${right[1].Title}"><img src="${right[1].LitPic}?x-oss-process=style/450x320" alt=""></a>
				</div>
					<ul class="expert-comment">
					<c:forEach items="${right}" var="ri" begin="0" end="3">
						<li><a href="//news.centanet.com/${cityen}/detail/${ri.ID}.html/" target="_blank">${fn:substring(ri.Title,0,20)}</a></li>
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
