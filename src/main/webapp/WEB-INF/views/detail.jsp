<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <!-- <meta name="renderer" content="webkit">
      目前IE最新的正常模式去浏览
   <meta http-equiv="x-ua-compatible" content="IE=edge">-->
    <meta http-equiv="Cache-Control" content="max-age=100"/>
    <meta name="referrer" content="no-referrer" />
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
    <meta name="keywords" content="${citycn}最新房产新闻,${citycn}房产资讯,${citycn}楼市政策,${citycn}房产资讯,${citycn}房地产新闻">
    <meta name="description"
          content="${citycn}房产新闻,${citycn}中原地产提供最及时${citycn}房产新闻、${citycn}房地产资讯，为您解读${citycn}房产最新政策，预测${citycn}房价走势，分析${citycn}楼市成交数据。中原地产最资深最可靠的房地产网站。"/>
    <title> ${detail.Typename}－${citycn}中原地产</title>
    <link rel="stylesheet" href="${staticurl}/css/cent_basev3.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/icons.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/headp2.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/cent_information.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/sidebar/sidebar.css">
    <script src="${staticurl}/js/jquery-1.7.min.js"></script>
    <script src="${staticurl}/sidebar/common.js"></script>
    <script src="${staticurl}/sidebar/quick_links.js"></script>
    <script src="${staticurl}/js/placeholder.js"></script>
    <script src="${staticurl}/js/head.js"></script>
    <script src="${staticurl}/js/jquery.lazyload.min.js"></script>
    <script>
        function getIframe(id) {
            return document.getElementById(id).contentWindow.document;
        }

        function frameDiv() {
            getIframe("iframeA").getElementById("loginInfo").style.display = "block";
        }
    </script>
    <style>
        #more:hover{
            color: #999;
        }
    </style>
</head>
<body>
<%--head--%>
<%@include file="/WEB-INF/views/head.jsp" %>
<!-- S;centmain-wraper -->
<c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
<div class="centmain-wraper centmain-wraper-infor">
    <div class="centmain-inner">
        <div class="breadcrumbs clearfix">
           <%-- <div class="fl breadcrumbs-area f123 ">
                <a href="/${cityen}/" class="f123 f000">${citycn}中原地产</a>
                <span class="fsm">&gt;</span>
                <a href="" class="f123f123">${citycn}资讯</a><span class="fsm">&gt;</span>
                <a href="" class="f123">${detail.Typename}</a><span class="fsm">&gt;</span>
                <span>正文</span>
            </div>--%>
           <div class="fl breadcrumbs-area f123 ">
               <a href="//${cityen}.centanet.com" class="f123">${citycn}中原地产</a>
               <span class="fsm">&gt;</span>
               <a href="/${cityen}/" class="f123">${citycn}资讯</a>
               <span class="fsm">&gt;</span>
               <a href="/${cityen}/list/c${detail.Typeid}/" class="f123">${detail.Typename}</a><span class="fsm">&gt;</span>
               <span>正文</span>
           </div>
        </div>
        <div class="infor-main fl">
            <div class="infor-detail-cont">
                <div class="infor-detail-top">
                    <h1 class="title ">${detail.Title}</h1>
                   <%-- <p class="f666 ">来源:${detail.Sources}</p>--%>
                    <p class="f666 ">
                        <jsp:useBean id="myDate" class="java.util.Date"/>
                        <c:set target="${myDate}" property="time" value="${detail.PublishDate*1000}"/>
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        来源:&nbsp;&nbsp;${detail.Sources}</p>
                <%--    <p class="share clearfix">
                        <a href=""></a>
                        <a href=""></a>
                        <a href=""></a>
                        <a href=""></a>
                    </p>--%>
                   <%-- <p class="mt_15">
                        <img src="${staticurl}/images/boss.jpg" alt=""/>
                    </p>--%>
                </div>
                <div class="infor-detail-mid">

                    ${detailContent}
                </div>
                <div class="section-wrap section-houselists">
                    <div class="section">
                        <div class="newRoomlists">
                           <%-- <div class="newRoom-item">--%>
                            <c:forEach items="${commonHouseResult}" varStatus="status" var="n">

                                <c:if test="${status.index == 0 || (status.index + 1) % 2 == 1}">
                                    <div class="newRoom-item">
                                </c:if>
                                    <div class="${status.count % 2 == 1 ? "item-left" : "item-right"}">
                                        <div class="room-img">
                                            <c:if test="${n.xinfangResult != null}">
                                                <a href="//${cityen}.centanet.com/xinfang/lp-${n.xinfangResult.oid}/" target="_blank">
                                                    <img src="${n.xinfangResult.defaultImage}" width="250" height="167" alt="" onerror="this.src='${defaultpic}'" />
                                                </a>
                                            </c:if>
                                            <c:if test="${n.esfResult != null}">
                                                <a href="//${cityen}.centanet.com/ershoufang/${n.esfResult.oid}.html/" target="_blank">
                                                    <img src="${n.esfResult.fullImagePath}" width="250" height="167" alt="" onerror="this.src='${defaultpic}'"/>
                                                </a>
                                            </c:if>
                                            <c:if test="${n.xiaoQuResult != null}">
                                                <a href="//${cityen}.centanet.com/xiaoqu/xq-${n.xiaoQuResult.oid}/" target="_blank">
                                                    <img src="${n.xiaoQuResult.imagePath}" width="250" height="167" alt="" onerror="this.src='${defaultpic}'"/>
                                                </a>
                                            </c:if>

                                        </div>
                                        <div class="room-mid">
                                            <h5>
                                                <c:set var="apartmentStr" value="公寓"></c:set>
                                                <c:set var="residenceStr" value="住宅"></c:set>
                                                <c:set var="vilaResidenceStr" value="普通住宅"></c:set>
                                                <c:set var="villaStr" value="别墅"></c:set>
                                                <c:if test="${n.xinfangResult != null}">

                                                    <a href="//${cityen}.centanet.com/xinfang/lp-${n.xinfangResult.oid}/"  target="_blank" title="${n.xinfangResult.adName}">${n.xinfangResult.adName}</a>
                                                    <label for="" class="red_tag">
                                                        <c:if test="${fn:contains(apartmentStr, n.xinfangResult.estType)}">
                                                            ${apartmentStr}
                                                        </c:if>
                                                        <c:if test="${fn:contains(residenceStr, n.xinfangResult.estType)}">
                                                            ${residenceStr}
                                                        </c:if>
                                                        <c:if test="${fn:contains(villaStr, n.xinfangResult.estType)}">
                                                            ${villaStr}
                                                        </c:if>
                                                    </label>
                                                </c:if>
                                                <c:if test="${n.esfResult != null}">
                                                    <a href="//${cityen}.centanet.com/ershoufang/${n.esfResult.oid}.html/"  target="_blank" title="${n.esfResult.estateName}">${n.esfResult.estateName}</a>
                                                    <label for="" class="red_tag">
                                                        <c:if test="${fn:contains(apartmentStr, n.esfResult.propertyType)}">
                                                            ${apartmentStr}
                                                        </c:if>
                                                        <c:if test="${fn:contains(residenceStr, n.esfResult.propertyType)}">
                                                            ${residenceStr}
                                                        </c:if>
                                                        <c:if test="${fn:contains(villaStr, n.esfResult.propertyType)}">
                                                            ${villaStr}
                                                        </c:if>
                                                        <c:if test="${fn:contains(vilaResidenceStr, n.esfResult.propertyType)}">
                                                            ${residenceStr}
                                                        </c:if>
                                                    </label>
                                                </c:if>
                                                <c:if test="${n.xiaoQuResult != null}">
                                                    <a href="//${cityen}.centanet.com/xiaoqu/xq-${n.xiaoQuResult.oid}/"  target="_blank" title="${n.xiaoQuResult.estateName}">${n.xiaoQuResult.estateName}</a>
                                                    <label for="" class="red_tag">
                                                        <c:if test="${fn:contains(apartmentStr, n.xiaoQuResult.propertyType)}">
                                                            ${apartmentStr}
                                                        </c:if>
                                                        <c:if test="${fn:contains(residenceStr, n.xiaoQuResult.propertyType)}">
                                                            ${residenceStr}
                                                        </c:if>
                                                        <c:if test="${fn:contains(vilaResidenceStr, n.xiaoQuResult.propertyType)}">
                                                            ${residenceStr}
                                                        </c:if>
                                                        <c:if test="${fn:contains(villaStr, n.xiaoQuResult.propertyType)}">
                                                            ${villaStr}
                                                        </c:if>
                                                    </label>
                                                </c:if>
                                                <i for="" class="gift_tag"></i>
                                            </h5>
                                            <p>
                                                <c:if test="${n.xinfangResult != null}">
                                                    【${n.xinfangResult.baseNewProp.district.GScopeCnName}-${n.xinfangResult.baseNewProp.GScope.GScopeCnName}】
                                                </c:if>
                                                <c:if test="${n.esfResult != null}">
                                                    【${n.esfResult.estateName}】
                                                </c:if>
                                                <c:if test="${n.xiaoQuResult != null}">
                                                    【${n.xiaoQuResult.estateName}】
                                                </c:if>

                                            </p>
                                            <p>
                                                <c:if test="${n.xinfangResult != null}">
                                                    <span class="tipTriggerB" tip="${n.xinfangResult.baseNewProp.address}">${n.xinfangResult.baseNewProp.address}</span>
                                                </c:if>
                                                <c:if test="${n.esfResult != null}">
                                                    <span class="tipTriggerB" tip="${n.esfResult.address}">${n.esfResult.address}</span>
                                                </c:if>
                                                <c:if test="${n.xiaoQuResult != null}">
                                                    <span class="tipTriggerB" tip="${n.xiaoQuResult.address}">${n.xiaoQuResult.address}</span>
                                                </c:if>

                                            </p>

                                                <c:if test="${n.xinfangResult != null}">
                                                    <c:if test="${n.xinfangResult.averagePrice != null &&n.xinfangResult.averagePrice > 0}">
                                                        <p class="average-price">
                                                        <strong class="nub">${n.xinfangResult.averagePrice}</strong><cite class="unit">元/平 </cite>
                                                        </p>
                                                    </c:if>

                                                </c:if>
                                                <c:if test="${n.esfResult != null}">
                                                    <c:if test="${n.esfResult.salePriceString != null }">
                                                        <p class="average-price"><strong class="nub">${n.esfResult.salePriceString}</strong><cite class="unit">万</cite></p>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${n.xiaoQuResult != null}">
                                                        <c:if test="${n.xiaoQuResult.saleAvgPriceString != null }">
                                                                <p class="average-price"><strong class="nub">${n.xiaoQuResult.saleAvgPriceString}</strong><cite class="unit">元/平</cite></p>
                                                        </c:if>
                                                </c:if>

                                        </div>
                                    </div>

                                    <c:if test="${status.count % 2 == 0}">
                                        </div>
                                    </c:if>
                                    <c:if test="${(commonHouseResultSize == 1 && status.count == 1) || (commonHouseResultSize == 11 && status.count == 11)}">
                                        </div>
                                    </c:if>
                                    <c:if test="${(commonHouseResultSize == 3 && status.count == 3) || (commonHouseResultSize == 13 && status.count == 13)}">
                                        </div>
                                    </c:if>
                                    <c:if test="${(commonHouseResultSize == 5 && status.count == 5) || (commonHouseResultSize == 15 && status.count == 15)}">
                                        </div>
                                    </c:if>
                                     <c:if test="${(commonHouseResultSize == 7 && status.count == 7) || (commonHouseResultSize == 17 && status.count == 17)}">
                                        </div>
                                    </c:if>
                                     <c:if test="${(commonHouseResultSize == 9 && status.count == 9) || (commonHouseResultSize == 19 && status.count == 19)}">
                                        </div>
                                    </c:if>
                            </c:forEach>
                           <%-- </div>--%>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="infor-side fr">
            <div class="rankingList">
                <h2 class="title">热点排行榜</h2>
                <div class="ranking-list">
                    <c:set var="classArray" value="${fn:split('hightlight,hightlightB,hightlightC', ',')}" />
                    <c:forEach items="${news}" var="n" varStatus="status">
                        <p><i class="${classArray[status.index]}">${status.count}</i>
                            <a title="${n.Title}" class="f000" href="/${cityen}/detail/${n.ID}.html" target="_blank">${fn:substring(n.Title, 0, 18)}</a></p>
                    </c:forEach>
                </div>
            </div>
            <c:if test="${infoNews!=null&& infoNews.size()>0}">
                <div class="hotSpecial clearfix">
                    <h2 class="title">热门专题</h2>
                    <div class="hotspecial-list">
                        <dl class="infor-side-pB">
                            <c:forEach items="${infoNews}" var="info" varStatus="status">
                                <dt class="${status.index==0?'curr':''}"><a class="f000" href="javacript:void(0);" title="${info.Title}">${fn:substring(info.Title, 0, 18)}</a></dt>
                                <dd><a href="/${cityen}/detail/${info.ID}.html" target="_blank" class="f000" title="${info.Title}">

                                    <img class="lazy" src="${info.LitPic}?x-oss-process=style/300x210"
                                         data-original="${info.LitPic}?x-oss-process=style/300x210" alt="${item.Title}" onerror="this.src='${defaultpic}'"/>
                                </a>
                                </dd>
                            </c:forEach>
                        </dl>
                        <a href="/${cityen}/list/c${hotType}/" id="more" class="morelink">更多</a>
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
    /**
    * 以下代码是判断是人还是蜘蛛
    */
    //获取当前进入页面的地址
    let r = document.referrer;
    r = r.toLowerCase(); //转为小写
    let aSites = new Array('google.','baidu.','soso.','so.','360.','yahoo.','youdao.','sogou.','gougou.');
    let flag = false;
    for (i in aSites){
        if (r.indexOf(aSites[i]) > 0){
            flag = true;
            break;
        }
    }

    //如果flag为false，证明是人，需要给页面加入访问量
    if(!flag){
    $.get(
        "https://news.centanet.com/api/NewsAddToVisit?newsid=${newsId}&cityen=${cityen}&url="+r+"&platform=pc",
            function (data) {
        });
    }

</script>

<script type="text/javascript">

    $(function () {
        var allPanelsSta = $('.infor-side-pB > dd').hide();
        var fistPanels = $('.infor-side-pB dd:first').show();
        $('.infor-side-pB > dt > a').click(function () {
            var allPanels = $('.infor-side-pB > dd');
            //allPanels.slideUp();
            var that = $(this).parent().next();
            var otherPanels = allPanels.not(that);
            otherPanels.slideUp();
            $('.infor-side-pB > dt').removeClass('curr');
            $(this).parent().next().slideDown();
            $(this).parent().addClass('curr');
            return false;
        });
        //图片延迟加载
        $("img.lazy").lazyload({effect: "fadeIn"});
    });

</script>
<script src="${staticurl}/js/cent_lists.js"></script>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</body>
</html>