<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<div class="section-wrap section-footer">
    <div class="section">
        <div class="topblock clearfix">
            <p class="Levelone_link fl">

                <c:if test="${cityen == 'tj'}">
                    <a href="//news.centanet.com/${cityen}/" target="_blank">最新资讯</a>
                    <a href="//${cityen}.centanet.com/ershoufang/u7/" target="_blank">最新房源</a>
                    <a href="//${cityen}.centanet.com/sitemap/" target="_blank">网站地图</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank" rel="nofollow">关于我们</a>
                    <a href="//${cityen}.centanet.com/job/" target="_blank">加入我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank" rel="nofollow">联系我们</a>
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                </c:if>

                <c:if test="${cityen == 'gz'}">
                    <a href="//news.centanet.com/${cityen}/" target="_blank">最新资讯</a>
                    <a href="//${cityen}.centanet.com/ershoufang/u7/" target="_blank">最新房源</a>
                    <a href="//${cityen}.centanet.com/sitemap/" target="_blank">网站地图</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank" rel="nofollow">关于我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank" rel="nofollow">联系我们</a>
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                </c:if>

                <c:if test="${cityen == 'bj'}">
                    <a href="//news.centanet.com/${cityen}/" target="_blank">最新资讯</a>
                    <a href="//${cityen}.centanet.com/ershoufang/u7/" target="_blank">最新房源</a>
                    <a href="//${cityen}.centanet.com/sitemap/" target="_blank">网站地图</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank" rel="nofollow">关于我们</a>
                    <a href="//${cityen}.centanet.com/job/" target="_blank">招聘专区</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank" rel="nofollow">联系我们</a>
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                </c:if>

                <c:if test="${cityen == 'xa'}">
                    <a href="//news.centanet.com/${cityen}/" target="_blank">最新资讯</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank" rel="nofollow">关于我们</a>
                    <a href="//${cityen}.centanet.com/job/" target="_blank">招聘专区</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank" rel="nofollow">联系我们</a>
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                </c:if>

                <c:if test="${cityen == 'cq'}">
                    <a href="//${cityen}.centanet.com/ershoufang/u7/" target="_blank">最新房源</a>
                    <a href="//${cityen}.centanet.com/sitemap/" target="_blank">网站地图</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank" rel="nofollow">关于我们</a>
                    <a href="//${cityen}.centanet.com/job/" target="_blank">招聘专区</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank" rel="nofollow">联系我们</a>
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                </c:if>

                <c:if test="${cityen == 'cd'}">
                    <a href="//${cityen}.centanet.com/ershoufang/u7/" target="_blank">最新房源</a>
                    <a href="//${cityen}.centanet.com/sitemap/" target="_blank">网站地图</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank" rel="nofollow">关于我们</a>
                    <a href="//${cityen}.centanet.com/job/" target="_blank">招聘专区</a>
                    <a href="//act.centanet.com/actfile/cd/site/20181016zhaomu/index.html/" target="_blank">招募合作方</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank" rel="nofollow">联系我们</a>
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                </c:if>

                <c:if test="${cityen == 'xy' || cityen == 'fs' || cityen == 'nn' || cityen == 'hf' || cityen == 'xm' || cityen == 'wx'
                                || cityen == 'km' || cityen == 'nb' || cityen == 'zq' || cityen == 'jn'|| cityen == 'hq'|| cityen == 'yz'|| cityen == 'lz'|| cityen == 'zz' }">
                    <a href="//${cityen}.centanet.com/about/" target="_blank" rel="nofollow">关于我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank" rel="nofollow">联系我们</a>
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                </c:if>

                <c:if test="${cityen == 'dl'|| cityen == 'hrb' || cityen == 'cc' || cityen == 'sy' || cityen == 'wh' || cityen == 'nj' }">
                    <a href="//news.centanet.com/${cityen}/" target="_blank">最新资讯</a>
                    <a href="//${cityen}.centanet.com/about/" target="_blank" rel="nofollow">关于我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank" rel="nofollow">联系我们</a>
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                </c:if>

                <c:if test="${cityen == 'zj'}">
                    <a href="//${cityen}.centanet.com/about/" target="_blank" rel="nofollow">关于我们</a>
                    <a href="//${cityen}.centanet.com/job/" target="_blank">加入我们</a>
                    <a href="//${cityen}.centanet.com/contact/" target="_blank" rel="nofollow">联系我们</a>
                    <a href="//www.centaline.com.cn/" target="_blank">中原集团</a>
                </c:if>


            </p>



            <p class="side">拨打热线 <span class="cRed">${cityTelphone}</span> </p>
        </div>
        <p class="sub-link">
            <a href="javascript:;" data-hover="sub-1" onmouseover="cityOver();"  onmouseout="cityOut();">热门城市</a>
<%--            以下城市都没有相关信息以及小区查询--%>
<%--            <c:if test="${cityen != 'xy'  || cityen != 'fs' || cityen != 'nn' || cityen != 'hf' || cityen != 'xm' || cityen != 'wx'--%>
<%--                            || cityen != 'km' || cityen != 'nb' || cityen != 'zq' || cityen != 'jn' || cityen != 'dl'|| cityen != 'hrb'--%>
<%--                            || cityen != 'zj'  || cityen != 'cc' || cityen != 'yz' || cityen != 'lz' || cityen != 'zz' || cityen != 'wh'--%>
<%--                            || cityen != 'nj'  || cityen != 'xa'}">--%>
            <c:if test="${cityen == 'tj' || cityen == 'gz' || cityen == 'bj' || cityen == 'cd' || cityen == 'sy' || cityen == 'cq' || cityen == 'hq' }">
                <a href="javascript:;" data-hover="sub-2" onmouseover="cityOver2();" onmouseout="cityOut2();">相关信息</a>
                <a href="javascript:;" data-hover="sub-3" onmouseover="cityOver3();" onmouseout="cityOut3();">小区检索</a>
            </c:if>
                   </p>
        <dl class="city-link sub-1" data-isclick="1" style="display:block">
            <dd>
                <a target="_blank" href="https://tj.centanet.com/" title="天津中原">天津中原</a>
                <a target="_blank" href="https://bj.centanet.com/" title="北京中原">北京中原</a>
                <a target="_blank" href="https://sh.centanet.com/" title="上海中原">上海中原</a>
                <a target="_blank" href="https://gz.centanet.com/" title="广州中原">广州中原</a>
                <a target="_blank" href="https://sz.centanet.com/" title="深圳中原">深圳中原</a>
                <a target="_blank" href="https://mo.centanet.com/" title="澳门中原">澳门中原</a>
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
                <a target="_blank" href="https://lz.centanet.com/" title="兰州中原">兰州中原</a>
            </dd>
        </dl>
        <dl class="city-link sub-2" style="display:none">
            <dd>
                <a href="//${cityen}.centanet.com/ershoufang/" target="_blank">${citycn}二手房</a>
                <a href="//${cityen}.centanet.com/zufang/" target="_blank">${citycn}租房</a>
                <a href="//${cityen}.centanet.com/xiaoqu/" target="_blank">${citycn}小区</a>
                <a href="//${cityen}.centanet.com/jingjiren/" target="_blank">${citycn}经纪人</a>
                <a href="//${cityen}.centanet.com/sitemap/" target="_blank">网站地图</a>
            </dd>
        </dl>

        <dl class="city-link sub-3" style="display:none">
            <dd>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/a/" title="A">A</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/b/" title="B">B</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/c/" title="C">C</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/d/" title="D">D</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/e/" title="E">E</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/f/" title="F">F</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/g/" title="G">G</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/h/" title="H">H</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/i/" title="I">I</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/j/" title="J">J</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/k/" title="K">K</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/l/" title="L">L</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/m/" title="M">M</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/n/" title="N">N</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/o/" title="O">O</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/p/" title="P">P</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/q/" title="Q">Q</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/r/" title="R">R</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/s/" title="S">S</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/t/" title="T">T</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/u/" title="U">U</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/v/" title="V">V</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/w/" title="W">W</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/x/" title="X">X</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/y/" title="Y">Y</a>
                <a target="_blank" href="//${cityen}.centanet.com/xiaoqu-ditu/z/" title="Z">Z</a>                    </dd>
        </dl>
        <p class="copyright">
        本站所载各种成交信息和数据仅供参考，不构成任何投资建议；公司不对成交数据的准确性作出承诺，也不对任何错误负任何法律责任。所有合同均以最终签约为准。<br>
        安全中介&nbsp;&nbsp;选中原&nbsp;Copyright ©2022 Centanet.com&nbsp;版权所有&nbsp;&nbsp;<a target="_blank" style="color: #939393;" rel="nofollow" href="https://beian.miit.gov.cn">粤ICP备16080050号</a> &nbsp;<a target="_blank" style="color: #939393;" rel="nofollow" href="https://static.centanet.com/pcweb/test/20211230182121/images/licencephoto.jpg?v20211230182121">增值电信业务经营许可证：合字B2-20210337</a> &nbsp;
            <c:if test="${cityen == 'tj'}">
                客服邮箱：<a href="mailto:tjzytsjbyx@centaline.com.cn" target="_blank">tjzytsjbyx@centaline.com.cn</a>
            </c:if>
            <c:if test="${cityen == 'wh'}">
                客服邮箱：<a href="mailto:hbservice@centaline.com.cn" target="_blank">hbservice@centaline.com.cn</a>
            </c:if>
    </p>
        <p class="police">
            <a target="_blank" style="color: #939393;" rel="nofollow" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44030502004627"><img style="margin-right:5px;" src="https://static.centanet.com/pcweb/test/20211230182121/images/police.png?v20211230182121">粤公网安备 44030502004627号</a>
        </p>
        <c:if test="${cityen!='sh'}">

            <p class="infotxt">
                <img src="https://static.centanet.com/pcweb/v7.6.25/images/download_app3.jpg?v7.6.25" alt="" width="60" height="60">
                开发者：中原（中国）房地产代理有限公司<i class="double_words"></i>版本：${footInfo.version}<i class="double_words">
            </i>更新时间 ：${footInfo.currentDate}<i class="double_words"></i><a href="https://static.centanet.com/agreement/privacy.html" target="_blank"
                                                                class="tdu cRed">隐私政策</a><i class="double_words"></i><a href="https://static.centanet.com/agreement/authority.html"
                                                                                                                        target="_blank" class="tdu cRed">权限详情</a></p>
        </c:if>
<%--        若城市为上海则修改其页脚信息--%>
        <c:if test="${cityen=='sh'}">
            <div class="infotxt clearfix">
                <a href="https://sh.centanet.com/about/#6F" class="license" target="_blank">
                    <img src="https://static.centanet.com/news/2022080470/pc/images/mlicense.jpg" alt="">
                </a>
                <div class="js_gio_code" data-type="dibu" data-size="60"><img src="https://static.centanet.com/pcweb/v7.6.25/images/download_app3.jpg?v7.6.25" alt="" width="60" height="60"></div>
                <span class="block">开发者：中原（中国）房地产代理有限公司</span>
                <span class="block">版本：${footInfo.version}</span>
                <span class="block">更新时间 ：${footInfo.currentDate}<i class="double_words"></i><a href="https://static.centanet.com/agreement/privacy.html" target="_blank" class="tdu cRed">隐私政策</a><i class="double_words"></i><a href="https://static.centanet.com/agreement/authority.html" target="_blank" class="tdu cRed permissions_btn">权限详情</a></span>
            </div>
        </c:if>

    </div>
</div>
</body>
<style>
    .section-footer {
        margin-top: 92px;
        padding-bottom: 50px
    }

    .section-footer .topblock {
        height: 30px;
        line-height: 30px;
        width: 100%
    }

    .topblock .Levelone_link {
        width: 860px;
        height: 30px;
        float: left
    }

    .Levelone_link a:link,.Levelone_link a:visited,.Levelone_link a:active {
        color: #0b0000;
        font-size: 16px;
        margin-right: 40px;
        font-weight: 700;
        display: inline-block
    }

    .topblock .side {
        width: 300px;
        height: 30px;
        float: right;
        color: #0b0000;
        text-align: right;
        font-size: 14px;
        font-weight: bold
    }

    .topblock .side .cRed {
        display: inline-block;
        margin: 0 5px;

    }

    .sub-link {
        width: 100%;
        height: 25px;
        line-height: 25px;
        margin: 18px auto 12px
    }

    .sub-link a:link,.sub-link a:visited,.sub-link a:active {
        color: #0b0000;
        font-size: 14px;
        margin-right: 40px;
        display: inline-block
    }

    .city-link {
        width: 100%;
        height: 82px
    }


    .city-link a:link,.city-link a:visited,.city-link a:active {
        color: #b7bbc3;
        font-size: 14px;
        margin: 0 15px 2px 0;
        display: inline-block;
        line-height: 25px
    }

    .Levelone_link a:hover,.sub-link a:hover,.city-link a:hover {
        color: #fe0808
    }

    .section-footer .copyright {
        margin: 22px 0 12px;
        border-top: 1px solid #ececec;
        padding-top: 14px;
        line-height: 2.2;
        color: #b7bbc3;
        font-size: 12px
    }

    .section-footer .police {
        color: #b7bbc3;
        font-size: 12px
    }

    .section-footer .police img {
        vertical-align: middle;
        margin-right: 5px
    }

    .section {
        width: 1174px;
        margin: 0 auto;
        position: relative
    }

    .city-link {
        display: none;
    }
    .section-footer .infotxt {
        color: #b7bbc3;
        font-size: 12px;
        margin-top: 15px;
    }
    p {
        margin: 0;
        padding: 0;

    }
    a:hover {
        text-decoration: underline;
        color: #fe0808;
    }

</style>
<script type="application/javascript">


    function cityOver() {
        $(".sub-1").css("display",'block');
        $(".sub-2").css("display",'none');
        $(".sub-3").css("display",'none');
    }
    function cityOver2() {
        $(".sub-2").css("display",'block');
        $(".sub-1").css("display",'none');
        $(".sub-3").css("display",'none');
    }
    function cityOver3() {
        $(".sub-3").css("display",'block');
        $(".sub-1").css("display",'none');
        $(".sub-2").css("display",'none');
    }

</script>
</html>
