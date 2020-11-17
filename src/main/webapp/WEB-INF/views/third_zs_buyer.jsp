<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <!-- 资讯百科 -->
    <div class="section-wrap section-encyclo" >
        <div class="section" >
            <div class="top_caption">
                <h5 class="tit">买房帮手</h5>
                <p><a href="//news.centanet.com/${cityen}/list/c${types[1].id}/" class="tu f9">全部买房帮手<%--${baike}--%></a></p>
            </div>
            <ul class="encyclo-list">
                <c:forEach items="${leftDown}" var="item" begin="0" end="1">
                    <li>
                        <i></i>
                        <a href="//news.centanet.com/${cityen}/detail/${item.ID}.html" class="f3" target="_blank" title="${item.Title}">${fn:substring(item.Title,0,20)}</a>
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