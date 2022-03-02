<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="section-wrap section-wikipedia">
    <div class="section">
        <div class="title-box clearfix">
            <h5 class="title">房产百科</h5>
            <p class="r-more fr"><a href="//sh.centanet.com/faxian/">更多房产资讯&nbsp;<span class="fSimSun">&gt;</span></a></p>
        </div>
        <div class="wikipedia-main clearfix">
            <div class="wikipedia-left fl">
                <a href="${shleft[0].url}"><img src="${leftUp[0].LitPic}"alt="" class="bigphoto">
                    <span class="tit">${leftUp[0].Title}</span>
                    <span class="txt">${leftUp[0].Description}</span>
                </a>
            </div>
            <div class="wikipedia-right fr">
                <div class="head clearfix">
                    <div class="wiki-item fl">
                        <a href="${shleft[1].url}"><img src="${leftUp[1].LitPic}" alt="" class="photo">
                            <span class="tit">${leftUp[1].Title}</span>
                            <span class="txt">${leftUp[1].Description}</span>
                        </a>
                    </div>
                    <div class="wiki-item fr">
                        <a href="${shleft[2].url}"><img src="${leftUp[2].LitPic}" alt="" class="photo">
                            <span class="tit">${leftUp[2].Title}</span>
                            <span class="txt">${leftUp[2].Description}</span>
                        </a>
                    </div>
                </div>
                <div class="wikibot">
                    <a href="${shleft[3].url}"><img src="${leftUp[3].LitPic}" alt="" class="crossphoto">
                        <span class="tit">${leftUp[3].Title}</span>
                        <span class="txt">${leftUp[3].Description}</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>