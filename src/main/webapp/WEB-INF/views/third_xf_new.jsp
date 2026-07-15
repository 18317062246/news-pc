<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="section section-informSZ  section-informBj">
	<div class="title-top">
		<h5 style="width: 100%;">市场热点资讯</h5>
		<p class="txt">楼市动态&nbsp;一应俱全</p>
		<a href="//${websiteSuffix}/${cityen}/?entry=资讯tag" class="more_link" style="font-size: 13px;" target="_blank">更多资讯&nbsp;
			<span class="fSimSun" style="font-size: 13px;">&gt;</span>
		</a>
	</div>
	<c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
	<div class="inform-side fl ">
		<div class="expert"><div class="expert-phone">
			<a href="//${websiteSuffix}/${cityen}/detail/${leftUp[0].ID}.html" target="_blank">
				<c:choose>
					<c:when test="${leftUp[0].LitPic != null && leftUp[0].LitPic.length() >= 10}">
						<img src="${leftUp[0].LitPic}" alt="${leftUp[0].Title}">
					</c:when>
					<c:otherwise>
						<img src="${defaultpic}" alt="${leftUp[0].Title}">
					</c:otherwise>
				</c:choose>
			</a>
			<span style="color: #FFF;background-color: #000;text-align: center;position: absolute;opacity: 0.6;height: 40px;width: 100%;line-height: 30px;bottom: 0px;font-size: 18px;display:block;" title="${leftUp[0].Title}">
				${fn:substring(leftUp[0].Title,0,28)}
			</span>
		</div>
			<ul class="expert-comment">
				<c:forEach items="${leftUp}" var="l" begin="1" end="4">
					<li><i></i>
						<a target="_blank" href="//${websiteSuffix}/${cityen}/detail/${l.ID}.html" title="${l.Title}">
								${fn:substring(l.Title,0,28)}
								<c:if test="${l.Title != null && l.Title.length() > 29}">
									<span>...</span>
								</c:if>
						</a></li>
				</c:forEach>
			</ul>
			<p class="bot ">
				<a target="_blank" href="//${websiteSuffix}/${cityen}/list/c${types[0].id}/?entry=资讯tag" class="tdu f666">@${types[0].columnsName}</a>
			</p></div></div><div class="inform-main fl ">
	<div class="inform-main-top">
		<dl class="inform-quest ">
			<dd><ul class="expert-comment">
				<c:forEach items="${leftDown}" var="l" begin="0" end="4">
					<li><i></i>
						<a target="_blank" href="//${websiteSuffix}/${cityen}/detail/${l.ID}.html"
						   title="${l.Title}">
								${fn:substring(l.Title,0,28)}
									<c:if test="${l.Title != null && l.Title.length() > 29}">
										<span>...</span>
									</c:if>
						</a>
					</li>
				</c:forEach>

			</ul>
				<%--<p class="bot">
					<a target="_blank" href="//${websiteSuffix}/${cityen}/list/${types[1].id}/" class="tdu f666">@${types[1].columnsName}</a>
				</p>--%>
			</dd>
		</dl>
	</div>
	<div class="inform-main-bot">
		<dl class="inform-quest ">
			<dd style="background:#fff;">
				<ul class="expert-comment">
					<c:forEach items="${right}" var="r" begin="0" end="3">
						<li>
							<i></i>
							<a target="_blank" href="//${websiteSuffix}/${cityen}/detail/${r.ID}.html" title="${r.Title}">
								${fn:substring(r.Title,0,28)}
								<c:if test="${r.Title != null && r.Title.length() > 29}">
									<span>...</span>
								</c:if>
							</a>
						</li>
					</c:forEach>

				</ul>
				<p class="bot">
					<a target="_blank" href="//${websiteSuffix}/${cityen}/list/c${types[2].id}/?entry=资讯tag" class="tdu f666">@${types[2].columnsName}</a>
				</p>
			</dd>
		</dl>
	</div>
</div>
	<div class="clear"></div>
</div>
</div>

