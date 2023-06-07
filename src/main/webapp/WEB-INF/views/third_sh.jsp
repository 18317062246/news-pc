<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="section-wrap section-wikipedia">
    <div class="section">
        <div class="title-box clearfix">
            <h5 class="title">房产百科</h5>
            <p class="r-more fr"><a target="_blank" href="//news.centanet.com/sh/">更多房产资讯&nbsp;<span class="fSimSun">&gt;</span></a></p>
        </div>
        <div class="wikipedia-main clearfix">
            <div class="wikipedia-left fl">
                <a  target="_blank" href="${right[0].fieldname}"><img src="${right[0].LitPic}"alt="${right[0].Title}" class="bigphoto">
                    <span title="${right[0].Title}" class="tit">${right[0].Title}</span>
                    <span title="${right[0].Description}" class="txt">${right[0].Description}</span>
                </a>
            </div>
            <div class="wikipedia-right fr">
                <div class="head clearfix">
                    <div class="wiki-item fl">
                        <a target="_blank" href="${right[1].fieldname}"><img src="${right[1].LitPic}" alt="${right[1].Title}" class="photo">
                            <span title="${right[1].Title}" class="tit">${right[1].Title}</span>
                            <span title="${right[1].Description}" class="txt">${fn:substring(right[1].Description,0,37)}</span>
                        </a>
                    </div>
                    <div class="wiki-item fr">
                        <a target="_blank" href="${right[2].fieldname}"><img src="${right[2].LitPic}" alt="${right[2].Title}" class="photo">
                            <span title="${right[2].Title}" class="tit">${right[2].Title}</span>
                            <span title="${right[2].Description}" class="txt">${fn:substring(right[2].Description,0,37)}</span>
                        </a>
                    </div>
                </div>
                <div class="wikibot">
                    <a target="_blank" href="${right[3].fieldname}"><img src="${right[3].LitPic}" alt="${right[3].Title}" class="crossphoto">
                        <span title="${right[3].Title}" class="tit">${right[3].Title}</span>
                        <span title="${right[3].Description}" class="txt">${right[3].Description}</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- <%= (new java.util.Date()).toLocaleString()%> -->