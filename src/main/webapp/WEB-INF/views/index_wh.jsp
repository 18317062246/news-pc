<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
    <!-- <meta name="renderer" content="webkit">
       目前IE最新的正常模式去浏览
    <meta http-equiv="x-ua-compatible" content="IE=edge">-->
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <link rel="icon" href="https://news.centanet.com/uploads/favicon.ico" type="image/x-icon"/>
    <title>长沙房地产资讯_长沙最新房产新闻_长沙楼市政策-长沙中原地产</title>
    <meta name="keywords" content="长沙最新房产新闻,长沙房产资讯,长沙房地产资讯,长沙楼市政策,长沙楼市新闻"/>
    <meta name="description"
          content="长沙房产新闻,长沙中原地产提供最及时长沙房产新闻、长沙房地产资讯，为您解读长沙房产最新政策，预测长沙房价走势，分析长沙楼市成交数据。中原地产最资深最可靠的房地产网站"/>
    <link rel="stylesheet" href="${staticurl}/css/cent_basev3.css"/>
    <link rel="stylesheet" href="${staticurl}/css/listp2.css"/>
    <link rel="stylesheet" href="${staticurl}/css/icons.css"/>
    <link rel="stylesheet" href="${staticurl}/sidebar/sidebar.css"/>
    <link rel="stylesheet" href="${staticurl}/css/cent_information.css"/>
    <link rel="stylesheet" href="${staticurl}/css/cs_cent_information.css"/>
    <script src="${staticurl}/js/jquery-1.7.min.js"></script>
    <script src="${staticurl}/js/jquery.slides.min.js"></script>
    <script src="${staticurl}/js/placeholder.js"></script>

    <script src="${staticurl}/js/totalexchange.js"></script>
    <script type="text/javascript">
        $(function () {
            var webp = !![].map && document.createElement('canvas').toDataURL('image/webp').indexOf(
                'data:image/webp') == 0 ? "?f=webp" : "";
            var imgs = document.getElementsByTagName("img");
            for (var i = 0; i < imgs.length; i++) {
                document.getElementsByTagName("img")[i].src = document.getElementsByTagName("img")[i].src +
                    webp;
            }
        })
    </script>
</head>

<body id="yyInfo">
<!-- S;headernav -->
<%--head--%>
<%@include file="/WEB-INF/views/head.jsp" %>
<!-- S:banner-->
<div class="centmain-wraper ">
    <div class="centmain-inner">
        <div class="breadcrumbs clearfix">
            <div class="fl breadcrumbs-area f000 ">
                <a href="//cs.centanet.com/" class="f000">首页</a>
                <span class="fsm">></span>
                <span>资讯</span>
            </div>
        </div>
    </div>
</div>
<div class="scroll">
    <ul class="scroll_ul">
        <li class="scroll_li"><a href="https://news.centanet.com/cs/yjcg/12242.html"><img
                src='https://news.centanet.com/uploads/200506/14-2005126145822.jpg' border='0' width='1200'
                height='420' alt='研究报告2'/>研究报告2</a></li>
        <li class="scroll_li"><a href="https://news.centanet.com/cs/yjcg/12302.html"><img
                src='https://news.centanet.com/uploads/200511/14-2005131142433.jpg' border='0' width='1200'
                height='420' alt='研究报告1'/>研究报告1</a></li>

    </ul>
    <div class="prev"><img src="${staticurl}/images/arrow-prev.png"/></div>
    <div class="next"><img src="${staticurl}/images/arrow-next.png"/></div>
</div>
<!-- E:banner -->
<!-- S;centmain-wraper -->
<div class="content_all">
    <div class="content_nav">
        <div class="content_nav_left">
            <c:forEach items="${types}" var="t" varStatus="status">
                <a ref='${t.id}' href='javascript:void(0);' class="active" id='yjbg'>${t.columnsName}</a>
                <c:if test="${!status.last}">
                    <span>|</span>
                </c:if>
            </c:forEach>
            <div class="clearfix"></div>
            <%--    <a href='javascript:void(0);' id='tdzx'>土地资讯</a>
                <span>|</span>
                <a href='javascript:void(0);' id='xfzx'>新房资讯</a>
                <div class="clearfix"></div>--%>
        </div>
        <div class="content_nav_right">
            <a href='/cs/yjcg/' name="a_moreinfo" class="active">查看更多</a>
        </div>
    </div>
    <div class="content_column_left">
        <div class="column1">
            <c:forEach items="${news}" var="n" varStatus="status">
                <div class="column_block type${n.TypeID}" style="display: none">
                    <div class="column_block_img">
                        <a href="/${cityen}/detail/${ID}.html">
                            <img src='${n.LitPic}'
                                 alt='${n.Title}' width='238' height='182'/>
                        </a>
                    </div>
                    <div class="column_block_text">
                        <div class="column_block_text_title">
                            <a href="/${cityen}/detail/${ID}.html" target="_blank">${n.Title}</a>
                        </div>
                        <p class="column_block_text_para">${n.Description}<span>...</span></p>
                        <div class="column_block_text_time"><span>
                            <jsp:useBean id="myDate" class="java.util.Date"/>
                            <c:set target="${myDate}" property="time" value="${n.PublishDate}"/>
                            <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${myDate}" type="both"/>
                        </span></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </c:forEach>
            <%--  <div class="column_block">
                  <div class="column_block_img">
                      <a href="/cs/yjcg/12242.html">

                          <img src='https://news.centanet.com/uploads/200506/14-2005126142408.png'
                               alt='湖南中原第18期周报【2020.04.26-2020.05.02】' width='238' height='182'/>
                      </a>
                  </div>
                  <div class="column_block_text">
                      <div class="column_block_text_title">
                          <a href="/cs/yjcg/12242.html" target="_blank">湖南中原第18期周报【2020.04.26-2020.05.02】</a>
                      </div>
                      <p class="column_block_text_para">政策动态 浙江户口新政：放开落户限制，酒店式公寓可设集体户
                          4月28日，浙江省公安厅正式发布《浙江省常住户口登记管理规定》，规定将于5月1日正式实施。 《户口规定》提出10条便</p>
                      <div class="column_block_text_time"><span>2020-05-06 14:20:17</span></div>
                  </div>
                  <div class="clearfix"></div>
              </div>
              <div class="column_block">
                  <div class="column_block_img">
                      <a href="/cs/yjcg/12185.html">

                          <img src='https://news.centanet.com/uploads/allimg/200427/14-20041515240-l.jpg'
                               alt='湖南中原第17期周报【2020.04.19-2020.04.25】' width='238' height='182'/>
                      </a>
                  </div>
                  <div class="column_block_text">
                      <div class="column_block_text_title">
                          <a href="/cs/yjcg/12185.html" target="_blank">湖南中原第17期周报【2020.04.19-2020.04.25】</a>
                      </div>
                      <p class="column_block_text_para">政策动态 央行：5年期LPR利率下降，创历史新低
                          中国人民银行授权全国银行间同业拆借中心公布，2020年4月20日贷款市场报价利率（LPR）为：1年期LPR为3.85%，5年期以上LPR为4.65%。以上LP</p>
                      <div class="column_block_text_time"><span>2020-04-27 15:14:30</span></div>
                  </div>
                  <div class="clearfix"></div>
              </div>
              <div class="column_block">
                  <div class="column_block_img">
                      <a href="/cs/yjcg/11978.html">

                          <img src='https://news.centanet.com/uploads/allimg/200420/14-20041402260-l.jpg'
                               alt='湖南中原第16期周报【2020.04.12-2020.04.18】' width='238' height='182'/>
                      </a>
                  </div>
                  <div class="column_block_text">
                      <div class="column_block_text_title">
                          <a href="/cs/yjcg/11978.html" target="_blank">湖南中原第16期周报【2020.04.12-2020.04.18】</a>
                      </div>
                      <p class="column_block_text_para">政策动态 国家统计局：今年一季度国内生产总值同比下降6.8%
                          4月17日上午，国务院新闻办公室举行新闻发布会，介绍2020年一季度国民经济运行情况。 国家统计局国民经济综合统计司司</p>
                      <div class="column_block_text_time"><span>2020-04-20 14:00:18</span></div>
                  </div>
                  <div class="clearfix"></div>
              </div>
              <div class="column_block">
                  <div class="column_block_img">
                      <a href="/cs/yjcg/11903.html">

                          <img src='https://news.centanet.com/uploads/allimg/200413/14-2004131345470-L.jpg'
                               alt='湖南中原第15期周报【2020.04.05-2020.04.11】' width='238' height='182'/>
                      </a>
                  </div>
                  <div class="column_block_text">
                      <div class="column_block_text_title">
                          <a href="/cs/yjcg/11903.html" target="_blank">湖南中原第15期周报【2020.04.05-2020.04.11】</a>
                      </div>
                      <p class="column_block_text_para">政策动态 中央发布重要文件，涉及户口、土地、股市、利率制度
                          中共中央、国务院近日发布《关于构建更加完善的要素市场化配置体制机制的意见》（2020年3月30日）。 意见提出， 深</p>
                      <div class="column_block_text_time"><span>2020-04-13 13:41:49</span></div>
                  </div>
                  <div class="clearfix"></div>
              </div>
              <div class="column_block">
                  <div class="column_block_img">
                      <a href="/cs/yjcg/11784.html">

                          <img src='https://news.centanet.com/uploads/allimg/200407/14-20040G33K40-L.jpg'
                               alt='湖南中原第14期周报【2020.03.29-2020.04.04】' width='238' height='182'/>
                      </a>
                  </div>
                  <div class="column_block_text">
                      <div class="column_block_text_title">
                          <a href="/cs/yjcg/11784.html" target="_blank">湖南中原第14期周报【2020.03.29-2020.04.04】</a>
                      </div>
                      <p class="column_block_text_para">政策动态 央行：对中小银行定向降准，可释放长期资金约4000亿
                          为支持实体经济发展，促进加大对中小微企业的支持力度，降低社会融资实际成本，中国人民银行决定对农村信用社、农</p>
                      <div class="column_block_text_time"><span>2020-04-07 13:37:00</span></div>
                  </div>
                  <div class="clearfix"></div>
              </div>--%>

        </div>
        <%-- <div class="column2" style="display: none;">
             <div class="column_block">
                 <div class="column_block_img">
                     <a href="/cs/tdzx/12297.html">

                         <img src='https://news.centanet.com/uploads/200511/14-2005131104404.jpg' alt='金科竞得雷锋板块双限地'
                              width='238' height='182'/>
                     </a>
                 </div>
                 <div class="column_block_text">
                     <div class="column_block_text_title">
                         <a href="/cs/tdzx/12297.html" target="_blank">金科竞得雷锋板块双限地</a>
                     </div>
                     <p class="column_block_text_para">[2020]望城区009号 [2020]望城区009号： 宗地位于望城区雷锋板块，东临谷山路、南临银星路
                         、北临桑梓路。地块为纯住用地，总建面约23.3万方。 地块经4家房企6轮竞价后，最终被长沙金科</p>
                     <div class="column_block_text_time"><span>2020-05-11 10:43:09</span></div>
                 </div>
                 <div class="clearfix"></div>
             </div>
             <div class="column_block">
                 <div class="column_block_img">
                     <a href="/cs/tdzx/12296.html">

                         <img src='https://news.centanet.com/uploads/allimg/200511/14-20051041460-l.png'
                              alt='品牌房企接连落子，延拓在长版图' width='238' height='182'/>
                     </a>
                 </div>
                 <div class="column_block_text">
                     <div class="column_block_text_title">
                         <a href="/cs/tdzx/12296.html" target="_blank">品牌房企接连落子，延拓在长版图</a>
                     </div>
                     <p class="column_block_text_para">[2020]长沙市031号 [2020]长沙市031号：
                         宗地位于芙蓉区隆平高科板块，东临双杨路、南临纬六路、西临桃园路、北临黄元路，距6号线水稻博物馆站直线距离约380米。地块为商住混合用地，</p>
                     <div class="column_block_text_time"><span>2020-05-11 10:31:04</span></div>
                 </div>
                 <div class="clearfix"></div>
             </div>
             <div class="column_block">
                 <div class="column_block_img">
                     <a href="/cs/tdzx/12188.html">

                         <img src='https://news.centanet.com/uploads/allimg/200427/14-20041538150-l.png'
                              alt='四拍三熔断！4月长沙土拍战火燎原' width='238' height='182'/>
                     </a>
                 </div>
                 <div class="column_block_text">
                     <div class="column_block_text_title">
                         <a href="/cs/tdzx/12188.html" target="_blank">四拍三熔断！4月长沙土拍战火燎原</a>
                     </div>
                     <p class="column_block_text_para">[2020]望城区007号 [2020]望城区007号：
                         宗地位于望城区滨水新城板块，王家湾路与星峰路交叉口东北角。距地铁四号线罐子岭站直线距离约500米。地块为纯住用地，总建面约2.9万方。 7家公</p>
                     <div class="column_block_text_time"><span>2020-04-27 15:37:26</span></div>
                 </div>
                 <div class="clearfix"></div>
             </div>
             <div class="column_block">
                 <div class="column_block_img">
                     <a href="/cs/tdzx/12182.html">

                         <img src='https://news.centanet.com/uploads/allimg/200427/14-20040931420-l.png'
                              alt='版图西延，中海摘得梅溪湖二期11300限价地' width='238' height='182'/>
                     </a>
                 </div>
                 <div class="column_block_text">
                     <div class="column_block_text_title">
                         <a href="/cs/tdzx/12182.html" target="_blank">版图西延，中海摘得梅溪湖二期11300限价地</a>
                     </div>
                     <p class="column_block_text_para">[2020]长沙市020号 [2020]长沙市020号：
                         宗地位于梅溪湖二期板块，北临红枫路、东临松柏路、南临看云路，丝兰路从地块中间穿过。地块左侧为越秀亲爱里项目，距地铁六号线第一师范学</p>
                     <div class="column_block_text_time"><span>2020-04-27 09:26:14</span></div>
                 </div>
                 <div class="clearfix"></div>
             </div>
             <div class="column_block">
                 <div class="column_block_img">
                     <a href="/cs/tdzx/11995.html">

                         <img src='https://news.centanet.com/uploads/200421/14-2004111134126.jpg'
                              alt='溢价34%！帝辰置业丁字镇再落一子！' width='238' height='182'/>
                     </a>
                 </div>
                 <div class="column_block_text">
                     <div class="column_block_text_title">
                         <a href="/cs/tdzx/11995.html" target="_blank">溢价34%！帝辰置业丁字镇再落一子！</a>
                     </div>
                     <p class="column_block_text_para">[2020]望城区006号 [2020]望城区006号：
                         宗地位于望城区丁字镇板块，丁字湾街道芙蓉北路与青石路交叉口东南角。地块为商住混合用地，总建面约8.9万方，其中住宅约6万方，商业2.8万方，</p>
                     <div class="column_block_text_time"><span>2020-04-21 13:39:54</span></div>
                 </div>
                 <div class="clearfix"></div>
             </div>
             <div class="column_block">
                 <div class="column_block_img">
                     <a href="/cs/tdzx/11956.html">

                         <img src='https://news.centanet.com/uploads/allimg/200417/14-20041142150-l.png'
                              alt='年后首熔断！5家房企抢占望城中心商住用地，最终花落谁家？' width='238' height='182'/>
                     </a>
                 </div>
                 <div class="column_block_text">
                     <div class="column_block_text_title">
                         <a href="/cs/tdzx/11956.html" target="_blank">年后首熔断！5家房企抢占望城中心商住用地，最终花落谁家？</a>
                     </div>
                     <p class="column_block_text_para">[2020]望城区005号 [2020]望城区005号：
                         宗地位于望城区望城中心板块，旺旺西路与郭亮南路交叉口西南角，南临聚缘路。地块为商住混合用地，总建面约27.64万方，其中住宅约24.87万方，商</p>
                     <div class="column_block_text_time"><span>2020-04-17 11:41:57</span></div>
                 </div>
                 <div class="clearfix"></div>
             </div>

         </div>
         <div class="column3" style="display: none;">
             <div class="column_block">
                 <div class="column_block_img">
                     <a href="/cs/rdsp/12333.html">

                         <img src='https://news.centanet.com/uploads/allimg/200512/14-20051200340-l.jpg'
                              alt='【重磅】长沙房地产月报2020年4月' width='238' height='182'/>
                     </a>
                 </div>
                 <div class="column_block_text">
                     <div class="column_block_text_title">
                         <a href="/cs/rdsp/12333.html" target="_blank">【重磅】长沙房地产月报2020年4月</a>
                     </div>
                     <p class="column_block_text_para"></p>
                     <div class="column_block_text_time"><span>2020-05-12 11:59:55</span></div>
                 </div>
                 <div class="clearfix"></div>
             </div>
             <div class="column_block">
                 <div class="column_block_img">
                     <a href="/cs/rdsp/11902.html">

                         <img src='https://news.centanet.com/uploads/allimg/200413/14-2004131312530-L.png'
                              alt='【重磅】长沙房地产月报2020年3月' width='238' height='182'/>
                     </a>
                 </div>
                 <div class="column_block_text">
                     <div class="column_block_text_title">
                         <a href="/cs/rdsp/11902.html" target="_blank">【重磅】长沙房地产月报2020年3月</a>
                     </div>
                     <p class="column_block_text_para"></p>
                     <div class="column_block_text_time"><span>2020-04-13 13:07:18</span></div>
                 </div>
                 <div class="clearfix"></div>
             </div>
             <div class="column_block">
                 <div class="column_block_img">
                     <a href="/cs/rdsp/11654.html">

                         <img src='https://news.centanet.com/uploads/allimg/200330/14-2003301043580-L.jpg'
                              alt='【重磅】长沙房地产月报2020年2月' width='238' height='182'/>
                     </a>
                 </div>
                 <div class="column_block_text">
                     <div class="column_block_text_title">
                         <a href="/cs/rdsp/11654.html" target="_blank">【重磅】长沙房地产月报2020年2月</a>
                     </div>
                     <p class="column_block_text_para"></p>
                     <div class="column_block_text_time"><span>2020-03-30 10:42:42</span></div>
                 </div>
                 <div class="clearfix"></div>
             </div>
             <div class="column_block">
                 <div class="column_block_img">
                     <a href="/cs/rdsp/11640.html">

                         <img src='https://news.centanet.com/uploads/allimg/200327/14-20032G544330-L.jpg'
                              alt='【重磅】长沙房地产月报2020年1月' width='238' height='182'/>
                     </a>
                 </div>
                 <div class="column_block_text">
                     <div class="column_block_text_title">
                         <a href="/cs/rdsp/11640.html" target="_blank">【重磅】长沙房地产月报2020年1月</a>
                     </div>
                     <p class="column_block_text_para"></p>
                     <div class="column_block_text_time"><span>2020-03-27 15:38:26</span></div>
                 </div>
                 <div class="clearfix"></div>
             </div>
             <div class="column_block">
                 <div class="column_block_img">
                     <a href="/cs/rdsp/8701.html">

                         <img src='https://news.centanet.com/uploads/allimg/181127/14-1Q12G331400-L.jpg'
                              alt='【重磅】长沙市10月楼市销售排行榜！' width='238' height='182'/>
                     </a>
                 </div>
                 <div class="column_block_text">
                     <div class="column_block_text_title">
                         <a href="/cs/rdsp/8701.html" target="_blank">【重磅】长沙市10月楼市销售排行榜！</a>
                     </div>
                     <p class="column_block_text_para">数据说明 统计范围：长沙市内五区在售项目（商品住宅） 时间跨度：2018年10月1日-10月31日
                         物业说明：商品住宅仅包含70年产权各类住宅，不包含40年产权公寓、写字楼、商铺、工业等</p>
                     <div class="column_block_text_time"><span>2018-11-27 13:25:32</span></div>
                 </div>
                 <div class="clearfix"></div>
             </div>

         </div>--%>
    </div>

    <%--right--%>
    <%--右侧栏目--%>

    <div class="content_column_right">
        <c:forEach items="${types}" var="t">
            <c:if test="${t.location == 'right'}">
                <!-- 老胡看市 -->
                <div class="content_column_right_block">
                    <div class="content_column_right_title">
                        <a href="/${cityen}/c${t.id}/" target="_blank">${t.columnsName}</a>
                    </div>
                    <div class="content_column_right_bar"></div>
                        <%--符合右边栏目的文章--%>
                    <c:forEach items="${news}" var="n">
                        <c:if test="${n.TypeID == t.id}">
                            <div class="content_column_right_article">
                                <a title="${n.Title}" target="_blank" href="/cs/lhks/12310.html">${n.Title}</a>
                            </div>
                        </c:if>
                    </c:forEach>
                        <%--  <div class="content_column_right_article">
                              <a title="老胡看市第18期【2020.04.26-2020.05.02】" target="_blank"
                                 href="/cs/lhks/12251.html">老胡看市第18期【2020.04.26-2020.05.02】</a>
                          </div>
                          <div class="content_column_right_article">
                              <a title="老胡看市第17期【2020.04.19-2020.04.25】" target="_blank"
                                 href="/cs/lhks/12199.html">老胡看市第17期【2020.04.19-2020.04.25】</a>
                          </div>--%>

                </div>
                <!-- 老胡看市 -->
                <%-- <div class="content_column_right_block">
                     <div class="content_column_right_title">
                         <a href="/cs/lhks/" target="_blank">老胡看市</a>
                     </div>
                     <div class="content_column_right_bar"></div>
                     <div class="content_column_right_article">
                         <a title="老胡看市第19期【2020.05.03-2020.05.09】" target="_blank"
                            href="/cs/lhks/12310.html">老胡看市第19期【2020.05.03-2020.05.09】</a>
                     </div>
                     <div class="content_column_right_article">
                         <a title="老胡看市第18期【2020.04.26-2020.05.02】" target="_blank"
                            href="/cs/lhks/12251.html">老胡看市第18期【2020.04.26-2020.05.02】</a>
                     </div>
                     <div class="content_column_right_article">
                         <a title="老胡看市第17期【2020.04.19-2020.04.25】" target="_blank"
                            href="/cs/lhks/12199.html">老胡看市第17期【2020.04.19-2020.04.25】</a>
                     </div>

                 </div>--%>
            </c:if>
        </c:forEach>

        <%--  <!-- 中原集团资讯-->
          <div class="content_column_right_block">
              <div class="content_column_right_title">
                  <a href="/jt/jtzx/" target="_blank">中原集团资讯</a>
              </div>
              <div class="content_column_right_bar"></div>
              <div class="content_column_right_article">
                  <a title="美的置业全国客户服务中心正式上线" target="_blank" href="/jt/jtzx/12295.html">美的置业全国客户服务中心正式上线</a>
              </div>
              <div class="content_column_right_article">
                  <a title="不可购房炒股 互联网贷款立新规" target="_blank" href="/jt/jtzx/12294.html">不可购房炒股 互联网贷款立新规</a>
              </div>
              <div class="content_column_right_article">
                  <a title="卖房不如养猪？万科养猪究竟为了啥？" target="_blank" href="/jt/jtzx/12292.html">卖房不如养猪？万科养猪究竟为了啥？</a>
              </div>

          </div>
          <!--中原研究院-->
          <div class="content_column_right_block">
              <div class="content_column_right_title">
                  <a href="/jt/yjy/" target="_blank">中原研究院</a>
              </div>
              <div class="content_column_right_bar"></div>
              <div class="content_column_right_article">
                  <a title="【中原周报】调控环境日益从严京“法拍房”纳入限购" target="_blank"
                     href="/jt/yjy/2690.html">【中原周报】调控环境日益从严京“法拍房”纳入限购</a>
              </div>
              <div class="content_column_right_article">
                  <a title="【中原月报】传统阳春楼市回暖 调控之下热度难续" target="_blank" href="/jt/yjy/2428.html">【中原月报】传统阳春楼市回暖
                      调控之下热度难续</a>
              </div>
              <div class="content_column_right_article">
                  <a title="【中原月报】传统淡季叠加新政 年初市场成交萎缩" target="_blank" href="/jt/yjy/1910.html">【中原月报】传统淡季叠加新政
                      年初市场成交萎缩</a>
              </div>

          </div>
          <!--专家点评-->
          <div class="content_column_right_block">
              <div class="content_column_right_title">
                  <a href="/jt/zjdp/" target="_blank">专家点评</a>
              </div>
              <div class="content_column_right_bar"></div>
              <div class="content_column_right_article">
                  <a title="程博士点评：信贷环境日益收紧节后楼市逐步复苏" target="_blank"
                     href="/jt/zjdp/1752.html">程博士点评：信贷环境日益收紧节后楼市逐步复苏</a>
              </div>
              <div class="content_column_right_article">
                  <a title="程博士点评：各地调控态度坚定 土地财政依赖难改" target="_blank" href="/jt/zjdp/1625.html">程博士点评：各地调控态度坚定
                      土地财政依赖难改</a>
              </div>
              <div class="content_column_right_article">
                  <a title="程博士点评：武汉郑州政策加码 低位徘徊" target="_blank" href="/jt/zjdp/1485.html">程博士点评：武汉郑州政策加码 低位徘徊</a>
              </div>

          </div>--%>
    </div>
    <div class="clearfix"></div>
</div>
<div class="page_ul">
    <div class="page_ul_div">
        ——————<span>
            </span><a href="/${cityen}//" name="a_moreinfo" target="_blank">查看更多</a>
        <span>    </span>——————
    </div>
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/foot.jsp" %>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>

<script>
    $(function () {
        $("a[name='stringbt']").each(function () {
            var sr = $(this).text();
            if (sr.length > 25) {
                sr = sr.substring(0, 25);
                $(this).text(sr + "...");
            }
        });
        $('.content_nav_left > a').mouseenter(function () {
            console.log('click tab');
            //this加上active
            //console.log($(this).attr('ref'));
            $('.content_nav_left > a').removeClass("active");
            $(this).addClass("active");
            let type = $(this).attr('ref');
            let cityen = '${cityen}';
            $("a[name='a_moreinfo']").attr('href', '/' + cityen + '/c' + type);
            //显示对应文章列表
            //$('.content_column_left >.column1 >.column_block ').hide().filter('type'+type).show();
            $('.content_column_left >.column1 >.column_block ').hide();
            $('.content_column_left >.column1 >.column_block ').filter('.type' + type).show();
            //$(".programa  li[ref=" + index + "]").find('a').addClass("active").parent().siblings().children("a").removeClass("active");
        })
        //默认显示第一个栏目的文章列表

    })
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
            0: "/" + cityen + "/list?key=" + searchkey,
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

    /*$("#yjbg").mouseenter(
        function () {
            $(this).addClass('active').siblings().removeClass('active');
            $(".column2").hide();
            $(".column3").hide();
            $(".column1").show();
            $("a[name='a_moreinfo']").attr('href', '/cs/yjcg/');
        }
    )
    $("#tdzx").mouseenter(
        function () {
            $(this).addClass('active').siblings().removeClass('active');
            $(".column1").hide();
            $(".column3").hide();
            $(".column2").show();
            $("a[name='a_moreinfo']").attr('href', '/cs/tdzx/');
        }
    )
    $("#xfzx").mouseenter(
        function () {
            $(this).addClass('active').siblings().removeClass('active');
            $(".column1").hide();
            $(".column2").hide();
            $(".column3").show();
            $("a[name='a_moreinfo']").attr('href', '/cs/rdsp/');
        }
    )*/

</script>

<%--<div class="section-wrap section-footer">
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
                <a target="_blank" href="http://hk.centanet.com/" title="香港中原">香港中原</a>
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
            </dd>
        </dl>
        <dl class="all-hlink">
            <dt>相关信息：</dt>
            <dd>
                <a target="_blank" href="https://cs.centanet.com/xinfang/">长沙新房</a>
                <a target="_blank" href="https://cs.centanet.com/xinfang/ditie/">地铁找房</a>
                <a target="_blank" href="https://cs.centanet.com/xinfang/ditu/">地图找房</a>
            </dd>
        </dl>
    </div>

</div>--%>

<!--右侧贴边导航quick_links.js控制-->
<!--[if lte IE 8]>
<%--<script src="sidebar/ie_better.js"></script>
<![endif]-->
<script type="text/javascript">
    $(function () {
        var w = 1200;
        var l = 0;
        var timer = null;
        var len = $(".scroll_li").length * 2;
        $(".scroll_ul").append($(".scroll_ul").html()).css({
            'width': len * w,
            'left': -len * w / 2
        });
        $(".scroll_ul").append($(".scroll_ul").html()).css({
            'width': len * w,
            'left': -len * w / 2
        });

        timer = setInterval(init, 4000);

        function init() {
            $(".scroll .next").trigger('click');
        }

        $(".scroll_li").hover(function () {
            clearInterval(timer);
        }, function () {
            timer = setInterval(init, 4000);
        });

        $(".prev").click(function () {
            l = parseInt($(".scroll_ul").css("left")) + w;
            showCurrent(l);
        });

        $(".next").click(function () {
            l = parseInt($(".scroll_ul").css("left")) - w;
            showCurrent(l);
        });

        function showCurrent(l) {
            if ($(".scroll_ul").is(':animated')) {
                return;
            }
            $(".scroll_ul").animate({
                "left": l
            }, 500, function () {
                if (l == 0) {
                    $(".scroll_ul").css("left", -len * w / 2);
                } else if (l == (1 - len) * w) {
                    $(".scroll_ul").css('left', (1 - len / 2) * w);
                }
            });
        }
    });
</script>
<script>
    $(function () {
        var allPanelsSta = $('.infor-side-pB > dd').hide();
        var fistPanels = $('.infor-side-pB dd:first').show();
        var allPanelsStaB = $('.infor-side-pC > dd').hide();
        var fistPanelsB = $('.infor-side-pC dd:first').show();

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

        $('.infor-side-pC > dt > a').click(function () {
            var allPanels = $('.infor-side-pC > dd');
            //allPanels.slideUp();
            var that = $(this).parent().next();
            var otherPanels = allPanels.not(that);
            otherPanels.slideUp();
            $('.infor-side-pC > dt').removeClass('curr');
            $(this).parent().next().slideDown();
            $(this).parent().addClass('curr');
            return false;
        });
    });
</script>--%>
<script src="${staticurl}/js/listp2.js"></script>
<div class="none">
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?d1253c256287c312b64e372be0f329e9";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

</div>
</body>

</html>