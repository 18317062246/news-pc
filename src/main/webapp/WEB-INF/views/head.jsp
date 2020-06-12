
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--head--%>
<c:if test="${cityen != 'jtdr'}">
<div class="section-wrap section-header">
    <div class="section">
        <ul class="nav-header fl">
            <%
                //获取城市名称
                String cityName = (String) request.getAttribute("cityName");
                //获取城市简称
                String cityen = (String) request.getAttribute("cityen");

            %>
            <c:choose>
                <c:when test="${cityen == 'bj'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li ><a href="">二手房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/ershoufang/" target="_blank">出售房源</a>
                            <a href="//<%=cityen%>.centanet.com/entrust/sale/" target="_blank">我要出售</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/zufang/" target="_blank">租房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xiezilou/" target="_blank">写字楼<span>·</span>商铺</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xiaoqu/" target="_blank">小区</a></li>
                    <li><a href="">房价成交</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/chengjiao/contrast/" target="_blank">成交走势</a>
                            <a href="//<%=cityen%>.centanet.com/chengjiao/" target="_blank">成交历史</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li class="appdown"><a href=""><i class="phone-icon"></i>APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt="下载"/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>

                    <li><a href="" >经纪人</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/jingjiren/" target="_blank">经纪人</a>
                            <a href="//<%=cityen%>.centanet.com/mendian/" target="_blank">门店</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'tj'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li ><a href="">二手房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/ershoufang/" target="_blank">在售房源</a>
                            <a href="//<%=cityen%>.centanet.com/ershoufang/u7/?from=topnav" target="_blank">最新发布</a>
                            <a href="//<%=cityen%>.centanet.com/ershoufang/?tag=5&from=topnav" target="_blank">随时可看</a>
                            <a href="//<%=cityen%>.centanet.com/entrust/sale/" target="_blank">发布房源</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/zufang/" target="_blank">租房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xiaoqu/" target="_blank">小区</a></li>
                    <li><a href="">成交<span>·</span>走势</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/chengjiao/contrast/" target="_blank">二手房走势</a>
                            <a href="//<%=cityen%>.centanet.com/chengjiao/" target="_blank">二手房成交</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="" >经纪人</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/jingjiren/" target="_blank">经纪人</a>
                            <a href="//<%=cityen%>.centanet.com/mendian/" target="_blank">门店</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/entrust/" target="_blank">发布房源</a></li>
                    <li><a href="http://tjvplus.centaline.com.cn/" target="_blank">居划算</a></li>
                </c:when>

                <c:when test="${cityen == 'gz'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li ><a href="">二手房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/ershoufang/" target="_blank">在售房源</a>
                            <a href="//<%=cityen%>.centanet.com/ershoufang-ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/ershoufang-xuexiao/" target="_blank">学区找房</a>
                            <a href="//<%=cityen%>.centanet.com/entrust/sale/" target="_blank">发布房源</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <a href="//esf.centanet.com/zhuanti/dawanqu/?<%=cityen%>" target="_blank">粤港澳大湾区</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/zufang/" target="_blank">租房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xiaoqu/" target="_blank">小区</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xiezilou/" target="_blank">写字楼</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/gongshangpu/" target="_blank">商铺</a></li>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="" >经纪人</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/jingjiren/" target="_blank">经纪人</a>
                            <a href="//<%=cityen%>.centanet.com/mendian/" target="_blank">门店</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/entrust/" target="_blank">发布房源</a></li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="//<%=cityen%>.centanet.com/about/" target="_blank">关于中原</a></li>
                </c:when>

                <c:when test="${cityen == 'sz'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li ><a href="">二手房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/ershoufang/" target="_blank">在售房源</a>
                            <a href="//<%=cityen%>.centanet.com/ershoufang-ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/entrust/sale/" target="_blank">发布房源</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <a href="//esf.centanet.com/zhuanti/dawanqu/?<%=cityen%>" target="_blank">粤港澳大湾区</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/zufang/" target="_blank">租房</a></li>
                    <li><a href="//http://world.<%=cityen%>.centanet.com/" target="_blank">海外</a></li>
                    <li><a href="">中原大数据</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/chengjiao/contrast/" target="_blank">成交走势</a>
                            <a href="//<%=cityen%>.centanet.com/chengjiao/" target="_blank">成交历史</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xiaoqu/" target="_blank">小区</a></li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="//<%=cityen%>.centanet.com/xiezilou/" target="_blank">写字楼</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/gongshangpu/" target="_blank">商铺</a></li>

                    <li><a href="" >经纪人</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/jingjiren/" target="_blank">经纪人</a>
                            <a href="//<%=cityen%>.centanet.com/mendian/" target="_blank">门店</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/entrust/" target="_blank">发布房源</a></li>
                </c:when>

                <c:when test="${cityen == 'cd'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li ><a href="">二手房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/ershoufang/" target="_blank">在售房源</a>
                            <a href="//<%=cityen%>.centanet.com/entrust/sale/" target="_blank">发布房源</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/zufang/" target="_blank">租房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xiaoqu/" target="_blank">小区</a></li>
                    <li><a href="">成交走势</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">新房走势</a>
                            <a href="//<%=cityen%>.centanet.com/chengjiao/contrast/" target="_blank">二手房走势</a>
                            <a href="//<%=cityen%>.centanet.com/chengjiao/" target="_blank">二手房成交</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xiezilou/" target="_blank">写字楼</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/gongshangpu/" target="_blank">商铺</a></li>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="" >经纪人</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/jingjiren/" target="_blank">经纪人</a>
                            <a href="//<%=cityen%>.centanet.com/mendian/" target="_blank">门店</a>
                            <i class="arrow"></i>
                        </div>
                    </li>

                    <li><a href="//<%=cityen%>.centanet.com/entrust/" target="_blank">发布房源</a></li>
                </c:when>

                <c:when test="${cityen == 'cq'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li ><a href="">二手房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/ershoufang/" target="_blank">在售房源</a>
                            <a href="//<%=cityen%>.centanet.com/entrust/sale/" target="_blank">发布房源</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/zufang/" target="_blank">租房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xiezilou/" target="_blank">写字楼</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/gongshangpu/" target="_blank">商铺</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xiaoqu/" target="_blank">小区</a></li>
                    <li><a href="">成交走势</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/chengjiao/contrast/" target="_blank">成交走势</a>
                            <a href="//<%=cityen%>.centanet.com/chengjiao/" target="_blank">成交历史</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="" >经纪人</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/jingjiren/" target="_blank">经纪人</a>
                            <a href="//<%=cityen%>.centanet.com/mendian/" target="_blank">门店</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/entrust/" target="_blank">发布房源</a></li>
                </c:when>

                <c:when test="${cityen == 'nj'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>

                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/live/" target="_blank">直播</a></li>

                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'wh'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>

                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">成交走势</a></li>


                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'cs'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>

                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/about/" target="_blank">关于湖南中原</a></li>
                </c:when>

                <c:when test="${cityen == 'hz'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li ><a href="">二手房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/ershoufang/" target="_blank">在售房源</a>
                            <a href="//<%=cityen%>.centanet.com/ershoufang/u7/?from=topnav" target="_blank">最新发布</a>
                            <a href="//<%=cityen%>.centanet.com/ershoufang/?tag=5&from=topnav" target="_blank">随时可看</a>
                            <a href="//<%=cityen%>.centanet.com/entrust/sale/" target="_blank">发布房源</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">轨道找新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/huodong/" target="_blank">最新活动</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <a href="//esf.centanet.com/zhuanti/dawanqu/?<%=cityen%>" target="_blank">粤港澳大湾区</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/zufang/" target="_blank">租房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xiaoqu/" target="_blank">小区</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/live/" target="_blank">视频看房</a></li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="" >经纪人</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/jingjiren/" target="_blank">经纪人</a>
                            <a href="//<%=cityen%>.centanet.com/mendian/" target="_blank">门店</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/entrust/" target="_blank">发布房源</a></li>
                </c:when>

                <c:when test="${cityen == 'dg'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li ><a href="">二手房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/ershoufang/" target="_blank">在售房源</a>
                            <a href="//<%=cityen%>.centanet.com/entrust/sale/" target="_blank">发布房源</a>
                            <a href="//act.centanet.com/actfile/<%=cityen%>/site/20180824/index-pc.html" target="_blank">聚焦笋盘</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//act.centanet.com/actfile/<%=cityen%>/site/20190930/index-pc.html" target="_blank">特惠新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <a href="//esf.centanet.com/zhuanti/dawanqu/?<%=cityen%>" target="_blank">粤港澳大湾区</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/zufang/" target="_blank">租房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/t5/" target="_blank">商铺</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/t4/" target="_blank">写字楼</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xiaoqu/" target="_blank">小区</a></li>
                    <li><a href="">成交走势</a>
                        <div class="subnav" >
                            <a href="//dg.centanet.com/xinfang/chengjiao/" target="_blank">新房走势</a>
                            <a href="//dg.centanet.com/chengjiao/contrast/" target="_blank">二手房走势</a>
                            <a href="//dg.centanet.com/chengjiao/" target="_blank">二手房成交</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="" >经纪人</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/jingjiren/" target="_blank">经纪人</a>
                            <a href="//<%=cityen%>.centanet.com/mendian/" target="_blank">门店</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/entrust/" target="_blank">发布房源</a></li>
                </c:when>

                <c:when test="${cityen == 'cc' || cityen == 'dl' || cityen == 'sy'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">成交走势</a></li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'nn'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/huodong/" target="_blank">最新活动</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'zj'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/job/" target="_blank">加入我们</a></li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'nc'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">成交走势</a></li>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>
                <c:when test="${cityen == 'fs'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//esf.centanet.com/zhuanti/dawanqu/?<%=cityen%>" target="_blank">粤港澳大湾区</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/huodong/" target="_blank">最新活动</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">成交走势</a></li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'fz'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">成交走势</a></li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'ganzhou'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/huodong/" target="_blank">最新活动</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'hf' || cityen == 'jn' || cityen == 'km' || cityen == 'nb' || cityen == 'xy'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/huodong/" target="_blank">最新活动</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">成交走势</a></li>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'hrb'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">成交走势</a></li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'wx' || cityen == 'zq'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/huodong/" target="_blank">最新活动</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">成交走势</a></li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${ cityen == 'xa' || cityen == 'zz'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/huodong/" target="_blank">最新活动</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">成交走势</a></li>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>

                <c:when test="${cityen == 'xm'}">
                    <li><a href="//<%=cityen%>.centanet.com/" target="_blank">首页</a></li>
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditie/" target="_blank">地铁找房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">成交走势</a></li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>
                <c:when test="${cityen == 'zh'}">
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <a href="//esf.centanet.com/zhuanti/dawanqu/?<%=cityen%>" target="_blank">粤港澳大湾区</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/huodong/" target="_blank">最新活动</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/chengjiao/" target="_blank">成交走势</a></li>
                    <c:choose>
                        <c:when test="${baiketype}">
                            <li class="curr"><a href="/<%=cityen%>/">资讯<span>·</span>百科</a>
                                <div class="subnav" >
                                    <a href="/<%=cityen%>/" target="_blank">资讯</a>
                                    <a href="/<%=cityen%>/baike/" target="_blank">购房百科</a>
                                    <i class="arrow"></i>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="curr"><a href="/<%=cityen%>/" target="_blank">资讯<span>·</span>百科</a>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>
                <c:when test="${cityen == 'zs'}">
                    <li><a href="">新房</a>
                        <div class="subnav" >
                            <a href="//<%=cityen%>.centanet.com/xinfang/" target="_blank">全部新房</a>
                            <a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a>
                            <a href="//esf.centanet.com/zhuanti/dawanqu/?<%=cityen%>" target="_blank">粤港澳大湾区</a>
                            <i class="arrow"></i>
                        </div>
                    </li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/huodong/" target="_blank">最新活动</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/k1/" target="_blank">当月开盘</a></li>
                    <li><a href="//<%=cityen%>.centanet.com/xinfang/ditu/" target="_blank">地图找房</a></li>
                    <li><a href="">APP下载</a>
                        <div class="subnav" >
                            <img src="${staticurl}/images/app.jpg" alt=""/>
                            <i class="arrow"></i>
                        </div>
                    </li>
                </c:when>
            </c:choose>
        </ul>



        <div class="login-iframe fr" >
                <%--<iframe frameborder="0"  scrolling="no"  id="iframeA" src="//passport.centanet.com/page/top.aspx?from=" allowTransparency="true" ></iframe>--%>
            <iframe src="https://passport.centanet.com/page/top.aspx?from=" id="iframeA" name="iframeA"  loginsrc="https://passport.centanet.com/page/top.aspx?from=" marginwidth="0" marginheight="0" scrolling="no" frameborder="0"></iframe>

        </div>
        <p class="hot-phone fr">热线：${cityTelphone}</p>
    </div>
</div>
</c:if>
<%--search--%>
<div class="section-wrap section-search">
    <div class="section">
        <h2 class="logo fl"><a href="">中原地产</a></h2>

        <div class="clear"></div>
        <div class="search-box fl">
            <div class="search-entry">
                <div class="sear_choosebox" id="J_searchtype">
                    <span class="type-txt">资讯</span>
                </div>
                <span class="line"></span>
                <span class="icons-search"></span>
                <input class="search-ipt" placeholder="请输入资讯标题或内容" type="text">
                <div class="history-sug" style="display: none;">
                    <ul>
                        <li class="his-tit"><span class="his-tips">搜索历史</span><span class="del">清空</span></li>
                        <li class="his-tiem"><a href="http:www.baidu.com" target="_blank">恒德花园</a></li>
                        <li class="his-tiem"><a href="">恒德花园</a></li>
                        <li class="his-tiem"><a href="">恒德花园</a></li>
                        <li class="his-tiem"><a href="">恒德花园</a></li>
                        <li class="del">清除历史记录</li>
                    </ul>
                </div>
            </div><button type="image" class="icons-searchred-btn"><span>马上搜</span></button>
        </div>
        <%--<a href="" class="icons-map fl"></a>--%>
        <div class="clear"></div>
    </div>
</div>
<script type="text/javascript">

    //判断是否为ie浏览器
    if(window.ActiveXObject || "ActiveXObject" in window){
        //如果是ie浏览器，设置iframe的透明度
            var ifra=document.getElementsByTagName('iframeA');
            for(var i=0,l=ifra.length;i<l;i++) {
                ifra[i].setAttribute('allowTransparency','true');
            }
    }
    //点击搜索
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
        /* "请输入楼盘名/地址",
         "请输入楼盘名/地址",*/
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
    }
</script>
</body>
</html>
