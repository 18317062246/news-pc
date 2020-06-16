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
    <title>03-楼盘详情</title>
   <%-- <link rel="stylesheet" href="${staticurl}/css/basev6.css">
    <link rel="stylesheet" href="${staticurl}/css/xinfangdetailv6.css">--%>
</head>

<body >
    <!-- 资讯百科 -->
    <div class="section-wrap section-encyclo s5" id="newlatest" style="margin:30px auto;" >
        <div class="section" >
            <div class="top_caption">
                <h5 class="tit">资讯百科</h5>
                <p><a href="//news.centanet.com/${cityen}/baike/" class="tu f9">全部百科<%--${baike}--%></a></p>
            </div>
            <ul class="encyclo-list">
                <c:forEach items="${baike}" var="item">
                    <li>
                        <i></i>
                        <a href="//news.centanet.com/${cityen}/detail/${item.ID}.html/" class="f3" target="_blank" title="${item.Title}">${fn:substring(item.Title,0,20)}</a>
                        <span class="date f9">
                                <jsp:useBean id="myDate" class="java.util.Date"/>
                                <c:set target="${myDate}" property="time" value="${item.PublishDate*1000}"/>
                                <fmt:formatDate pattern="yyyy.MM.dd" value="${myDate}" type="both"/>
                        </span>
                    </li>
                </c:forEach>
            </ul>
        </div>                
    </div>   
</body>
</html>