<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta http-equiv="x-ua-compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
    <meta name="keywords" content="${citycn}最新房产新闻,${citycn}房产资讯,${citycn}楼市政策,${citycn}房产资讯,${citycn}房地产新闻">
    <meta name="description"
          content="${citycn}房产新闻,${citycn}中原地产提供最及时${citycn}房产新闻、${citycn}房地产资讯，为您解读${citycn}房产最新政策，预测${citycn}房价走势，分析${citycn}楼市成交数据。中原地产最资深最可靠的房地产网站。"/>
    <title>${colName}_${citycn}资讯列表－${citycn}中原地产</title>
    <link rel="stylesheet" href="${staticurl}/css/cent_basev3.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/icons.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/headp2.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/cent_information.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/sidebar/sidebar.css">
    <script src="${staticurl}/js/jquery-1.7.min.js"></script>
    <script src="${staticurl}/js/jquery.slides.min.js"></script>
    <script src="${staticurl}/sidebar/common.js"></script>
    <script src="${staticurl}/sidebar/quick_links.js?v=${ver}"></script>
    <script src="${staticurl}/js/placeholder.js?v=${ver}"></script>
    <script src="${staticurl}/js/head.js?v=${ver}"></script>
    <script src="${staticurl}/js/jquery.lazyload.min.js"></script>
    <script>
        function getIframe(id) {
            return document.getElementById(id).contentWindow.document;
        }

        function frameDiv() {
            getIframe("iframeA").getElementById("loginInfo").style.display = "block";
        }

    </script>
</head>
<body>
<%--head--%>
<%@include file="/WEB-INF/views/head.jsp" %>
<!-- S;centmain-wraper -->
<%--<div class="centmain-wraper centmain-wraper-infor">
    <div class="centmain-inner">
        <div class="breadcrumbs clearfix">
            <div class="fl breadcrumbs-area f000 ">
                <a href="/${cityen}" class="f000">资讯</a>
                <span class="fsm">&gt;</span>
               &lt;%&ndash; <span>政策法规</span>&ndash;%&gt;
            </div>
        </div>
        <div class="infor-side fr">
            <div class="infor-lists">
                <c:forEach items="${news}" var="item">
                   &lt;%&ndash; <dl class="infor-news-item clearfix">
                        <dt class="fl">
                            <a href="/${cityen}/detail/${item.ID}.html" target="_blank"><img src="${item.LitPic}" alt=""></a>
                        </dt>
                        <dd class="fl">
                            <h6 class="f18"><a href="/${cityen}/detail/${item.ID}.html" class="f000" target="_blank">${item.Title}</a></h6>
                            <p class="f14 f999">${item.Description}<a href="" class="cBlue ml_15"></a></p>
                            <div class="tag clearfix">
                                <p class="news_time">
                                    <jsp:useBean id="myDate" class="java.util.Date"/>
                                    <c:set target="${myDate}" property="time" value="${item.PublishDate}"/>
                                    <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${myDate}" type="both"/>
                                </p>
                                <ul>
                                    <c:forEach items="${item.LabelList}" var="l">
                                        <li><span class="tag_item">${l.title}</span></li>
                                    </c:forEach>
                                 &lt;%&ndash;
                                    <li><span class="tag_item">标签二</span></li>
                                    <li><span class="tag_item">标签三</span></li>&ndash;%&gt;
                                </ul>
                            </div>
                        </dd>
                    </dl>&ndash;%&gt;
                    <dl class="infor-news-item clearfix">
                        <dt class="fl">
                            <a href=""><img src="${staticurl}/images/infor-news.jpg" alt=""></a>
                        </dt>
                        <dd class="fl">
                            <h6 class="f18"><a href="" class="f000">一二线城市楼市库存渐稳 业内称市场迎转折点</a></h6>
                            <p class="f14 f999"> 近日，中原地产研究中心发布最新统计数据显示，此前住宅价格一路上扬的北京、广州、合肥、南京、苏州等城市6月库存下调速度明显放缓。截至21日，13大一二线城市合计库存60.36万套<a href="" class="cBlue ml_15"></a></p>
                            <div class="tag clearfix">
                                <p class="news_time">2020-05-19 11:27</p>
                                <ul>
                                    <li><span class="tag_item">标签一</span></li>
                                    <li><span class="tag_item">标签二</span></li>
                                    <li><span class="tag_item">标签三</span></li>
                                </ul>
                            </div>
                        </dd>
                    </dl>
                </c:forEach>

                <c:if test="${p.pageCount>=1}">
                    <div class="infor-pager">
                    <div class="infor-pager-inner">
                        <c:if test="${p.hasPrePage}">
                            <a href="/${cityen}/list/c${type}/p${p.currpageNum-1}"><span class="fsm">&lt;</span>上一页</a>
                        </c:if>
                        <c:if test="${p.currpageNum>2}">
                            <a href="/${cityen}/list/c${type}/p${p.currpageNum-2}">${p.currpageNum-2}</a>
                        </c:if>
                        <c:if test="${p.currpageNum>1}">
                            <a href="/${cityen}/list/c${type}/p${p.currpageNum-1}">${p.currpageNum-1}</a>
                        </c:if>
                        <span class="curr">${p.currpageNum}</span>
                        <c:if test="${p.pageCount-p.currpageNum>=1}">
                            <a href="/${cityen}/list/c${type}/p${p.currpageNum+1}">${p.currpageNum+1}</a>
                        </c:if>
                        <c:if test="${p.pageCount-p.currpageNum>=2}">
                            <a href="/${cityen}/list/c${type}/p${p.currpageNum+2}">${p.currpageNum+2}</a>
                        </c:if>
                        <c:if test="${p.hasNextPage}">
                            <a href="/${cityen}/list/c${type}/p${p.currpageNum+1}">下一页<span class="fsm">&gt;</span></a>
                        </c:if>
                    </div>
                </div>
                </c:if>
            </div>



        </div>




        <div class="infor-space"></div>
    </div>
    <!-- E;centmain-inner -->
</div>--%>
<div class="centmain-wraper centmain-wraper-infor">
    <div class="centmain-inner">
        <div class="breadcrumbs clearfix">
          <%--  <div class="fl breadcrumbs-area f123 ">
                <a href="/${cityen}/" class="f123 f000">${citycn}中原地产</a>
                <span class="fsm">&gt;</span>
                <a href="" class="f123">${citycn}资讯</a><span class="fsm">&gt;</span>
                <span>${colName}</span>
            </div>--%>
            <div class="fl breadcrumbs-area f123 ">
                <a href="//${cityen}.centanet.com" class="f123">${citycn}中原地产</a>
                <span class="fsm">&gt;</span>
                <a href="/${cityen}/" class="f123">${citycn}资讯</a>
                <span class="fsm">&gt;</span>
                <a href="/${cityen}/list/c${type}/p${page}/" class="f123">${colName}</a>
            </div>
        </div>
        <div class="infor-main fl">
            <div class="infor-lists">
                <div class="infor-news">
                <c:forEach items="${news}" var="item">
                    <dl class="infor-news-item clearfix">
                        <dt class="fl">
                            <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                            <a href="/${cityen}/detail/${item.ID}.html" target="_blank" title="${item.Title}">
                                <%--<img src="${item.LitPic}" alt="" onerror="this.src='${defaultpic}'">--%>
                                <img class="lazy" src="${item.LitPic}?x-oss-process=style/180x130"
                                     data-original="${item.LitPic}?x-oss-process=style/180x130" alt="${item.Title}" onerror="this.src='${defaultpic}'"/>
                            </a>
                        </dt>
                        <dd class="fl">
                            <h6 class="f18"><a href="/${cityen}/detail/${item.ID}.html" class="f000" target="_blank">${item.Title}</a></h6>
                            <p class="f14 f999">${item.Description}<span>...</span><a href="" class="cBlue ml_15"></a></p>
                            <div class="tag clearfix">
                                <p class="news_time">
                                    <jsp:useBean id="myDate" class="java.util.Date"/>
                                    <c:set target="${myDate}" property="time" value="${item.PublishDate*1000}"/>
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                                </p>
                                <ul>
                                    <c:forEach items="${item.LabelList}" var="l">
                                        <li><span class="tag_item">${l.title}</span></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </dd>
                    </dl>
                </c:forEach>

                <c:if test="${news == null || news.size()==0}">

                    <div class="node-dl-wrapper" style="margin-right: 200px;">
                        <dl class="none_dl clearfix" style="width: 300px;">
                            <dt>
                                <img  src="${staticurl}/images/noplay.jpg" alt="">
                            </dt>
                            <dd style="width: 300px;">

                                <h3 class="f000 f16">
                                    对不起，暂无“<span class="cRed">${key}</span>”相关的资讯内容</h3>
                            </dd>
                        </dl>
                    </div>

                        <div class="infor-space"></div>
                        <!-- E;centmain-inner -->
                </c:if>

                </div>
            </div>
            <c:if test="${p.pageCount>1}">
                <div class="infor-pager">
                    <div class="infor-pager-inner">
                        <c:if test="${p.hasPrePage}">
                            <c:choose>
                                <c:when test="${key != null}">
                                    <a href="/${cityen}/list/p${p.currpageNum-1}/?key=${key}"><span class="fsm">&lt;</span>上一页</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/${cityen}/list/c${type}/p${p.currpageNum-1}/"><span class="fsm">&lt;</span>上一页</a>
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
                                    <a href="/${cityen}/list/p${p.currpageNum+1}/?key=${key}">下一页<span class="fsm">&gt;</span></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/${cityen}/list/c${type}/p${p.currpageNum+1}/">下一页<span class="fsm">&gt;</span></a>
                                </c:otherwise>
                            </c:choose>

                        </c:if>
                    </div>
                </div>
            </c:if>
        </div>
        <%--right--%>
        <c:if test="${p.pageCount>1}">
            <div class="infor-side fr">
                <div class="rankingList">
                    <h2 class="title">热点排行榜</h2>
                    <div class="ranking-list">
                        <c:set var="arr" value="${fn:split('hightlight,hightlightB,hightlightC',',')}"></c:set>
                        <c:forEach items="${topList}" var="t" varStatus="status">
                            <p>
                                <i class="${arr[status.index]}">${status.count}</i>
                                <a href="/${cityen}/detail/${t.ID}.html" target="_blank" class="f000" title="${t.Title}">${fn:substring(t.Title,0,18)}</a>
                            </p>
                        </c:forEach>

                   <%--     <p><i class="hightlightB">2</i><a href="">施永青：目前中原没有条件打败链家</a></p>
                        <p><i class="hightlightC">3</i><a href="">中原：今年已出“地王”152宗 或影... ...</a></p>
                        <p><i>4</i><a href="">链家要在深圳同中原全面开战 7亿的... ...</a></p>
                        <p><i>5</i><a href="">佳兆业逆袭：旧改正走向全国 ，前5... ...</a></p>
                        <p><i>6</i><a href="">链家要在深圳同中原全面开战 7亿的... ...</a></p>
                        <p><i>7</i><a href="">佳兆业逆袭：旧改正走向全国 ，前5... ...</a></p>
                        <p><i>8</i><a href="">链家要在深圳同中原全面开战 7亿的... ...</a></p>
                        <p><i>9</i><a href="">佳兆业逆袭：旧改正走向全国 ，前5... ...</a></p>
                        <p><i>10</i><a href="">佳兆业逆袭：旧改正走向全国 ，前5... ...</a></p>--%>
                    </div>
                </div>
            </div>
        </c:if>
        <div class="clear mb_28"></div>
    </div>
    <!-- E;centmain-inner -->
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/foot.jsp" %>

<script type="text/javascript">
    $(function () {
        $('.infor-lists .infor-item').hover(function () {
            $(this).addClass('curr');
        }, function () {
            $(this).removeClass('curr');
        });
        //图片延迟加载
        $("img.lazy").lazyload({effect: "fadeIn"});
    })
  /*  //点击搜索
    $(".icons-searchred-btn").click(function () {
        console.log('search btn');
        let keyword = $('.search-ipt').val();
        let type = $("#J_searchtype").val() || 0;
        location.href = getlink(type);
    })
    //search button text
    let arr = [
        "请输入资讯标题或内容",
        "请输入楼盘名/地址",
        "请请输入小区名称/学校/区域",
       /!* "请输入楼盘名/地址",
        "请输入楼盘名/地址",*!/
        "请输入经纪人姓名",
        "请输入门店名",
        "请输入资讯标题或内容",
        "请请输入小区名称/学校/区域",
        "请输入小区名称",
        "请输入学校名称",
        "请输入商铺名称",
        "请输入写字楼名称"
    ];
    //切换文本框填充
    function searchType(type) {
        //如果是新房为1，小区为2，经纪人为3，门店为4，查成交为5，二手房为6，租房为7，学校为8，商铺为9，写字楼为10，默认为0
        $("#J_searchtype").val(type);
        $(".search-ipt").prop('placeholder', arr[type]);
    }*/
  /*  //获取请求链接
    function getlink(type) {
        let searchkey = $('.search-ipt').val();
        let cityen = '{cityen}';
        let obj = {
            0: "/"+ cityen +"/list/?key=" + searchkey,
            1: "//" + cityen + ".centanet.com/xinfang/?key=" + searchkey,
            2: "//" + cityen + ".centanet.com/xiaoqu/?key=" + searchkey,
            3: "//" + cityen + ".centanet.com/jingjiren/?key=" + searchkey,
            4: "//" + cityen + ".centanet.com/mendian/?key=" + searchkey,
            5: "//" + cityen + ".centanet.com/chengjiao/contrast/?key=" + searchkey,
            6: "//" + cityen + ".centanet.com/ershoufang/?key=" + searchkey,
            7: "//" + cityen + ".centanet.com/zufang/?key=" + searchkey,
            8: "//" + cityen + ".centanet.com/ershoufang-xuexiao/?key=" + searchkey,
            9: "//" + cityen + ".centanet.com/gongshangpu/chushou/?key=" + searchkey,
            10: "//" + cityen + ".centanet.com/xiezilou/loupan/?key=" + searchkey
        };
        return obj[type];
    }*/
</script>
<script src="${staticurl}/js/cent_lists.js?v=${ver}"></script>
</body>
</html>
