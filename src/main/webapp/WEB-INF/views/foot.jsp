<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- footer -->
<div class="section-wrap section-footer">
    <div class="section">
        <dl class="all-hlink">
            <dt>其它城市：</dt>
            <dd>
                    <a target="_blank" href="https://tj.centanet.com/" title="天津中原">天津中原</a>
                    <a target="_blank" href="https://bj.centanet.com/" title="北京中原">北京中原</a>
                    <a target="_blank" href="http://sh.centanet.com/" title="上海中原">上海中原</a>
                    <a target="_blank" href="https://gz.centanet.com/" title="广州中原">广州中原</a>
                    <a target="_blank" href="https://sz.centanet.com/" title="深圳中原">深圳中原</a>
                    <a target="_blank" href="http://www.centaline-macau.com/" class="f666" title="澳门中原">澳门中原</a>
                    <a target="_blank" href="https://cq.centanet.com/" title="重庆中原">重庆中原</a>
                    <a target="_blank" href="https://cd.centanet.com/" title="成都中原">成都中原</a>
                    <a target="_blank" href="https://nj.centanet.com/" title="南京中原">南京中原</a>
                    <a target="_blank" href="https://wh.centanet.com/" title="武汉中原">武汉中原</a>
                    <a target="_blank" href="https://cs.centanet.com/" title="长沙中原">长沙中原</a>
                    <a target="_blank" href="https://hz.centanet.com/" title="惠州中原">惠州中原</a>
                    <a target="_blank" href="https://dg.centanet.com/" title="东莞中原">东莞中原</a>
                    <a target="_blank" href="https://cc.centanet.com/" title="长春中原">长春中原</a>
                    <a target="_blank" href="https://dl.centanet.com/" title="大连中原">大连中原</a>
                    <a target="_blank" href="https://sy.centanet.com/" title="沈阳中原">沈阳中原</a>
                    <a target="_blank" href="https://nn.centanet.com/" title="南宁中原">南宁中原</a>
                    <a target="_blank" href="https://zj.centanet.com/" title="杭州中原">杭州中原</a>
                    <a target="_blank" href="https://nc.centanet.com/" title="南昌中原">南昌中原</a>
                    <a target="_blank" href="https://zh.centanet.com/" title="珠海中原">珠海中原</a>
                    <a target="_blank" href="https://xa.centanet.com/" title="西安中原">西安中原</a>
                    <a target="_blank" href="https://fs.centanet.com/" title="佛山中原">佛山中原</a>
                    <a target="_blank" href="https://ganzhou.centanet.com/" title="赣州中原">赣州中原</a>
                    <a target="_blank" href="https://fz.centanet.com/" title="福州中原">福州中原</a>
                    <a target="_blank" href="https://xm.centanet.com/" title="厦门中原">厦门中原</a>
                    <a target="_blank" href="https://hf.centanet.com/" title="合肥中原">合肥中原</a>
                    <a target="_blank" href="https://zs.centanet.com/" title="中山中原">中山中原</a>
                    <a target="_blank" href="https://km.centanet.com/" title="昆明中原">昆明中原</a>
                    <a target="_blank" href="https://hrb.centanet.com/" title="哈尔滨中原">哈尔滨中原</a>
                    <a target="_blank" href="https://nb.centanet.com/" title="宁波中原">宁波中原</a>
                    <a target="_blank" href="https://zq.centanet.com/" title="肇庆中原">肇庆中原</a>
                    <a target="_blank" href="https://xy.centanet.com/" title="襄阳中原">襄阳中原</a>
                    <a target="_blank" href="https://jn.centanet.com/" title="济南中原">济南中原</a>
                    <a target="_blank" href="https://zz.centanet.com/" title="郑州中原">郑州中原</a>
                    <a target="_blank" href="https://hq.centanet.com/" title="横琴中原">横琴中原</a>
            </dd>
        </dl>
        <c:if test="${cityen!='jtdr'}">
        <dl class="all-hlink">
            <c:set var="joinInfo" value="bj,tj,gz,sz,cd,cq,hz,dg,"></c:set>
            <c:if test="${fn:contains(joinInfo, cityen)}">
                <dt>相关信息：</dt>
                <dd>
                    <a href="//${cityen}.centanet.com/ershoufang/" target="_blank">${citycn}二手房</a>
                    <a href="//${cityen}.centanet.com/ershoufang-ditie/" target="_blank">${citycn}地铁找房</a>
                    <a href="//${cityen}.centanet.com/zufang/" target="_blank">${citycn}租房</a>
                    <a href="//${cityen}.centanet.com/xiaoqu/" target="_blank">${citycn}小区</a>
                    <a href="//${cityen}.centanet.com/jingjiren/" target="_blank">${citycn}经纪人</a>
                </dd>
            </c:if>
        </dl>
        <dl class="all-hlink">
            <c:set var="xiaoqu" value="bj,tj,gz,sz,cd,cq,hz,dg,"></c:set>
            <c:if test="${fn:contains(xiaoqu, cityen)}">
            <dt>小区检索：</dt>
                <dd>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/a/">A</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/b/">B</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/c/">C</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/d/">D</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/e/">E</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/f/">F</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/g/">G</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/h/">H</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/i/">I</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/j/">J</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/k/">K</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/l/">L</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/m/">M</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/n/">N</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/o/">O</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/p/">P</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/q/">Q</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/r/">R</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/s/">S</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/t/">T</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/u/">U</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/v/">V</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/w/">W</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/x/">X</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/y/">Y</a>
                    <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/z/">Z</a>
                </dd>
            </c:if>
        </dl>
        <p class="app " style="right:100px;top:-20px;">
            <img src="//static.centanet.com/pcweb/v7.4.4/images/download_app3.jpg?v7.4.4" alt="">
            <span style="text-align: center;">下载找房APP</span>
        </p>
        </c:if>
    </div>
    <div class="section-wrap section-footer-secondary">
        <div class="section">
        <c:if test="${cityen!='jtdr'}">
            <p class="bot-link"><%--<a href="">最新资讯</a>--%>
                <c:if test="${cityen == 'bj' || cityen == 'gz' || cityen == 'nj'  || cityen == 'dg'}">
                    <a href="/${cityen}/" target="_blank">最新资讯</a>
                    <a href="//${cityen}.centanet.com/ershoufang/u7/" target="_blank">最新房源</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank">关于我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank">联系我们</a>
                    <a href="//${cityen}.centanet.com/links/" target="_blank">友情链接</a>
                    <a href="//${cityen}.centanet.com/sitemap/" target="_blank">网站地图</a>
                    <a href="//www.centaline.com.cn/" target="_blank">其它城市</a>
                </c:if>

                <c:if test="${cityen == 'tj'}">
                    <a href="/${cityen}/" target="_blank">最新资讯</a>
                    <a href="//${cityen}.centanet.com/ershoufang/u7/" target="_blank">最新房源</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank">关于我们</a>
                    <a href="//${cityen}.centanet.com/job/" target="_blank">加入我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank">联系我们</a>
                    <a href="//${cityen}.centanet.com/links/" target="_blank">友情链接</a>
                    <a href="//${cityen}.centanet.com/sitemap/" target="_blank">网站地图</a>
                    <a href="//www.centaline.com.cn/" target="_blank">其它城市</a>
                </c:if>

                <c:if test="${cityen == 'sz'}">
                    <a href="/${cityen}/" target="_blank">最新资讯</a>
                    <a href="//${cityen}.centanet.com/ershoufang/u7/" target="_blank">最新房源</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank">关于我们</a>
                    <a href="//${cityen}.centanet.com/hr/" target="_blank">加入中原</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank">联系我们</a>
                    <a href="//${cityen}.centanet.com/links/" target="_blank">友情链接</a>
                    <a href="//${cityen}.centanet.com/sitemap/" target="_blank">网站地图</a>
                    <a href="//www.centaline.com.cn/" target="_blank">其它城市</a>
                </c:if>

                <c:if test="${cityen == 'cd' || cityen == 'cq'}">
                    <a href="//${cityen}.centanet.com/ershoufang/u7/" target="_blank">最新房源</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank">关于我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank">联系我们</a>
                    <a href="//${cityen}.centanet.com/links/" target="_blank">友情链接</a>
                    <a href="//${cityen}.centanet.com/sitemap/" target="_blank">网站地图</a>
                    <a href="//www.centaline.com.cn/" target="_blank">其它城市</a>
                </c:if>

                <c:if test="${cityen == 'wh'}">
                    <a href="/${cityen}/" target="_blank">最新资讯</a>
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank">关于我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank">联系我们</a>
                    <a href="//${cityen}.centanet.com/links/" target="_blank">友情链接</a>
                </c:if>

                <c:if test="${cityen == 'cs'}">
                    <a href="/${cityen}/" target="_blank">最新资讯</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank">关于我们</a>
                    <a href="//${cityen}.centanet.com/job/" target="_blank">加入中原</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank">联系我们</a>
                    <a href="//www.centaline.com.cn/" target="_blank">其它城市</a>
                </c:if>

                <c:if test="${cityen == 'cc'  || cityen == 'dl' || cityen == 'sy'  || cityen == 'xa'}">
                    <a href="/${cityen}/" target="_blank">最新资讯</a>
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank">关于我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank">联系我们</a>
                </c:if>

                <c:if test="${cityen == 'nn'  || cityen == 'nc' || cityen == 'fs' || cityen == 'fz'
                                     || cityen == 'ganzhou' || cityen == 'hf' || cityen == 'hrb'  || cityen == 'jn'
                                     || cityen == 'km' || cityen == 'nb' || cityen == 'wx' || cityen == 'xm'
                                     || cityen == 'xy' || cityen == 'zh' || cityen == 'zs' || cityen == 'zq'
                                     || cityen == 'zz'}">
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank">关于我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank">联系我们</a>
                </c:if>

                <c:if test="${cityen == 'zj'}">
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank">关于我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank">联系我们</a>
                    <a href="//${cityen}.centanet.com/job/" target="_blank">加入我们</a>
                </c:if>
            </p>
           <%-- 其它城市：--%>
        </c:if>
            <p class="copyright">
                本站所载各种成交信息和数据仅供参考，不构成任何投资建议；公司不对成交数据的准确性作出承诺，也不对任何错误负任何法律责任。所有合同均以最终签约为准。<br>
                Copyright ©${currentYear} Centanet.com&nbsp;版权所有&nbsp;&nbsp;<a target="_blank" style="color: #939393;" rel="nofollow" href="http://beian.miit.gov.cn">粤ICP备16080050号</a> &nbsp;
            </p>
            <p style="margin-top: 7px;">
                <a target="_blank" style="color: #939393;" rel="nofollow" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44030502004627"><img style="margin-right:5px;" src="https://static.centanet.com/v7p20415/images/police.png?v202005111">粤公网安备
                    44030502004627号</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>
