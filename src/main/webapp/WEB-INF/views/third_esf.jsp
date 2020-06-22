<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
					<dt class="caption"><a href="//news.centanet.com/${cityen}/detail/${leftUp[0].ID}.html/" target="_blank" title="${leftUp[0].Title}">${leftUp[0].Title}</a></dt>
					<dd>
						<p class="mid">${leftUp[0].Description}</p>
						<p class="bot"><a href="//news.centanet.com/${cityen}/list/c${types[0].id}/" class="tdu">@${types[0].columnsName}</a></p>
					</dd>
				</dl>
			</div>

             <%--左下--%>
            <div class="inform-main-bot">
               <dl class="inform-quest ">
                   <dt class="caption"><a href="//news.centanet.com/${cityen}/detail/${leftDown[0].ID}.html/" target="_blank" title="${leftDown[0].Title}">${leftDown[0].Title}</a></dt>
                   <dd>
                    <p class="mid">${leftDown[0].Description}</p>

                     <p class="bot"><a href="//news.centanet.com/${cityen}/list/c${types[1].id}/" class="tdu">@${types[1].columnsName}</a></p>
                    </dd>
               </dl>
           </div>
		</div>	
		<div class="inform-side fl">			
			<div class="expert">
				<c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
				<%--右上图片--%>
					<a href="//news.centanet.com/${cityen}/detail/${right[0].ID}.html/" target="_blank" title="${right[0].Title}"><img src="${right[0].LitPic}" alt="${right[0].Title}" onerror="this.src='${defaultpic}'"></a>
					<%--右下--%>
					<ul class="expert-comment">
						<c:forEach items="${right}" var="r" begin="1" end="4">
							<li><a href="//news.centanet.com/${cityen}/detail/${r.ID}.html/" target="_blank" title="${r.Title}">${r.Title}</a></li>
						</c:forEach>
					</ul>
						<p class="bot "><a href="//news.centanet.com/${cityen}/list/c${types[2].id}/" class="tdu f666">@${types[2].columnsName}</a></p>

				</div>



		</div>
		<div class="clear"></div>
		 <p class="bot_link tc"><a href="//news.centanet.com/${cityen}/" class="white_btn">更多新鲜资讯</a></p>
	</div>
</div>
