<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <meta name="keywords" content="">
    <meta name="description" content=""/>
    <link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
    <title>${typeName}-中原地产资讯列表</title>
    <link rel="stylesheet" href="${staticurl}/css/cent_basev3.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/icons.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/cent_information.css">

    <link rel="stylesheet" href="${staticurl}/css/headp2.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/encyclop2.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/sidebar/sidebar.css">
    <script src="${staticurl}/js/jquery-1.7.min.js"></script>
    <script src="${staticurl}/sidebar/common.js"></script>
    <script src="${staticurl}/sidebar/quick_links.js"></script>
    <script src="${staticurl}/js/placeholder.js"></script>
    <script src="${staticurl}/js/head.js?v=${ver}"></script>
    <script src="${staticurl}/js/totalexchange.js"></script>


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
<div class="centmain-wraper centmain-wraper-infor">
    <div class="centmain-inner">
        <div class="encyclo-banner"><img src="${staticurl}/images/encyclo_banner.jpg" alt=""/></div>
        <div class="breadcrumbs clearfix f123" style="margin-bottom:10px">
            <div class="fl breadcrumbs-area f123 " id="navigation">
                <a href="/${cityen}/" class="f123">${citycn}资讯</a><span class="fsm"> &gt; </span><a href="/${cityen}/baike/" class="f123">购房百科</a><span class="fsm"> &gt; </span>
                <c:if test="${typeid == 0}">
                    <a href="/${cityen}/baike/p${page}/"  class="f123">${typeName}</a>
                </c:if>
                <c:if test="${typeid != 0}">
                    <a href="/${cityen}/baike/c${typeid}/p${page}/" class="f123">${typeName}</a>
                </c:if>

            </div>
        </div>

        <c:choose>
            <c:when test="${p.pageCount>=1}">

                <div class="encyclo-main fr" style="display: ${news.size()>0?'block':'none'}">
                    <h5 class="title">${news.get(0).TypeName == null?types[0].columnsName:news.get(0).TypeName}</h5>
                    <ul class="encyclo-list">
                        <%--百科新闻列表--%>
                        <c:forEach items="${news}" var="n">
                            <li>
                                <p class="tit">
                                    <a href="/${cityen}/detail/${n.ID}.html" title="${n.Title}" target="_blank">${n.Title}</a>
                                </p>
                                <p class="hd">
                                    <a href="/${cityen}/detail/${n.ID}.html" title="${n.Title}" target="_blank">${n.Description} <span>...</span></a>
                                </p>
                                <p class="fd">
                                    <i></i>
                                    <span class="mr15">
                                        <jsp:useBean id="myDate" class="java.util.Date"/>
                                        <c:set target="${myDate}" property="time" value="${n.PublishDate*1000}"/>
                                        <fmt:formatDate pattern="yyyy年MM月dd日" value="${myDate}" type="both"/>
                                    </span>阅读：${n.Click}次</p>
                            </li>
                        </c:forEach>
                    </ul>
                        <c:if test="${p.pageCount>1}">
                            <div class="section-wrap section-pager">
                                <div class="pager-box">
                                    <div class="pager-inner">
                                        <c:if test="${p.currpageNum<=1}">
                                            <a href="javacript:void(0);" class="fsm fb">&lt;&nbsp;首页</a>
                                        </c:if>
                                        <c:if test="${p.currpageNum>1}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                    <a href="/${cityen}/baike/p${p.currpageNum-1}" class="fsm fb">&lt;&nbsp;上一页</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum-1}" class="fsm fb">&lt;&nbsp;上一页</a>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:if>
                                        <c:if test="${p.currpageNum>3}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                    <a href="/${cityen}/baike/p${p.currpageNum-2}">${p.currpageNum-2}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum-2}">${p.currpageNum-2}</a>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:if>
                                        <c:if test="${p.currpageNum>2}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                    <a href="/${cityen}/baike/p${p.currpageNum-1}">${p.currpageNum-1}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum-1}">${p.currpageNum-1}</a>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:if>
                                        <span class="curr">${p.currpageNum}</span>
                                        <c:if test="${p.pageCount-p.currpageNum>=1}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                    <a href="/${cityen}/baike/p${p.currpageNum+1}">${p.currpageNum+1}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum+1}">${p.currpageNum+1}</a>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:if>
                                        <c:if test="${p.pageCount-p.currpageNum>=2}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                    <a href="/${cityen}/baike/p${p.currpageNum+2}">${p.currpageNum+2}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum+2}">${p.currpageNum+2}</a>
                                                </c:otherwise>
                                            </c:choose>

                                           <%-- <a class="normal" href="">...</a>--%>
                                        </c:if>
                                        <c:if test="${p.hasNextPage}">
                                            <c:choose>
                                                <c:when test="${typeid == 0}">
                                                    <a href="/${cityen}/baike/p${p.currpageNum+1}" class="fsm fb">下一页&nbsp;&gt;</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="/${cityen}/baike/c${typeid}/p${p.currpageNum+1}" class="fsm fb">&nbsp;下一页&gt;</a>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                </div>
            </c:when>
            <c:otherwise>
                <div class="centmain-wraper centmain-wraper-infor"  style="width: 70%;float: right; margin-right: 60px;">
                    <div class="centmain-inner">
                        <div class="infor-wrapper">
                            <div class="node-dl-wrapper">
                                <dl class="none_dl clearfix">
                                    <dt>
                                        <img  src="${staticurl}/images/noplay.jpg" alt="">
                                    </dt>
                                    <dd>

                                        <h3 class="f000 f16">
                                            对不起，暂无“<span class="cRed">${typeName}</span>”相关的资讯内容</h3>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="infor-space"></div>
                    <!-- E;centmain-inner -->
                </div>

            </c:otherwise>
        </c:choose>
        <%--left 左侧栏--%>
        <%-- <c:if test="${types!= null && fn:length(types) > 0}">--%>
        <div class="encyclo-side fl">
            <c:set var="dbcitys" value="sy,cc,hrb,cs"></c:set>
            <dl class="encyclo-classify ${fn:contains(dbcitys, cityen)?'encyclo-classify_cs':''}">
                <%--判断栏目长度是否>=1--%>
                <c:if test="${typesSize > 1}">
                    <%--   <c:if test="${!fn:contains(dbcitys, cityen)}">--%>
                    <c:forEach items="${types}" var="item">
                        <%--一级 top--%>
                        <c:if test="${item.id == typeid}">
                            <dt class="curr"><span style="color: red;">${item.columnsName}</span></dt>
                        </c:if>
                        <c:if test="${item.id != typeid}">
                            <dt><span>${item.columnsName}</span></dt>
                        </c:if>
                        <%--二级 child--%>
                        <dd>
                            <c:forEach items="${item.childList}" var="ch">
                                <c:if test="${ch.id == typeid}">
                                    <a href="/${cityen}/baike/c${ch.id}/p1" class="curr" style="color: red;" title="${ch.columnsName}">${ch.columnsName}</a>
                                </c:if>
                                <c:if test="${ch.id != typeid}">
                                    <a href="/${cityen}/baike/c${ch.id}/p1" title="${ch.columnsName}">${ch.columnsName}</a>
                                </c:if>
                            </c:forEach>
                        </dd>
                    </c:forEach>
                    <%--</c:if>--%>
                </c:if>

                    <%--判断栏目长度是否==1--%>
                    <c:if test="${typesSize == 1}">
                        <%--   <c:if test="${!fn:contains(dbcitys, cityen)}">--%>
                        <c:forEach items="${types}" var="item">
                            <%--一级 top--%>
                            <c:if test="${item.id == typeid}">
                                <dt class="curr"><span style="color: red;">${item.columnsName}</span></dt>
                            </c:if>
                            <c:if test="${item.id != typeid}">
                                <dt><span>${item.columnsName}</span></dt>
                            </c:if>
                            <%--二级 child--%>

                                <c:forEach items="${item.childList}" var="ch">
                                    <dd>
                                    <c:if test="${ch.id == typeid}">
                                        <a href="/${cityen}/baike/c${ch.id}/p1" class="curr" style="color: red;" title="${ch.columnsName}">${ch.columnsName}</a>
                                    </c:if>
                                    <c:if test="${ch.id != typeid}">
                                        <a href="/${cityen}/baike/c${ch.id}/p1" title="${ch.columnsName}">${ch.columnsName}</a>
                                    </c:if>
                                    </dd>
                                </c:forEach>

                        </c:forEach>
                        <%--</c:if>--%>
                    </c:if>

            </dl>
            <%-- <dl class="encyclo-classify">
                 <c:forEach items="${types}" var="bkitme">
                     <dt><a href="/${cityen}/baike/123/">${bkitem.ColumnsName}${bkitem.Id}</a></dt>
                     <dd>
                         <c:forEach items="${bkitem.ChildList}" var="ch">
                             <a href="/bj/baike/goufangxuzhi/fczc/">房产政策</a>
                            &lt;%&ndash; <a href="/bj/baike/goufangxuzhi/fwdk/">房屋贷款</a>
                             <a href="/bj/baike/goufangxuzhi/fwzx/">房屋装修 </a>
                             <a href="/bj/baike/goufangxuzhi/cqbg/">产权/变更</a>&ndash;%&gt;
                         </c:forEach>
                     </dd>
                 </c:forEach>
             </dl>--%>
           <%-- <c:set var="dbcitys" value="sy,cc,hrb"></c:set>
            <c:if test="${fn:contains(dbcitys, cityen)}">
                <c:forEach items="${types}" var="t2">
                    <dl class="encyclo-classify encyclo-classify_cs">
                        <dt><a href="/${cityen}/baike/c${t2.id}/p1">${t2.columnsName}</a></dt>
                        <dd>
                        <c:forEach items="${item.ChildList}" var="t3">
                            <a href="/${cityen}/baike/c${chr.id}/p1">${t3.columnsName}</a>
                        </c:forEach>
                        </dd>
                    </dl>
                </c:forEach>
            </c:if>--%>
        </div>
        <%--</c:if>--%>
        <div class="clear mb_28"></div>
    </div>
    <!-- E;centmain-inner -->
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/foot.jsp" %>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
<!--右侧贴边导航quick_links.js控制-->
<%--<div class="mui-mbar-tabs">
    <div class="quick_link_mian ">
        <div class="quick_links_panel">
            <div id="quick_links" class="quick_links">


                <li class="view_li">
                    <a href="#" class="view_list"><i class="view"></i><span class="cart_num">3</span></a>
                    <div class="mp_tooltip">约看单<i class="icon_arrow_right_black"></i>
                    </div>
                </li>
                <li class="histroy_li">
                    <a href="#" class="mpbtn_histroy"><i class="zuji"></i></a>
                    <div class="mp_tooltip">足迹<i class="icon_arrow_right_black"></i></div>
                </li>
                <li class="follow_li">
                    <a href="#" class="mpbtn_follow"><i class="follow"></i></a>
                    <div class="mp_tooltip">关注<i class="icon_arrow_right_black"></i></div>
                </li>
                <li class="intent_li">
                    <a href="#" class="my_intent"><i class="setting"></i>
                    </a>
                    <div class="mp_tooltip">我的意向<i class="icon_arrow_right_black"></i>
                    </div>
                </li>


                <li class="calculator_li">
                    <a href="#" class="mpbtn_calculator"><i class="calculator"></i></a>
                    <div class="mp_tooltip">房贷计算器<i class="icon_arrow_right_black"></i></div>
                </li>

                <li class="chat_li">
                    <a href="#" class="mpbtn_chat"><i class="chat"></i></a>
                    <div class="mp_tooltip">聊天<i class="icon_arrow_right_black"></i></div>
                </li>
                <li class="survey_li">
                    <a href="#" class="mpbtn_survey"><i class="survey"></i></a>
                    <div class="mp_tooltip">反馈问卷<i class="icon_arrow_right_black"></i></div>
                </li>
                <li class="app_li">
                    <a href="#" class="my_app"><i class="app"></i></a>
                    <div class="mp_qrcode">
                        <img src="${staticurl}/images/app.jpg" alt="">
                        <span>下载中原找房APP</span>
                        <i class="icon_arrow_right_black"></i></div>
                </li>
                <li class="toTop"><a href="#top" class="return_top"><i class="top"></i></a>
                    <div class="mp_tooltip">返回顶部<i class="icon_arrow_right_black"></i></div>
                </li>
            </div>

        </div>
        <div id="quick_links_pop" class="quick_links_pop "></div>
    </div>
</div>--%>
<!--[if lte IE 8]>
<script src="sidebar/ieBetter.js"></script>
<![endif]-->
<%--<script type="application/javascript">
    //点击搜索
    $(".icons-searchred-btn").click(function () {
        console.log('search btn');
        let keyword = $('.search-ipt').val();
        let type = $("#J_searchtype").val() || 0;
        location.href = getlink(type);
    })
    //search button text
    let arr = [
        "请输入楼盘名/地址",
        "请输入楼盘名/地址",
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
    }

    //获取请求链接
    function getlink(type) {
        let searchkey = $('.search-ipt').val();
        let cityen = '${cityen}';
        let obj = {
            0: "/" + cityen + "/list/?key=" + searchkey,
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
    }
</script>--%>
<script src="${staticurl}/js/cent_lists.js?v=${ver}"></script>
</body>
</html>