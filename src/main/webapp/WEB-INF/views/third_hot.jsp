<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="https://news.centanet.com/uploads/favicon.ico" type="image/x-icon"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1" />
	<meta name="renderer" content="webkit">
	<title>官网首页资讯</title>
	<link rel="stylesheet" href="${staticurl}/css/homev6.css" >
</head>
<body >
<div class="section-wrap section-inform section-inform-national">
	<div class="section ">
		<div class="title-top">
			<h5><span class="fb">热门专题</span></h5>
			<p class="txt">楼市动态<i class="a_word"></i>一应俱全</p>
		 </div>
			
		<div class="inform-main fl">
			<%--左上--%>
			<div class="inform-main-top">
				<dl class="inform-quest ">
					<dt class="caption"><a href="">${leftUp[0].Title}</a></dt>
					<dd>
						<p class="mid">${leftUp[0].Description}</p>
						
						<p class="bot"><a href="" class="tdu">@${types[1].columnsName}</a></p>
					</dd>
				</dl>
			</div>
				<%--左下--%>
			<div class="inform-main-bot">
				<dl class="inform-quest ">
					<dt class="caption"><a href="">${leftDown[0].Title}</a></dt>
					<dd>
						<p class="mid">${leftDown[0].Description}</p>
						<p class="bot"><a href="" class="tdu">@${types[0].columnsName}</a></p>
					</dd>
				</dl>
			</div>		
		</div>	
		<div class="inform-side fl">			
			<div class="expert">
				<%--右上图片--%>
				<div class="expert-phone">
					<a href=""><img src="${right[1].LitPic}?x-oss-process=style/450x320" alt=""></a>
				</div>
					<%--右下--%>
				<ul class="expert-comment">
					<c:forEach items="${right}" var="r" begin="0" end="3">
						<li><a href="//news.centanet.com/${cityen}/detail/${r.ID}.html" target="_blank">${r.Title}</a></li>
					<%--	<li><a href="">我们都有选择恐惧症</a></li>
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
