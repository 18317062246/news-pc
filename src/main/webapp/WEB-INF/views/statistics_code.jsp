<%--
  Created by IntelliJ IDEA.
  User: wbyuhai
  Date: 2020/6/2
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <c:choose>

        <%-- 北京城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'bj'}">
            <div class="none"><script type="text/javascript">
                function addLoadEvent(func) {
                    window.addEventListener && window.addEventListener("load", func, false);
                    window.attachEvent && window.attachEvent("onload", func);
                }
                /* 百度统计代码 */
                var _hmt = _hmt || [];
                (function() {
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?219872fb6de637cac5884769682da5ad";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                })();

                addLoadEvent(function() {
                    var bp = document.createElement('script');
                    var curProtocol = window.location.protocol.split(':')[0];
                    if (curProtocol === 'https') {
                        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                    }
                    else {
                        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                    }
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(bp, s);
                });
            </script><script type="text/javascript">
                addLoadEvent(function(){
                    var pkBaseURL = "//statistics.centanet.com/stat/";

                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 10);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                });
            </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=10" style="border:0" alt="" /></p></noscript></div>
        </c:when>

        <%-- 广州城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'gz'}">
            <div class="none">
                <script type="text/javascript">
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?2601a0f4477572ee12d6c06945adc380";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
                <!-- Piwik -->
                <script type="text/javascript">
                    var pkBaseURL = (("https:" == document.location.protocol) ? "//statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                    document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' async='async'   type='text/javascript'%3E%3C/script%3E"));
                </script>

                <script type="text/javascript">
                    try {
                        var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 24);
                        piwikTracker.trackPageView();
                        piwikTracker.enableLinkTracking();
                    } catch (err) { }
                </script>
                <noscript>
                    <p><img src="//statistics.centanet.com/stat/piwik.php?idsite=24" style="border:0" alt="" /></p>
                </noscript>
                <!-- End Piwik Tracking Code -->
            </div>
        </c:when>

        <%-- 武汉城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'wh'}">

            <div class="none">
                <script>
                    var _hmt = _hmt || [];
                    (function() {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?4e7fa5ad81abe58a299a64870b79c27d";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
                <script>
                    (function() {
                        var bp = document.createElement('script');
                        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(bp, s);
                    })();
                </script>
                <!-- Piwik -->
                <script type="text/javascript">
                    var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                    document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
                </script>
                <script src="//statistics.centanet.com/stat/piwik.js" type="text/javascript"></script>
                <script type="text/javascript">
                    try {
                        var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 23);
                        piwikTracker.trackPageView();
                        piwikTracker.enableLinkTracking();
                    } catch (err) {}
                </script>
                <noscript>
                    <p><img src="//statistics.centanet.com/stat/piwik.php?idsite=23" style="border:0" alt="" /></p>
                </noscript>
                <!-- End Piwik Tracking Code -->
            </div>
        </c:when>

        <%-- 南京城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'nj'}">


            <!-- Piwik -->

            <div style="display: none">

                <script type="text/javascript">
                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }

                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function() {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?8f3de1327dc48d80678dc34da6755856";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });

                    addLoadEvent(function() {
                        var bp = document.createElement('script');
                        var curProtocol = window.location.protocol.split(':')[0];
                        if (curProtocol === 'https') {
                            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                        }
                        else {
                            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                        }
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(bp, s);
                    });
                </script>


                <script type="text/javascript">
                    addLoadEvent(function(){
                        var pkBaseURL = "//statistics.centanet.com/stat/";

                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function(){
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 19);
                                piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                            } catch( err ) {}
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        var head = document.head || document.getElementsByTagName('head')[0];
                        head.appendChild(piwikScript);
                    });
                </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=19" style="border:0" alt="" /></p></noscript>

            </div>

        </c:when>

        <%-- 东莞城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'dg'}">


            <!-- Piwik -->
            <div style="display: none">

                <script type="text/javascript">
                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }

                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function() {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?2f6d616e8e52a77d771d325d2647cf4c";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });

                    addLoadEvent(function() {
                        var bp = document.createElement('script');
                        var curProtocol = window.location.protocol.split(':')[0];
                        if (curProtocol === 'https') {
                            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                        }
                        else {
                            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                        }
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(bp, s);
                    });
                </script>


                <script type="text/javascript">
                    addLoadEvent(function(){
                        var pkBaseURL = "//statistics.centanet.com/stat/";

                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function(){
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 22);
                                piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                            } catch( err ) {}
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        var head = document.head || document.getElementsByTagName('head')[0];
                        head.appendChild(piwikScript);
                    });
                </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=22" style="border:0" alt="" /></p></noscript>

            </div>
        </c:when>

        <%-- 佛山城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'fs'}">


            <!-- Piwik -->
            <div style="display: none">

                <script type="text/javascript">
                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }

                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function() {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?9d140f7f31673e85dd833d039c5e064f";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });

                    addLoadEvent(function() {
                        var bp = document.createElement('script');
                        var curProtocol = window.location.protocol.split(':')[0];
                        if (curProtocol === 'https') {
                            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                        }
                        else {
                            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                        }
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(bp, s);
                    });
                </script>


                <script type="text/javascript">
                    addLoadEvent(function(){
                        var pkBaseURL = "//statistics.centanet.com/stat/";

                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function(){
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 22);
                                piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                            } catch( err ) {}
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        var head = document.head || document.getElementsByTagName('head')[0];
                        head.appendChild(piwikScript);
                    });
                </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=22" style="border:0" alt="" /></p></noscript>

            </div>
        </c:when>

        <%-- 肇庆城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'zq'}">
            <!-- Piwik -->
            <div style="display: none">

                <script type="text/javascript">
                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }

                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function() {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?ffc3eb618888cc91ba1f77ecabd3edee";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });

                    addLoadEvent(function() {
                        var bp = document.createElement('script');
                        var curProtocol = window.location.protocol.split(':')[0];
                        if (curProtocol === 'https') {
                            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                        }
                        else {
                            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                        }
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(bp, s);
                    });
                </script>


                <script type="text/javascript">
                    addLoadEvent(function(){
                        var pkBaseURL = "//statistics.centanet.com/stat/";

                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function(){
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 22);
                                piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                            } catch( err ) {}
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        var head = document.head || document.getElementsByTagName('head')[0];
                        head.appendChild(piwikScript);
                    });
                </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=22" style="border:0" alt="" /></p></noscript>

            </div>
        </c:when>

        <%-- 惠州城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'hz'}">
            <!-- Piwik -->
            <div style="display: none">

                <script type="text/javascript">
                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }
                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function() {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?146f32f671b90ea8cf458d1c2be0cfcb";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });

                    addLoadEvent(function() {
                        var bp = document.createElement('script');
                        var curProtocol = window.location.protocol.split(':')[0];
                        if (curProtocol === 'https') {
                            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                        }
                        else {
                            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                        }
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(bp, s);
                    });
                </script>


                <script type="text/javascript">
                    addLoadEvent(function(){
                        var pkBaseURL = "//statistics.centanet.com/stat/";

                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function(){
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 27);
                                piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                            } catch( err ) {}
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        var head = document.head || document.getElementsByTagName('head')[0];
                        head.appendChild(piwikScript);
                    });
                </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=27" style="border:0" alt="" /></p></noscript>

            </div>

            <!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 珠海城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'zh'}">
            <div class="none">
                <script type="text/javascript">
                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }
                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function () {
                        var hm = document.createElement("script");
                        hm.src = "https://hm.baidu.com/hm.js?4fbbbc8d2c74eb9c962bfba45954967a";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });
                </script>
                <script type="text/javascript">
                    addLoadEvent(function () {
                        var pkBaseURL = "//statistics.centanet.com/stat/";

                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function () {
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 34);
                                piwikTracker.trackPageView(); piwikTracker.enableLinkTracking();
                            } catch (err) { }
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        var head = document.head || document.getElementsByTagName('head')[0];
                        head.appendChild(piwikScript);
                    });
                </script>
                <noscript>
                    <p>
                        <img src="//statistics.centanet.com/stat/piwik.php?idsite=34" style="border: 0" alt="" /></p>
                </noscript>
            </div>
        </c:when>

        <%-- 长沙城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'cs'}">
            <div class="none">
                <script>
                    var _hmt = _hmt || [];
                    (function() {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?d1253c256287c312b64e372be0f329e9";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
                <script>
                    (function() {
                        var bp = document.createElement('script');
                        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(bp, s);
                    })();
                </script>
                <!-- Piwik -->
                <script type="text/javascript">
                    var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                    document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
                </script>
                <script src="//statistics.centanet.com/stat/piwik.js" type="text/javascript"></script>
                <script type="text/javascript">
                    try {
                        var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 23);
                        piwikTracker.trackPageView();
                        piwikTracker.enableLinkTracking();
                    } catch (err) {}
                </script>
                <noscript>
                    <p><img src="//statistics.centanet.com/stat/piwik.php?idsite=23" style="border:0" alt="" /></p>
                </noscript>
                <!-- End Piwik Tracking Code -->
            </div>
        </c:when>

        <%-- 长春城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'cc'}">
            <!-- Piwik -->
            <div style="display: none">
                <script type="text/javascript">

                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }

                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?9e60d61e23f8fd34caec6dc214596e61";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });
                </script>
                <script type="text/javascript">
                    addLoadEvent(function () {
                        var pkBaseURL = "//statistics.centanet.com/stat/";
                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function () {
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 30);
                                piwikTracker.trackPageView(); piwikTracker.enableLinkTracking();
                            } catch (err) { }
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        document.head.appendChild(piwikScript);
                    });
                </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=30" style="border:0" alt="" /></p></noscript>
            </div>
            <script src="//act.centanet.com/www/scripts/replace.js" type="text/javascript"> </script>
            <!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 沈阳城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'sy'}">
            <div class="none">
                <script type="text/javascript">
                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }
                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function() {
                        var hm = document.createElement("script");
                        hm.src = "https://hm.baidu.com/hm.js?9b3fcfcc3867810b024107e15ec07060";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });
                    addLoadEvent(function(){
                        var pkBaseURL = "//statistics.centanet.com/stat/";

                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function(){
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                                piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                            } catch( err ) {}
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        var head = document.head || document.getElementsByTagName('head')[0];
                        head.appendChild(piwikScript);
                    });
                </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" /></p></noscript>
            </div>

        </c:when>

        <%-- 大连城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'dl'}">
            <div class="none"><script type="text/javascript">
                function addLoadEvent(func) {
                    window.addEventListener && window.addEventListener("load", func, false);
                    window.attachEvent && window.attachEvent("onload", func);
                }
                /* 百度统计代码 */
                var _hmt = _hmt || [];
                addLoadEvent(function() {
                    var hm = document.createElement("script");
                    hm.src = "//hm.baidu.com/hm.js?d7e057980a269e00ba70794666dd0ae4";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                });
            </script><script type="text/javascript">
                addLoadEvent(function(){
                    var pkBaseURL = "//statistics.centanet.com/stat/";

                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 29);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                });
            </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=30" style="border:0" alt="" /></p></noscript></div>
        </c:when>

        <%-- 哈尔滨城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'hrb'}">
            <!-- Piwik -->
            <div style="display: none">
                <script type="text/javascript">

                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }

                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?9b3fcfcc3867810b024107e15ec07060";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });
                </script>
                <script type="text/javascript">
                    addLoadEvent(function () {
                        var pkBaseURL = "//statistics.centanet.com/stat/";
                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function () {
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 30);
                                piwikTracker.trackPageView(); piwikTracker.enableLinkTracking();
                            } catch (err) { }
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        document.head.appendChild(piwikScript);
                    });
                </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=30" style="border:0" alt="" /></p></noscript>
            </div>
            <script src="//act.centanet.com/www/scripts/replace.js" type="text/javascript"> </script>
            <!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 中山城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'zs'}">
            <!-- Piwik -->
            <div style="display: none">

                <script type="text/javascript">
                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }

                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function() {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?1578a27ed0974189bd3a893f9240b0ca";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });

                    addLoadEvent(function() {
                        var bp = document.createElement('script');
                        var curProtocol = window.location.protocol.split(':')[0];
                        if (curProtocol === 'https') {
                            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                        }
                        else {
                            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                        }
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(bp, s);
                    });
                </script>


                <script type="text/javascript">
                    addLoadEvent(function(){
                        var pkBaseURL = "//statistics.centanet.com/stat/";

                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function(){
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 22);
                                piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                            } catch( err ) {}
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        var head = document.head || document.getElementsByTagName('head')[0];
                        head.appendChild(piwikScript);
                    });
                </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=22" style="border:0" alt="" /></p></noscript>

            </div>
        </c:when>

        <%-- 厦门城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'xm'}">
            <!-- Piwik -->

            <div style="display: none">

                <script type="text/javascript">
                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }

                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function() {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?acbbc78202b4846d4a5831521ccf7c45";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });

                    addLoadEvent(function() {
                        var bp = document.createElement('script');
                        var curProtocol = window.location.protocol.split(':')[0];
                        if (curProtocol === 'https') {
                            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                        }
                        else {
                            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                        }
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(bp, s);
                    });
                </script>


                <script type="text/javascript">
                    addLoadEvent(function(){
                        var pkBaseURL = "//statistics.centanet.com/stat/";

                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function(){
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 19);
                                piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                            } catch( err ) {}
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        var head = document.head || document.getElementsByTagName('head')[0];
                        head.appendChild(piwikScript);
                    });
                </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=19" style="border:0" alt="" /></p></noscript>

            </div>
        </c:when>

        <%-- 杭州城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'zj'}">
            <!-- Piwik -->

            <div style="display: none">
                <script type="text/javascript">
                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }
                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function() {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?cc857879870b96422ad7c1a271b2b1b0";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });

                    addLoadEvent(function() {
                        var bp = document.createElement('script');
                        var curProtocol = window.location.protocol.split(':')[0];
                        if (curProtocol === 'https') {
                            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                        }
                        else {
                            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                        }
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(bp, s);
                    });
                </script>

                <script type="text/javascript">
                    addLoadEvent(function(){
                        var pkBaseURL = "//statistics.centanet.com/stat/";

                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function(){
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 27);
                                piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                            } catch( err ) {}
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        var head = document.head || document.getElementsByTagName('head')[0];
                        head.appendChild(piwikScript);
                    });
                </script>
                <noscript>
                    <p><img src="//statistics.centanet.com/stat/piwik.php?idsite=27" style="border:0" alt="" /></p>
                </noscript>
            </div>
            <!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 福州城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'fz'}">
            <!-- Piwik -->
            <div style="display: none">

                <script type="text/javascript">
                    function addLoadEvent(func) {
                        window.addEventListener && window.addEventListener("load", func, false);
                        window.attachEvent && window.attachEvent("onload", func);
                    }

                    /* 百度统计代码 */
                    var _hmt = _hmt || [];
                    addLoadEvent(function() {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?3ed153a3c40ce29250ffbd4617651da0";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    });

                    addLoadEvent(function() {
                        var bp = document.createElement('script');
                        var curProtocol = window.location.protocol.split(':')[0];
                        if (curProtocol === 'https') {
                            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                        }
                        else {
                            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                        }
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(bp, s);
                    });
                </script>


                <script type="text/javascript">
                    addLoadEvent(function(){
                        var pkBaseURL = "//statistics.centanet.com/stat/";

                        var piwikScript = window["document"]["createElement"]("script");
                        piwikScript["type"] = "text/javascript";
                        piwikScript["charset"] = "utf-8";
                        piwikScript["defer"] = "defer";
                        piwikScript["onload"] = function(){
                            try {
                                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 22);
                                piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                            } catch( err ) {}
                        };
                        piwikScript["src"] = pkBaseURL + "piwik.js";
                        var head = document.head || document.getElementsByTagName('head')[0];
                        head.appendChild(piwikScript);
                    });
                </script>
                <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=22" style="border:0" alt="" /></p></noscript>

            </div>
        </c:when>

        <c:when test="${cityen == 'sz'}">
            <script type="text/javascript">
                var _paq = _paq || [];
                var pkBaseURL  = "//sznewpiwik.centanet.com/stat/";
                (function(){
                /* 百度统计代码 */
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?5ba699e44b8a99227ac7a04f91a66196";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);

                var bp = document.createElement('script');
                var curProtocol = window.location.protocol.split(':')[0];
                if (curProtocol === 'https') {
                bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                }
                else {
                bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                }
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(bp, s);
                /*piwik*/
                var piwikScript = window["document"]["createElement"]("script");
                piwikScript["type"] = "text/javascript";
                piwikScript["charset"] = "utf-8";
                piwikScript["defer"] = "defer";
                piwikScript["onload"] = function(){
                try {
                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 41);
                piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                } catch( err ) {}
                };
                piwikScript["src"] = pkBaseURL + "piwik.js";
                var head = document.head || document.getElementsByTagName('head')[0];
                head.appendChild(piwikScript);
                })();</script><noscript><p><img src="//sznewpiwik.centanet.com/stat/piwik.php?idsite=41" style="border:0" alt="" /></p></noscript>
        </c:when>

        <c:when test="${cityen == 'tj'}">
            <script type="text/javascript">

            var _hmt = _hmt || [];
            var pkBaseURL = "//statistics.centanet.com/stat/";
            (function(){
                /* 百度统计代码 */
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?5355df1cf87f7b87cd509f27a92fc4d7";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
                /*piwik*/
                var piwikScript = window["document"]["createElement"]("script");
                piwikScript["type"] = "text/javascript";
                piwikScript["charset"] = "utf-8";
                piwikScript["defer"] = "defer";
                piwikScript["onload"] = function(){
                    try {
                        var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 12);
                        piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                    } catch( err ) {}
                };
                piwikScript["src"] = pkBaseURL + "piwik.js";
                var head = document.head || document.getElementsByTagName('head')[0];
                head.appendChild(piwikScript);
            })();</script><noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=12" style="border:0" alt="" /></p></noscript>
        </c:when>

        <c:when test="${cityen == 'xm'}">
            <script type="text/javascript">
                var pkBaseURL = "//statistics.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?acbbc78202b4846d4a5831521ccf7c45";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 44);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();</script><noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=44" style="border:0" alt="" /></p></noscript>
        </c:when>

        <c:when test="${cityen == 'nb'}">
            <script type="text/javascript">
                var _hmt = _hmt || [];
                var pkBaseURL = "//statistics.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?6fb464487d596d8be4d9bdc7a25128e4";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 36);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();
            </script>
            <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=36" style="border:0" alt="" /></p></noscript>
        </c:when>

        <c:when test="${cityen == 'zs'}">
            <script type="text/javascript">
                var _hmt = _hmt || [];
                var pkBaseURL = "//statistics.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?1578a27ed0974189bd3a893f9240b0ca";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php",43);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();
            </script>
            <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=43" style="border:0" alt="" /></p></noscript>
        </c:when>

        <c:when test="${cityen == 'zj'}">
            <script type="text/javascript">
                var _hmt = _hmt || [];
                var pkBaseURL = "//statistics.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?cc857879870b96422ad7c1a271b2b1b0";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 32);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();
            </script>
            <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=32" style="border:0" alt="" /></p></noscript>
        </c:when>

        <c:when test="${cityen == 'zq'}">
            <script type="text/javascript">
                var _hmt = _hmt || [];
                var pkBaseURL = "//statistics.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?ffc3eb618888cc91ba1f77ecabd3edee";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 46);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();
            </script>
            <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=46" style="border:0" alt="" /></p></noscript>
        </c:when>
    </c:choose>

