<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="section-wrap section-zuixinzixun">
    <div class="section">
        <div class="tit-top clearfix">
            <h5>最新资讯</h5>
        </div>
        <div class="zuixinzixun-list">
            <ul class="clearfix">
                <li>
                    <div class="room-img">
                        <a href="//${websiteSuffix}/${cityen}/detail/${jingjiren[2].ID}.html"><img alt="${jingjiren[2].Title}" src="${jingjiren[2].LitPic}"><p class="opacityB">${jingjiren[2].Title}</p>
                        </a>

                    </div>
                </li>
                <li>
                    <div class="room-img">
                        <a href="//${websiteSuffix}/${cityen}/detail/${jingjiren[1].ID}.html"><img alt="${jingjiren[1].Title}" src="${jingjiren[1].LitPic}"><p class="opacityB">${jingjiren[1].Title}</p></a>
                    </div>
                </li>
                <li class="last">
                    <div class="room-img">
                        <a href="//${websiteSuffix}/${cityen}/detail/${jingjiren[0].ID}.html"><img alt="${jingjiren[0].Title}" src="${jingjiren[0].LitPic}"><p class="opacityB">${jingjiren[0].Title}</p></a>
                    </div>
                </li>

            </ul>
        </div>

    </div>

</div>
        
    