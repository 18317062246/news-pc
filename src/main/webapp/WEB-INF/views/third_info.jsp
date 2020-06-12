<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1" />
	<meta name="renderer" content="webkit">
	<title>官网首页</title>
	<link rel="stylesheet" href="${staticurl}/css/basev6.css" >
	<link rel="stylesheet" href="${staticurl}/css/xfhome.css" >


</head>
<body >


 <!-- S;information -->
<div class="section-wrap section-inform " >
	<div class="section">
		<div class="title-box clearfix">
		<h5 class="title">${cityen}热点资讯</h5>
		<p class="description">提供房产新闻</p>		
	</div>
		<%--left--%>
		<div class="inform-main fl">
			<div class="inform-special">
				<h5 class="caption">${types[0].columnsName}</h5>
					<div class="special-item">
					<a href="">					
						<p class="photo fl">
							<img src="${leftUp[0].LitPic}" alt="">
						</p>
						<p class="title fl">${leftUp[0].Title}</p>
						<p class="txt fl">${leftUp[0].Description}</p></a>
					</div>				
			   </div>			
			<div class="inform-main-bot clearfix">
				<dl class="inform-quest fl">				
					<dd>
						<c:forEach items="${leftUp}" var="l" begin="1" end="5">
							<p><i></i><a href="">${l.Title}</a></p>
							<%--<p><i></i><a href="">11月底鲁东房成交增28%再破1万套年底推盘或井喷</a></p>
							<p><i></i><a href="">允许进城落户者自愿有偿退出或转让宅基地</a></p>
							<p><i></i><a href="">11月底鲁东房成交增28%再破1万套年底推盘或井喷</a></p>--%>
						</c:forEach>
					</dd>
				</dl>
			</div>			
		</div>
		<%--right--%>
		<div class="inform-side fr">
			<h5 class="caption">${types[2].columnsName}</h5>
			<div class="expert">
				<div class="expert-phone">
					<a href=""><img src="${leftDown[0].LitPic}" alt="${leftDown[0].Title}"></a>
					<p class="txt"><a href="">${leftDown[0].Title}</a></p>
					<p class="opacity_bg"></p>
				</div>
				<ul class="expert-comment">
					<c:forEach items="${leftDown}" var="item" begin="0" end="3">
						<li><a href="">${item.Title}</a></li>
						<%--<li><a href="">全款购房买卖双方需要准备的资料?</a></li>
						<li><a href="">2016北京房价全面解析：买一套房比三年前高百万</a></li>
						<li><a href="">2016北京房价全面解析</a></li>--%>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>

<div class="section-wrap section-informHS section-inform-national">
	<div class="section ">
		<div class="title-box clearfix">
		<h5 class="title">${cityen}热点资讯</h5>
		<p class="description">提供房产新闻</p>		
	</div>
			<%--bottom-left--%>
		<div class="inform-main fl">
			<div class="inform-main-top">
				<dl class="inform-quest ">
					<dt class="caption"><a href="">${right[0].Title}</a></dt>
					<dd>
						<p>经市政府批准，自2018年5月1日起，本市将进一步扩大租房补贴保障范围，上调补贴标准，同时扩大出租人补贴范围，补贴政策调整力度为近年来最大的一次。</p>
						<p>经市政府批准，自2018年5月1日起，本市将进一步扩大租房补贴保障范围，上调补贴标准，同时扩大出租人补贴范围，补贴政策调整力度为近年来最大的一次。</p>
						<p class="bot"><a href="" class="tdu">@${types[0].columnsName}</a></p>
					</dd>
				</dl>
			</div>
			<div class="inform-main-bot">
				<dl class="inform-quest ">
					<dt class="caption"><a href="">${right[1].Title}</a></dt>
					<dd>
						<p>${right[0].Description}</p>
						<p class="bot"><a href="" class="tdu">@${types[2].columnsName}</a></p>
					</dd>
				</dl>
			</div>		
		</div>
		<%--<bottom-right>--%>
		<div class="inform-side fl">			
			<div class="expert">
				<div class="expert-phone">
					<a href=""><img src="${right[1].LitPic}" alt=""></a>
				</div>
					<ul class="expert-comment">
					<c:forEach items="${right}" var="ri" begin="1" end="3">
						<li><a href="">${ri.Title}</a></li>
						<%--<li><a href="">我们都有选择恐惧症</a></li>
						<li><a href="">东风吹战鼓擂，拆迁之喜轮到谁</a></li>
						<li><a href="">碧桂园底价摘宝坻京津新城57号地（楼面价3058元/平）</a></li>--%>
					</c:forEach>
				</ul>
				<p class="bot "><a href="" class="tdu f666">@${types[2].columnsName}</a></p>
			</div>
		</div>
		<div class="clear"></div>
		 <p class="bot_link tc"><a href="//news.centanet.com/${cityen}" class="white_btn">更多新鲜资讯</a></p>
	</div>
</div>
</body>
</html>
