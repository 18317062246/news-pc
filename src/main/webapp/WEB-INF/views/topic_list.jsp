<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="mfn" uri="/WEB-INF/mfn.tld"%>
<html>
<head>
    <!-- <meta name="renderer" content="webkit">
     目前IE最新的正常模式去浏览
  <meta http-equiv="x-ua-compatible" content="IE=edge">-->
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
    <meta name="keywords" content="北京最新房产新闻,北京房产资讯,北京楼市政策,北京房产资讯,北京房地产新闻">
    <meta name="description" content="北京房产新闻,北京中原地产提供最及时北京房产新闻、北京房地产资讯，为您解读北京房产最新政策，预测北京房价走势，分析北京楼市成交数据。中原地产最资深最可靠的房地产网站。" />
    <title>${citycn}房地产资讯_${citycn}专题列表－${citycn}中原地产</title>
    <link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${staticurl}/css/cent_basev3.css">
    <link rel="stylesheet" href="${staticurl}/css/icons.css">
    <link rel="stylesheet" href="${staticurl}/css/keio.css">
    <link rel="stylesheet" href="${staticurl}/css/topic_list_cent_information.css">
    <link rel="stylesheet" href="${staticurl}/sidebar/sidebar.css">
    <link rel="stylesheet" href="${staticurl}/css/footer.css">
    <script src="${staticurl}/js/jquery-1.7.min.js"></script>
    <script src="${staticurl}/sidebar/common.js"></script>
    <script src="${staticurl}/sidebar/quick_links.js"></script>
    <script src="${staticurl}/js/placeholder.js"></script>
    <script src="${staticurl}/js/head.js"></script>
    <script src="${staticurl}/js/jquery.lazyload.min.js"></script>
    <script type="text/javascript" src="${staticurl}/js/sale_house_cookie.js" language="javascript"></script>
    <%--图片放大效果--%>
    <link rel="stylesheet" href="${staticurl}/css/news_list_photo_enlarge.css">
    <script>
        function getIframe(id){
            return document.getElementById(id).contentWindow.document;
        }
        function frameDiv(){
            getIframe("iframeA").getElementById("loginInfo").style.display="block";
        }
    </script>
</head>
<body>
<%--head--%>
<%@include file="/WEB-INF/views/head.jsp" %>
<!-- S;centmain-wraper -->
<div class="centmain-wraper centmain-wraper-infor" >
    <div class="centmain-inner">
        <div class="breadcrumbs clearfix" >
            <div class="fl breadcrumbs-area f123 ">
                <a href="//${cityen}.centanet.com" class="f123">${citycn}中原地产</a>
                <span class="fsm">&gt;</span>
                <a href="/${cityen}/" class="f123">${citycn}资讯</a>
                <span class="fsm">&gt;</span>
                <a href="/${cityen}/list/c${type}/p${page}/" class="f123">${colName}</a>
            </div>
        </div>
        <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
        <div class="speciallayer">

            <c:forEach items="${news}" var="item">
                <div class="special-item">
                    <a href="/${cityen}/detail/${item.ID}.html" class="link" title="${item.Title}" target="_blank">
                        <c:choose>
                            <c:when test="${item.LitPic != null && item.LitPic.length() > 10}">
                                    <img class="lazy news-img"
                                         src="${defaultpic}"
                                         data-original="${fn:substring(item.LitPic, 0 , mfn:lastIndexOf(item.LitPic, "."))}_450x320_w${fn:substring(item.LitPic,mfn:lastIndexOf(item.LitPic, ".") , fn:length(item.LitPic))}"
                                         alt="${item.Title}"/>
                            </c:when>
                            <c:otherwise>
                                <img class="lazy"
                                     src="${defaultpic}"
                                     data-original="${defaultpic}"
                                     alt="${item.Title}"/>
                            </c:otherwise>
                        </c:choose>

                        <span >${fn:substring(item.Title,0,16)}</span>
                    </a>
                </div>
            </c:forEach>
            <c:if test="${news == null || news.size()==0}">

                <div class="node-dl-wrapper" style="margin-right: 200px;height: 400px;width: 1000px;background-color: #fff;">
                    <dl class="none_dl clearfix">
                        <dt>
                            <img  src="${staticurl}/images/noplay.jpg" alt="">
                        </dt>

                        <dd style="text-align: center;">

                            <h3 class="f000 f16">
                                对不起，暂无“<span class="cRed" style="color: red;">${key}</span>”相关的资讯内容</h3>
                        </dd>
                    </dl>
                </div>
                <div class="infor-space"></div>
                <!-- E;centmain-inner -->
            </c:if>

            <c:if test="${p.pageCount>1}">
                <div class="infor-pager" style="clear:both;">
                    <div class="infor-pager-inner">
                        <c:if test="${p.hasPrePage}">
                            <c:choose>
                                <c:when test="${key != null}">
                                    <a href="/${cityen}/list/p${p.currpageNum-1}/?key=${key}"><span class="pager-fsm">&lt;</span></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/${cityen}/list/c${type}/p${p.currpageNum-1}/"><span class="pager-fsm">&lt;</span></a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                        <c:if test="${p.currpageNum>2}">
                            <c:choose>
                                <c:when test="${key != null}">
                                    <a href="/${cityen}/list/p${p.currpageNum-2}/?key=${key}">${p.currpageNum-2}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/${cityen}/list/c${type}/p${p.currpageNum-2}/">${p.currpageNum-2}</a>
                                </c:otherwise>
                            </c:choose>

                        </c:if>
                        <c:if test="${p.currpageNum>1}">
                            <c:choose>
                                <c:when test="${key != null}">
                                    <a href="/${cityen}/list/p${p.currpageNum-1}/?key=${key}">${p.currpageNum-1}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/${cityen}/list/c${type}/p${p.currpageNum-1}/">${p.currpageNum-1}</a>
                                </c:otherwise>
                            </c:choose>

                        </c:if>
                        <span class="curr">${p.currpageNum}</span>
                        <c:if test="${p.pageCount-p.currpageNum>=1}">
                            <c:choose>
                                <c:when test="${key != null}">
                                    <a href="/${cityen}/list/p${p.currpageNum+1}/?key=${key}">${p.currpageNum+1}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/${cityen}/list/c${type}/p${p.currpageNum+1}/">${p.currpageNum+1}</a>
                                </c:otherwise>
                            </c:choose>

                        </c:if>
                        <c:if test="${p.pageCount-p.currpageNum>=2}">
                            <c:choose>
                                <c:when test="${key != null}">
                                    <a href="/${cityen}/list/p${p.currpageNum+2}/?key=${key}">${p.currpageNum+2}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/${cityen}/list/c${type}/p${p.currpageNum+2}/">${p.currpageNum+2}</a>
                                </c:otherwise>
                            </c:choose>

                        </c:if>
                        <c:if test="${p.hasNextPage}">
                            <c:choose>
                                <c:when test="${key != null}">
                                    <a href="/${cityen}/list/p${p.currpageNum+1}/?key=${key}"><span class="pager-fsm">&gt;</span></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/${cityen}/list/c${type}/p${p.currpageNum+1}/"><span class="pager-fsm">&gt;</span></a>
                                </c:otherwise>
                            </c:choose>

                        </c:if>
                    </div>
                </div>
            </c:if>
        </div>


        <div class="clear mb_28"></div>
    </div>
    <!-- E;centmain-inner -->
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/foot.jsp" %>
<script type="text/javascript">
    $(function(){
        $('.infor-lists .infor-item').hover(function(){
            $(this).addClass('curr');
        },function(){
            $(this).removeClass('curr');
        });
        //图片延迟加载
        $("img.lazy").lazyload({effect: "fadeIn"});
    })
</script>
<script src="${staticurl}/js/cent_lists.js"></script>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</body>
</html>
