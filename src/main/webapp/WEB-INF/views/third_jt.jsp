<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 资讯-->
<div class="section-wrap section-zixunlayer">
    <div class="section">
        <div class="title-box clearfix">
            <h5 class="title">热门资讯</h5>
            <p class="r-more fr"><a href="//${websiteSuffix}/${cityen}/?entry=资讯tag" target="_blank">更多资讯&nbsp;<span class="fSimSun">&gt;</span></a></p>
        </div>
        <div class="zixun-content-box clearfix">
            <div class="zixuncolumn-left fl">
                <div class="zixun-bigpic-item" style="background-image:url(${leftUp[0].LitPic});">
                    <a href="" class="zixun_link hide"></a>
                    <p class="title">${leftUp[0].Title}</p>
                </div>
                <div class="zixun-bigpic-item hide" style="background-image:url(${leftDown[0].LitPic}) ;">
                    <a href="" class="zixun_link"></a>
                    <p class="title">${leftDown[0].Title}</p>
                </div>
                <div class="zixun-bigpic-item hide" style="background-image:url(${right[0].LitPic})">
                    <a href="" class="zixun_link"></a>
                    <p class="title">${right[0].Title}</p>
                </div>
            </div>
            <div class="zixuncolumn-right fr">
                <ul class="zixuntab-bar clearfix">
                    <li class="active" index="0">${leftUp[0].TypeName}</li>
                    <li class="" index="1">${leftDown[0].TypeName}</li>
                    <li index="2" class="">${right[0].TypeName}</li>
                </ul>
                <ul class="zixun-cont-list">
                    <li><a href="//${websiteSuffix}/${cityen}/detail/${leftUp[1].ID}.html" target="_blank">${leftUp[1].Title}</a></li>
                    <li><a href="//${websiteSuffix}/${cityen}/detail/${leftUp[2].ID}.html" target="_blank">${leftUp[2].Title}</a></li>
                    <li><a href="//${websiteSuffix}/${cityen}/detail/${leftUp[3].ID}.html" target="_blank">${leftUp[3].Title}</a></li>
                </ul>
                <ul class="zixun-cont-list hide">
                    <li><a href="//${websiteSuffix}/${cityen}/detail/${leftDown[1].ID}.html" target="_blank">${leftDown[1].Title}</a></li>
                    <li><a href="//${websiteSuffix}/${cityen}/detail/${leftDown[2].ID}.html" target="_blank">${leftDown[2].Title}</a></li>
                    <li><a href="//${websiteSuffix}/${cityen}/detail/${leftDown[3].ID}.html" target="_blank">${leftDown[3].Title}</a></li>
                </ul>
                <ul class="zixun-cont-list hide">
                    <li><a href="//${websiteSuffix}/${cityen}/detail/${right[1].ID}.html" target="_blank">${right[1].Title}</a></li>
                    <li><a href="//${websiteSuffix}/${cityen}/detail/${right[2].ID}.html" target="_blank">${right[2].Title}</a></li>
                    <li><a href="//${websiteSuffix}/${cityen}/detail/${right[3].ID}.html" target="_blank">${right[3].Title}</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

