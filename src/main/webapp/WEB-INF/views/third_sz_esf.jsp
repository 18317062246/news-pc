<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<div class="section  section-informSZ">
    <div class="title-top">
        <h5><span class="fb">热门专题</span></h5>
        <p class="txt">楼市动态，一应俱全</p>
    </div>
    <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
    <div class="inform-side fl">
        <div class="expert">
            <div class="expert-phone">
                <span style="color: #FFF;background-color: #000;text-align: center;position: absolute;opacity: 0.6;height: 40px;width: 520px;line-height: 30px;bottom: 0px;font-size: 18px;}" title="${leftUp[0].Title}">${leftUp[0].Title}</span>
                <a   target="_blank"  href="//news.centanet.com/${cityen}/detail/${leftUp[0].ID}.html" >
                    <img src="${leftUp[0].LitPic}" alt="${leftUp[0].Title}" onerror="this.src='${defaultpic}'"></a>
            </div>
            <ul class="expert-comment">
                <c:forEach items="${leftUp}" var="l" begin="1" end="4">
                    <li><i></i><a   target="_blank"  href="//news.centanet.com/${cityen}/detail/${l.ID}.html" title="${l.Title}">${l.Title}</a></li>
                </c:forEach>

            </ul>
            <p class="bot "><a target="_blank" href="//news.centanet.com/${cityen}/list/c${types[0].id}/" class="tdu f666">@${types[0].columnsName}</a></p>
        </div>
    </div>
    <div class="inform-main fl">
        <div class="inform-main-top">
            <dl class="inform-quest ">
                <dd>
                    <ul class="expert-comment">
                        <c:forEach items="${leftDown}" var="l" begin="0" end="4">
                            <li><i></i><a  target="_blank" href="//news.centanet.com/${cityen}/detail/${l.ID}.html" title="${l.Title}">${l.Title}</a></li>
                        </c:forEach>
                    </ul>
                    <p class="bot"><a target="_blank" href="//news.centanet.com/${cityen}/list/c${types[1].id}/" class="tdu f666">@${types[1].columnsName}</a></p>
                </dd>
            </dl>
        </div>
        <div class="inform-main-bot">
            <dl class="inform-quest ">
                <dd>
                    <ul class="expert-comment">
                        <c:forEach items="${right}" var="r" begin="0" end="3">
                            <li><i></i><a   target="_blank"  href="//news.centanet.com/${cityen}/detail/${r.ID}.html" title="${r.Title}">${r.Title}</a></li>
                        </c:forEach>
                    </ul>
                    <p class="bot"><a target="_blank" href="//news.centanet.com/${cityen}/list/c${types[2].id}/" class="tdu f666">@${types[2].columnsName}</a></p>
                </dd>
            </dl>
        </div>
    </div>
    <div class="clear"></div>
    <p class="bot_link tc"><a target="_blank" href="//news.centanet.com/${cityen}/" class="white_btn">更多新鲜资讯</a></p>
</div>
