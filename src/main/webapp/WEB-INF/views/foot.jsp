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
            <c:set var="joinInfo2" value="hq,"></c:set>
            <c:if test="${fn:contains(joinInfo2, cityen)}">
                <dt>相关信息：</dt>
                <dd>
                    <a href="//${cityen}.centanet.com/ershoufang/" target="_blank">${citycn}二手房</a>
                    <a href="//${cityen}.centanet.com/zufang/" target="_blank">${citycn}租房</a>
                    <a href="//${cityen}.centanet.com/xiaoqu/" target="_blank">${citycn}小区</a>
                    <a href="//${cityen}.centanet.com/jingjiren/" target="_blank">${citycn}经纪人</a>
                </dd>
            </c:if>
        </dl>
        <dl class="all-hlink">
            <c:set var="xiaoqu" value="bj,tj,gz,sz,cd,cq,hz,dg,hq,"></c:set>
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
        <%--<p class="app " style="right:100px;top:-20px;">
            <img src="//static.centanet.com/pcweb/v7.4.4/images/download_app3.jpg?v7.4.4" alt="">
            <span style="text-align: center;">下载找房APP</span>
        </p>--%>
            <dl class="appbot clearfix" >
                <dt class="fl"><img src="//static.centanet.com/pcweb/v7.4.4/images/download_app3.jpg?v7.4.4" alt="">
                    <span>下载找房APP</span></dt>
                <dd class="last">
                    <p>开发者：中原（中国）房地产代理有限公司</p>
                    <p>版本：7.30.0</p>
                    <p>更新时间 ：2021年07月30日</p>
                    <p><a href="//static.centanet.com/agreement/privacy.html" class="tdu cRed" target="_blank">隐私政策</a><i class="double_words"></i>
                        <a href="//static.centanet.com/agreement/authority.html" class="tdu cRed permissions_btn" target="_blank">权限详情</a></p>
                </dd>
            </dl>
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

                <c:if test="${cityen == 'cd'}">
                    <a href="//${cityen}.centanet.com/ershoufang/u7/" target="_blank">最新房源</a>
                    <a href="//${cityen}.centanet.com/sitemap/" target="_blank">网站地图</a>
                    <a href="//${cityen}.centanet.com/job/" target="_blank">招聘专区</a>
                    <a href="//act.centanet.com/actfile/cd/site/20181016zhaomu/index.html" target="_blank">招募合作方</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank">联系我们</a>
                    <a href="//${cityen}.centanet.com/links/" target="_blank">友情链接</a>

                    <a href="//www.centaline.com.cn/" target="_blank">其它城市</a>
                </c:if>

                <c:if test="${cityen == 'cq'}">
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
            <p>
        </div>
    </div>
</div>
<div class="permisPop">
    <div class="permisPop_layer">
        <p class="caption">权限详情</p>
        <dl class="permis-cont">
            <dt>读写系统报告</dt>
            <dd>允许读写系统设置项</dd>
            <dt>拍照权限</dt>
            <dd>允许访问摄像头进行拍照</dd>
            <dt>使用蓝牙</dt>
            <dd>允许程序连接配对过的蓝牙设备</dd>
            <dt>蓝牙管理</dt>
            <dd>允许程序进行发现和配对新的蓝牙设备</dd>
            <dt>修改声音设置</dt>
            <dd>修改声音设置信息</dd>
        </dl>
        <i role="button" tabindex="0" class="van-icon van-icon-cross van-popup__close-icon van-popup__close-icon--top-right"><!----></i>
    </div>

</div>
<div class="popupbg"></div>
</body>
<style>
    .appbot{
        width: 350px;
        height: 100px;
        position: absolute;
        right: 0;
        top: 0 !important;
    }
    .appbot dt{
        width: 100px;
        height: 100px;
        float:left;
        text-align: center;
    }
    .appbot dt img{
        width: 100px;
        height: 100px;
    }
    .appbot dd{
        width: 230px;
        height: 100px;
        float:left;
        margin-left: 10px;
    }
    .appbot dd p{
        margin-bottom: 6px;
        line-height: 1.6;
        color: #7d7b7b;
        font-size:12px;
    }
    .section-footer dl.all-hlink{
        width: 80%;
    }
    .section-footer dl.all-hlink dd{
        width: 74%;
    }
    .permisPop {
        border-radius: 8px;
        width: 500px;
        height: auto;
        background: #fff;
        display: none;
        padding-bottom: 10px;
        display:none;
    }
    .permisPop .close {
        display: block;
        width: 18px;
        height: 18px;
        position: absolute;
        right: 15px;
        top: 15px;
        background:  no-repeat -126px -116px;
    }
    .permisPop .permisPop_layer {
        padding: 20px;
    }
    .permisPop .caption {
        color: #333;
        font-size: 18px;
        padding: 15px 0 0 10px;
        text-align: center;
        font-weight: 700;
    }
    .permisPop .permis-cont {
        width: 460px;
        height: auto;
        margin: 20px 0 0 15px;
        font-size: 14px;
    }
    .permis-cont dt{
        font-size:16px;
        color:#333;
        margin-bottom: 5px;
        font-weight: 700;
    }
    .permis-cont dd{
        font-size:14px;
        color:#666;
        margin-bottom: 25px;
    }

    .popupbg {
        display: none;
        top: 0;
        left: 0;
        width: 100%;
        position: absolute;
        z-index: 999;
        background: rgba(102, 102, 102, 0.7);
        filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr='#b2666666', EndColorStr='#b2666666');
        -ms-filter: "progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorstr='#b2666666', EndColorstr='#b2666666')";
        zoom: 1;
    }

    .van-icon-cross {
        position: relative;
        width: 20px;
        height: 20px;
        margin-right: 2rem;
    }

    .van-icon-cross::before,
    .van-icon-cross::after
    {
        position: absolute;
        content: ' ';
        background-color: #c8c9cc;
        left: 20px;
        width: 1px;
        height: 20px;
    }
    .van-icon-cross::before {
        transform: rotate(45deg);
    }

    .van-icon-cross::after {
        transform: rotate(-45deg);
    }
    .van-icon::before {
        display: inline-block;
    }


    .van-popup__close-icon--top-right {
        top: 16px;
        right: 16px;
    }

    .van-popup__close-icon {
        position: absolute;
        z-index: 1;
        color: #c8c9cc;
        font-size: 22px;
        cursor: pointer;
    }

    .van-icon::before {
        display: inline-block;
    }

    .van-popup__close-icon {
        position: absolute;
        z-index: 1;
        color: #c8c9cc;
        font-size: 22px;
        cursor: pointer;
    }
    .van-popup__close-icon--top-right {
        top: 16px;
        right: 16px;
    }

    .van-icon {
        position: relative;
        display: inline-block;
        font: normal normal normal 14px/1 vant-icon;
        font-size: inherit;
        text-rendering: auto;
        -webkit-font-smoothing: antialiased;
    }

    .van-popup__close-icon {
        position: absolute;
        z-index: 1;
        color: #c8c9cc;
        font-size: 22px;
        cursor: pointer;
    }
</style>
</html>
